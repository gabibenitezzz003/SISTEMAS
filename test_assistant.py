import logging
from ia_gtr.ai_assistant import AIAssistant
from ia_gtr.training.train_model import ModelTrainer
from database import db_session, Base, engine

# Configurar logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def train_models():
    """Entrena los modelos con los documentos disponibles"""
    trainer = ModelTrainer()
    
    # Entrenar con documentos
    logger.info("Entrenando modelos...")
    trainer.train_from_directory('ia_gtr/training/manuales')
    trainer.train_from_directory('ia_gtr/training/politicas')
    
    return trainer.knowledge_base

def test_queries():
    # Primero entrenar
    knowledge_base = train_models()
    logger.info(f"Base de conocimiento entrenada con {knowledge_base.index.ntotal} documentos")
    
    # Inicializar el asistente con la base de conocimiento entrenada
    assistant = AIAssistant(db_session, knowledge_base=knowledge_base)
    
    # Lista de preguntas de prueba
    questions = [
        "¿Cómo reseteo una clave en SIDEPRO?",
        "Explícame el proceso de blending",
        "¿Qué hago si hay una incidencia masiva?"
    ]
    
    # Probar cada pregunta
    for question in questions:
        logger.info(f"\nPregunta: {question}")
        response = assistant.process_query(question)
        logger.info(f"Respuesta: {response}\n")
        logger.info("-" * 80)

if __name__ == "__main__":
    # Crear tablas si no existen
    Base.metadata.create_all(engine)
    
    # Ejecutar pruebas
    test_queries() 