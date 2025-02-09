from datetime import datetime, timedelta
import google.generativeai as genai
import os
from models import AIQuery, Employee, Shift
from sqlalchemy import func
import pandas as pd
import json
import logging
from transformers import AutoTokenizer, AutoModel
import torch
from dotenv import load_dotenv

# Importaciones locales
from ia_gtr.utils.document_processor import DocumentProcessor
from ia_gtr.utils.embeddings_generator import EmbeddingsGenerator
from ia_gtr.models.intent_classifier import IntentClassifier
from ia_gtr.models.knowledge_base import KnowledgeBase
from ia_gtr.models.response_generator import ResponseGenerator

# Cargar variables de entorno
load_dotenv()

# Configurar logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class AIAssistant:
    def __init__(self, db_session, knowledge_base=None):
        self.session = db_session
        self.doc_processor = DocumentProcessor()
        self.embeddings_gen = EmbeddingsGenerator()
        self.intent_classifier = IntentClassifier()
        self.knowledge_base = knowledge_base or KnowledgeBase()
        self.response_generator = ResponseGenerator(self.knowledge_base)
        self.conversation_history = []
        
        # Configurar Gemini
        api_key = os.getenv('GEMINI_API_KEY')
        if not api_key:
            raise ValueError("GEMINI_API_KEY no encontrada")
        genai.configure(api_key=api_key)

    def get_system_status(self):
        """Obtiene el estado actual del sistema"""
        try:
            return {
                "empleados_activos": self.session.query(Employee).count(),
                "turnos_activos": self.session.query(Shift).filter(
                    Shift.end_time > datetime.now()
                ).count(),
                "metricas": self.get_performance_metrics(),
                "alertas": self.get_current_issues()
            }
        except Exception as e:
            logger.error(f"Error al obtener estado del sistema: {e}")
            return {}

    def process_query(self, query: str) -> str:
        try:
            # 1. Clasificar intención
            intent = self.intent_classifier.classify(query)
            
            # 2. Generar respuesta usando Gemini y la base de conocimiento
            response = self.response_generator.generate(
                query=query,
                intent=intent,
                embeddings_gen=self.embeddings_gen
            )
            
            # 3. Guardar la interacción
            self.save_interaction(query, response)
            
            return response
            
        except Exception as e:
            logger.error(f"Error en process_query: {str(e)}")
            return "Lo siento, ocurrió un error. Por favor, intenta de nuevo."

    def build_enriched_prompt(self, query: str, system_status: dict) -> str:
        """Construye un prompt enriquecido con todo el contexto necesario"""
        return f"""
        [CONTEXTO DEL SISTEMA GTR]
        {json.dumps(self.knowledge_base, indent=2, ensure_ascii=False)}

        [ESTADO ACTUAL]
        {json.dumps(system_status, indent=2, ensure_ascii=False)}

        [INSTRUCCIONES]
        Eres un asistente experto en el sistema GTR y también un asistente general.
        - Usa el contexto proporcionado para respuestas específicas del sistema
        - Usa tu conocimiento general para otros temas
        - Mantén un tono profesional pero amigable
        - Proporciona ejemplos prácticos cuando sea posible
        - Si no tienes información específica, indícalo
        - Responde siempre en español

        [CONSULTA DEL USUARIO]
        {query}

        [RESPUESTA]
        """

    def generate_response(self, prompt: str) -> str:
        """Genera una respuesta usando el modelo de IA"""
        try:
            # Crear un chat nuevo para cada interacción
            chat = self.model.start_chat(history=[])
            
            # Generar la respuesta
            response = chat.send_message(prompt)
            
            # Verificar si la respuesta es válida
            if response and hasattr(response, 'text'):
                logger.info("Respuesta generada exitosamente")
                return response.text
            else:
                logger.error("La respuesta del modelo no tiene el formato esperado")
                return "Lo siento, no pude generar una respuesta coherente."
            
        except genai.types.generation_types.BlockedPromptException as e:
            logger.error(f"Prompt bloqueado: {str(e)}")
            return "Lo siento, no puedo procesar ese tipo de consulta."
        except genai.types.generation_types.GenerationException as e:
            logger.error(f"Error de generación: {str(e)}")
            return "Hubo un problema al generar la respuesta. Por favor, intenta reformular tu pregunta."
        except Exception as e:
            logger.error(f"Error inesperado al generar respuesta: {str(e)}")
            return f"Error al generar la respuesta: {str(e)}"

    def save_interaction(self, query: str, response: str):
        """Guarda la interacción en el historial local"""
        try:
            # Solo guardar en el historial local
            self.conversation_history.append({
                'query': query,
                'response': response,
                'timestamp': datetime.now().isoformat()
            })
            
            # Intentar guardar en la base de datos si está disponible
            try:
                ai_query = AIQuery(
                    query=query,
                    response=response,
                    timestamp=datetime.now()
                )
                self.session.add(ai_query)
                self.session.commit()
            except Exception as db_error:
                logger.warning(f"No se pudo guardar en la base de datos: {str(db_error)}")
                self.session.rollback()
            
        except Exception as e:
            logger.error(f"Error guardando interacción: {str(e)}")

    def get_performance_metrics(self):
        """Obtiene métricas de rendimiento actualizadas"""
        try:
            return {
                "cobertura_turnos": self.calculate_shift_coverage(),
                "eficiencia": self.calculate_efficiency(),
                "satisfaccion": self.calculate_satisfaction()
            }
        except Exception as e:
            logger.error(f"Error al obtener métricas: {e}")
            return {}

    def calculate_shift_coverage(self):
        """Calcula la cobertura de turnos"""
        try:
            total = self.session.query(Shift).count()
            covered = self.session.query(Shift).filter(Shift.employee_id != None).count()
            return round((covered / total * 100), 2) if total > 0 else 0
        except Exception as e:
            logger.error(f"Error al calcular cobertura: {e}")
            return 0

    def calculate_efficiency(self):
        """Calcula la eficiencia del sistema"""
        return 85.5  # Implementar lógica real

    def calculate_satisfaction(self):
        """Calcula la satisfacción general"""
        return 78.3  # Implementar lógica real

    def train_from_document(self, file_path):
        """Entrena el sistema con un nuevo documento"""
        try:
            # Procesar documento
            text = self.doc_processor.process(file_path)
            
            # Generar embeddings
            embeddings = self.embeddings_gen.batch_generate(text)
            
            # Actualizar base de conocimiento
            self.knowledge_base.update(embeddings)
            
            return True
            
        except Exception as e:
            logger.error(f"Error entrenando con documento: {str(e)}")
            return False 
        