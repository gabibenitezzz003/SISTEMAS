from app import create_app
from app.database import db_session
from app.models import Employee, Shift
from datetime import datetime, timedelta

def init_test_data():
    # Crear algunos empleados de prueba
    employees = [
        Employee(name="Juan Pérez", skill="COM"),
        Employee(name="María García", skill="CROSS"),
        Employee(name="Carlos López", skill="COM"),
        Employee(name="Ana Martínez", skill="CROSS")
    ]
    
    # Agregar empleados a la base de datos
    for employee in employees:
        db_session.add(employee)
    db_session.commit()
    
    # Crear algunos turnos de prueba
    today = datetime.now().date()
    for i in range(7):  # Crear turnos para la próxima semana
        date = today + timedelta(days=i)
        for employee in employees:
            shift = Shift(
                employee=employee,
                date=date,
                shift_type="Mañana" if i % 3 == 0 else "Tarde" if i % 3 == 1 else "Noche",
                is_weekend=i >= 5  # Sábado y domingo
            )
            db_session.add(shift)
    
    db_session.commit()
    print("Datos de prueba inicializados correctamente")

if __name__ == "__main__":
    app = create_app()
    with app.app_context():
        init_test_data() 