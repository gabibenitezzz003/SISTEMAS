from ortools.sat.python import cp_model
import pandas as pd

class ShiftOptimizer:
    def __init__(self, db_session):
        self.session = db_session
        
    def optimize_shifts(self, month, year):
        """Optimiza la asignación de turnos"""
        # Obtener datos necesarios
        employees = self.get_available_employees()
        shifts = self.get_required_shifts(month, year)
        
        # Crear modelo de optimización
        model = cp_model.CpModel()
        
        # Variables de decisión
        assignments = {}
        for employee in employees:
            for shift in shifts:
                assignments[(employee.id, shift['id'])] = model.NewBoolVar(
                    f'assignment_e{employee.id}_s{shift["id"]}'
                )
        
        # Restricciones
        self.add_constraints(model, assignments, employees, shifts)
        
        # Resolver
        solver = cp_model.CpSolver()
        status = solver.Solve(model)
        
        if status == cp_model.OPTIMAL:
            return self.process_solution(solver, assignments, employees, shifts)
        else:
            return None
            
    def add_constraints(self, model, assignments, employees, shifts):
        """Agrega restricciones al modelo"""
        # Cada turno debe tener exactamente un empleado
        for shift in shifts:
            model.Add(
                sum(assignments[(e.id, shift['id'])] for e in employees) == 1
            )
            
        # Cada empleado debe tener al menos un día libre por semana
        for employee in employees:
            for week in range(4):  # Para cada semana del mes
                week_shifts = [s for s in shifts if s['week'] == week]
                model.Add(
                    sum(assignments[(employee.id, s['id'])] for s in week_shifts) <= 5
                )
                
        # No más de 3 turnos nocturnos consecutivos
        for employee in employees:
            night_shifts = [s for s in shifts if s['type'] == 'night']
            for i in range(len(night_shifts) - 2):
                model.Add(
                    sum(assignments[(employee.id, night_shifts[j]['id'])] 
                        for j in range(i, i + 3)) <= 2
                ) 