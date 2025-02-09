import os
import sys
from pathlib import Path

# Agregar el directorio raíz del proyecto al PYTHONPATH
project_root = Path(__file__).parent.parent
sys.path.append(str(project_root))

from app import create_app
from app.database import db_session
from app.models import Asesores, CodigosHorarios

def load_codigos_horarios():
    codigos = [
        {'codigo': 'LICENCIA', 'horas_base': 6.00, 'color': '#FFFF00'},
        {'codigo': 'FALTA INJUSTIFICADA', 'horas_base': 6.00, 'color': '#FFA500'},
        {'codigo': 'CERTIFICADO', 'horas_base': 6.00, 'color': '#00FF00'},
        {'codigo': 'BAJA', 'horas_base': 0.00, 'color': '#FF0000'},
        {'codigo': 'PRESENTE', 'horas_base': 12.00, 'color': '#0000FF'},
        {'codigo': 'ASESOR MESSI', 'horas_base': 5.00, 'color': '#FFD700'},
        {'codigo': 'CAMBIO DE ROL', 'horas_base': 5.00, 'color': '#FF0000'},
        {'codigo': 'CAMBIO DE PRODUCTO', 'horas_base': 0.00, 'color': '#000000'},
        {'codigo': 'DEVOLUCIÓN DE HORAS', 'horas_base': None, 'color': '#800080'}
    ]
    
    for codigo_data in codigos:
        codigo = CodigosHorarios(**codigo_data)
        db_session.add(codigo)
    
    try:
        db_session.commit()
        print("Códigos horarios cargados correctamente")
    except Exception as e:
        db_session.rollback()
        print(f"Error al cargar códigos horarios: {e}")

def load_asesores_from_dias():
    # Obtener asesores únicos de dias_no_habiles
    query = """
    SELECT DISTINCT dni, nombre, lider, skill 
    FROM dias_no_habiles 
    WHERE dni IS NOT NULL
    """
    
    result = db_session.execute(query)
    
    for row in result:
        if not Asesores.query.filter_by(dni=row.dni).first():
            asesor = Asesores(
                dni=row.dni,
                nombre=row.nombre,
                lider=row.lider,
                skill=row.skill
            )
            db_session.add(asesor)
    
    try:
        db_session.commit()
        print("Asesores cargados correctamente desde dias_no_habiles")
    except Exception as e:
        db_session.rollback()
        print(f"Error al cargar asesores: {e}")

def main():
    app = create_app()
    with app.app_context():
        print("Iniciando carga de datos iniciales...")
        load_codigos_horarios()
        load_asesores_from_dias()
        print("Proceso completado")

if __name__ == "__main__":
    main() 