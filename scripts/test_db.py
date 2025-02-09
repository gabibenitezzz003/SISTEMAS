import os
import sys
from pathlib import Path

# Agregar el directorio raíz del proyecto al PYTHONPATH
project_root = Path(__file__).parent.parent
sys.path.append(str(project_root))

from app import create_app
from app.database import db_session
from app.models import Asesores, DiasNoHabiles

def test_connection():
    try:
        # Intentar obtener todos los asesores
        asesores = Asesores.query.all()
        print(f"Conexión exitosa! Número de asesores: {len(asesores)}")
        
        # Intentar obtener días no hábiles
        dias = DiasNoHabiles.query.limit(5).all()
        print("\nPrimeros 5 días no hábiles:")
        for dia in dias:
            print(f"- {dia.fecha}: {dia.nombre} ({dia.horario})")
            
    except Exception as e:
        print(f"Error al conectar con la base de datos: {e}")

if __name__ == "__main__":
    app = create_app()
    with app.app_context():
        test_connection() 