import torch
import torch.nn as nn
import google.generativeai as genai
import os
import logging

logger = logging.getLogger(__name__)

class ResponseGenerator(nn.Module):
    def __init__(self, knowledge_base):
        super().__init__()
        self.knowledge_base = knowledge_base
        
        # Configurar Gemini
        api_key = os.getenv('GEMINI_API_KEY')
        if not api_key:
            raise ValueError("GEMINI_API_KEY no encontrada")
        logger.info("Configurando Gemini con API key")
        genai.configure(api_key=api_key)
        self.model = genai.GenerativeModel('gemini-pro')
        
    def generate(self, query, intent, embeddings_gen):
        """Genera una respuesta usando Gemini y la base de conocimiento"""
        try:
            logger.info(f"Procesando consulta: {query}")
            
            # 1. Generar embedding de la consulta
            query_embedding = embeddings_gen.generate(query)
            logger.info("Embedding generado correctamente")
            
            # 2. Buscar información relevante en la base de conocimiento
            relevant_docs = self.knowledge_base.search_relevant(query_embedding, k=3)
            logger.info(f"Encontrados {len(relevant_docs)} documentos relevantes")
            
            # 3. Extraer el texto de los documentos relevantes
            context = "\n".join([doc.get('text', '') for doc in relevant_docs])
            logger.info(f"Contexto extraído: {context[:200]}...")  # Primeros 200 caracteres
            
            # 4. Construir el prompt para Gemini
            prompt = self._build_prompt(query, intent, context)
            logger.info("Prompt construido correctamente")
            
            # 5. Generar respuesta con Gemini
            logger.info("Enviando prompt a Gemini...")
            response = self.model.generate_content(prompt)
            
            if response and hasattr(response, 'text'):
                logger.info("Respuesta generada exitosamente")
                return response.text
            else:
                logger.warning("La respuesta no tiene el formato esperado")
                return "Lo siento, no pude generar una respuesta coherente."
                
        except Exception as e:
            logger.error(f"Error generando respuesta: {str(e)}", exc_info=True)
            return f"Error al generar la respuesta: {str(e)}"
            
    def _build_prompt(self, query, intent, context):
        """Construye el prompt para Gemini"""
        return f"""
        Eres un asistente experto en el sistema GTR (Gestión de Turnos y Recursos).
        
        CONTEXTO RELEVANTE:
        {context}
        
        INTENCIÓN DETECTADA:
        {intent}
        
        INSTRUCCIONES:
        - Usa el contexto proporcionado para dar una respuesta precisa
        - Si la información no está en el contexto, indícalo
        - Mantén un tono profesional pero amigable
        - Responde siempre en español
        
        CONSULTA DEL USUARIO:
        {query}
        
        RESPUESTA:
        """
        
    def fine_tune(self, embeddings):
        """Ajusta el modelo con nuevos datos"""
        pass 