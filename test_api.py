import requests
import logging

# Configurar logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def test_api():
    url = "http://127.0.0.1:8000/api/query"
    headers = {"Content-Type": "application/json"}
    
    # Lista de preguntas de prueba
    test_queries = [
        # Preguntas sobre procedimientos
        "¿Cómo reseteo una clave en SIDEPRO?",
        "¿Cuál es el proceso de blending?",
        "¿Qué hago si hay una incidencia masiva?",
        
        # Preguntas sobre documentación
        "¿Dónde encuentro el manual de GTR?",
        "Explícame cómo funciona el sistema Avaya",
        
        # Preguntas sobre políticas
        "¿Cuáles son las responsabilidades de un GTR?",
        "¿Qué debo hacer si detecto un error en el sistema?"
    ]
    
    for query in test_queries:
        try:
            logger.info(f"\nPregunta: {query}")
            response = requests.post(url, json={"text": query})
            
            if response.status_code == 200:
                result = response.json()
                logger.info(f"Respuesta: {result['response']}\n")
            else:
                logger.error(f"Error {response.status_code}: {response.text}")
                
            logger.info("-" * 80)
            
        except Exception as e:
            logger.error(f"Error en la solicitud: {str(e)}")

if __name__ == "__main__":
    test_api() 