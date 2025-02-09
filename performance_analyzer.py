import pandas as pd
import numpy as np
from scipy import stats
from sklearn.cluster import KMeans

class PerformanceAnalyzer:
    def __init__(self, db_session):
        self.session = db_session
        
    def analyze_employee_performance(self, employee_id, period):
        """Analiza el rendimiento detallado de un empleado"""
        metrics = {
            'attendance': self.calculate_attendance_score(employee_id, period),
            'punctuality': self.analyze_punctuality(employee_id, period),
            'shift_completion': self.analyze_shift_completion(employee_id, period),
            'overtime_efficiency': self.calculate_overtime_efficiency(employee_id, period),
            'adaptability': self.measure_adaptability(employee_id, period)
        }
        
        recommendations = self.generate_recommendations(metrics)
        trends = self.analyze_performance_trends(employee_id, period)
        
        return {
            'metrics': metrics,
            'recommendations': recommendations,
            'trends': trends,
            'overall_score': self.calculate_overall_score(metrics)
        }
        
    def analyze_department_performance(self, department_id, period):
        """Analiza el rendimiento de un departamento completo"""
        employees = self.get_department_employees(department_id)
        
        department_metrics = {
            'overall_efficiency': self.calculate_department_efficiency(department_id, period),
            'workload_distribution': self.analyze_workload_distribution(department_id, period),
            'team_coordination': self.assess_team_coordination(department_id, period),
            'resource_utilization': self.analyze_resource_utilization(department_id, period)
        }
        
        return {
            'metrics': department_metrics,
            'top_performers': self.identify_top_performers(employees, period),
            'improvement_areas': self.identify_improvement_areas(department_metrics),
            'recommendations': self.generate_department_recommendations(department_metrics)
        }
        
    def generate_performance_report(self, entity_id, period, report_type='employee'):
        """Genera un reporte detallado de rendimiento"""
        if report_type == 'employee':
            data = self.analyze_employee_performance(entity_id, period)
        else:
            data = self.analyze_department_performance(entity_id, period)
            
        visualizations = self.create_performance_visualizations(data)
        insights = self.extract_key_insights(data)
        
        return {
            'data': data,
            'visualizations': visualizations,
            'insights': insights,
            'recommendations': self.generate_actionable_recommendations(data)
        } 