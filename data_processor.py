from sqlalchemy import extract
import pandas as pd
from datetime import datetime
from models import Employee, Shift, MonthlyData

class DNHProcessor:
    def __init__(self, db_session):
        self.session = db_session

    def process_dnh_file(self, file_path: str):
        """Procesa el archivo DNH y almacena los datos"""
        df = pd.read_excel(file_path)
        
        # Procesar y almacenar datos
        for _, row in df.iterrows():
            # Crear o actualizar empleado
            employee = self.get_or_create_employee(row)
            
            # Crear turno
            shift = Shift(
                employee_id=employee.id,
                date=row['fecha'],
                shift_type=row['turno'],
                hours=row['horas'],
                is_weekend=row['fecha'].weekday() >= 5
            )
            self.session.add(shift)
        
        self.session.commit()
        return self.generate_summary()

    def get_or_create_employee(self, row_data):
        """Obtiene o crea un empleado en la base de datos"""
        employee = self.session.query(Employee).filter_by(
            employee_id=row_data['id_empleado']
        ).first()
        
        if not employee:
            employee = Employee(
                employee_id=row_data['id_empleado'],
                name=row_data['nombre'],
                department=row_data['departamento'],
                position=row_data['cargo']
            )
            self.session.add(employee)
            self.session.flush()
        
        return employee

    def generate_weekend_report(self, month: int, year: int):
        """Genera reporte de fines de semana"""
        shifts = self.session.query(Shift).join(Employee).filter(
            Shift.is_weekend == True,
            extract('month', Shift.date) == month,
            extract('year', Shift.date) == year
        ).all()
        
        data = []
        for shift in shifts:
            data.append({
                'Fecha': shift.date,
                'Empleado': shift.employee.name,
                'Turno': shift.shift_type,
                'Horas': shift.hours
            })
        
        df = pd.DataFrame(data)
        return df

    def calculate_monthly_stats(self, month: int, year: int):
        """Calcula estadísticas mensuales"""
        shifts = self.session.query(Shift).filter(
            extract('month', Shift.date) == month,
            extract('year', Shift.date) == year
        ).all()
        
        total_hours = sum(shift.hours for shift in shifts)
        total_shifts = len(shifts)
        
        # Calcular eficiencia (ejemplo simplificado)
        efficiency = (total_hours / (total_shifts * 8)) * 100 if total_shifts > 0 else 0
        
        monthly_data = MonthlyData(
            month=month,
            year=year,
            total_hours=total_hours,
            total_shifts=total_shifts,
            efficiency=efficiency,
            statistics={
                'weekend_shifts': len([s for s in shifts if s.is_weekend]),
                'avg_hours_per_shift': total_hours / total_shifts if total_shifts > 0 else 0
            }
        )
        
        self.session.add(monthly_data)
        self.session.commit()
        
        return monthly_data 