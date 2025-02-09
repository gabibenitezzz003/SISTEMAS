from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, scoped_session
from sqlalchemy.ext.declarative import declarative_base
import os
from dotenv import load_dotenv

# Cargar variables de entorno
load_dotenv()

# Crear la instancia de SQLAlchemy
db = SQLAlchemy()

# Crear el engine de la base de datos
DATABASE_URL = os.getenv('DATABASE_URL', 'sqlite:///gtr.db')
engine = create_engine(DATABASE_URL)

# Crear la sesión
db_session = scoped_session(sessionmaker(bind=engine))

# Base declarativa para los modelos
Base = declarative_base()
Base.query = db_session.query_property()

def init_db():
    """Inicializar la base de datos"""
    try:
        # Importar modelos aquí para asegurar que están registrados
        import models
        Base.metadata.create_all(bind=engine)
        print("Base de datos inicializada correctamente")
    except Exception as e:
        print(f"Error al inicializar la base de datos: {e}")

# Exportar db para que esté disponible en otros módulos
__all__ = ['db', 'db_session', 'Base', 'init_db'] 