from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from database import db_session
from ia_gtr.ai_assistant import AIAssistant
from ia_gtr.training.train_model import ModelTrainer
import logging
from dotenv import load_dotenv
import os

# Cargar variables de entorno
load_dotenv()

# Configurar logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI(title="GTR Assistant API")

# Configurar CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Montar archivos estáticos
app.mount("/static", StaticFiles(directory="static"), name="static")

# Inicializar el asistente con la base de conocimiento entrenada
trainer = ModelTrainer()
knowledge_base = trainer.train_from_directory('ia_gtr/training/manuales')
trainer.train_from_directory('ia_gtr/training/politicas')
assistant = AIAssistant(db_session, knowledge_base=trainer.knowledge_base)

class Query(BaseModel):
    text: str

@app.post("/api/query")
async def process_query(query: Query):
    """Procesa una consulta y retorna la respuesta"""
    try:
        logger.info(f"Recibida consulta: {query.text}")
        response = assistant.process_query(query.text)
        return {"response": response}
    except Exception as e:
        logger.error(f"Error procesando consulta: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/health")
async def health_check():
    """Endpoint para verificar el estado del servicio"""
    return {"status": "healthy"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000) 