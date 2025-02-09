import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    # Configuración para MySQL
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL', 
        'mysql+pymysql://root:password@localhost/gestion_dnh2')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = os.getenv('SECRET_KEY', 'dev')
    
    # Configuración adicional
    TEMPLATES_AUTO_RELOAD = True
    DEBUG = True
