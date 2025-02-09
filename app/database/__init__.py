from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from app.config.config import Config

# Crear el engine de SQLAlchemy
engine = create_engine(Config.SQLALCHEMY_DATABASE_URI, echo=True)

# Crear la sesión
db_session = scoped_session(
    sessionmaker(
        autocommit=False,
        autoflush=False,
        bind=engine
    )
)

# Crear la base declarativa
Base = declarative_base()
Base.query = db_session.query_property()

def init_db():
    """Inicializa la base de datos y crea todas las tablas"""
    import app.models  # Importa los modelos
    Base.metadata.create_all(bind=engine)
    print("Base de datos inicializada correctamente")
