from flask import jsonify, request
from app.routes import analytics_bp
from app.models import DiasNoHabiles, Asesores, CodigosHorarios
from sqlalchemy import func
from datetime import datetime, timedelta
import pandas as pd
import numpy as np

@analytics_bp.route('/dashboard', methods=['GET'])
def get_analytics_dashboard():
    # Período de análisis
    end_date = datetime.now().date()
    start_date = end_date - timedelta(days=90)
    
    # Obtener datos
    shifts = DiasNoHabiles.query.filter(
        DiasNoHabiles.fecha.between(start_date, end_date)
    ).all()
    
    # Convertir a DataFrame
    df = pd.DataFrame([{
        'fecha': s.fecha,
        'skill': s.skill,
        'tipo_dia': s.tipo_dia,
        'horario': s.horario,
        'horas_trabajadas': float(s.horas_trabajadas) if s.horas_trabajadas else 0
    } for s in shifts])
    
    # Análisis
    analytics = {
        'general_stats': {
            'total_shifts': len(df),
            'unique_employees': df['nombre'].nunique(),
            'avg_hours_per_shift': df['horas_trabajadas'].mean()
        },
        'trends': calculate_trends(df),
        'predictions': generate_predictions(df),
        'distribution': calculate_distribution(df)
    }
    
    return jsonify(analytics)

@analytics_bp.route('/export', methods=['GET'])
def export_analytics():
    format_type = request.args.get('format', 'json')
    start_date = request.args.get('start_date')
    end_date = request.args.get('end_date')
    
    # Convertir fechas
    try:
        start_date = datetime.strptime(start_date, '%Y-%m-%d').date()
        end_date = datetime.strptime(end_date, '%Y-%m-%d').date()
    except (ValueError, TypeError):
        return jsonify({'error': 'Fechas inválidas'}), 400
    
    # Obtener datos
    data = DiasNoHabiles.query.filter(
        DiasNoHabiles.fecha.between(start_date, end_date)
    ).all()
    
    if format_type == 'csv':
        # Implementar exportación CSV
        pass
    else:
        return jsonify([{
            'fecha': d.fecha.strftime('%Y-%m-%d'),
            'nombre': d.nombre,
            'skill': d.skill,
            'horario': d.horario,
            'tipo_dia': d.tipo_dia,
            'horas_trabajadas': str(d.horas_trabajadas)
        } for d in data])

@analytics_bp.route('/metrics', methods=['GET'])
def get_metrics():
    # Métricas clave de rendimiento
    today = datetime.now().date()
    start_of_month = today.replace(day=1)
    
    metrics = {
        'monthly_stats': calculate_monthly_stats(start_of_month),
        'efficiency_metrics': calculate_efficiency_metrics(start_of_month),
        'coverage_analysis': analyze_coverage(start_of_month)
    }
    
    return jsonify(metrics)

def calculate_trends(df):
    # Calcular tendencias
    daily_counts = df.groupby('fecha').size()
    trend = np.polyfit(range(len(daily_counts)), daily_counts, 1)
    
    return {
        'slope': float(trend[0]),
        'daily_counts': daily_counts.to_dict(),
        'trend_direction': 'up' if trend[0] > 0 else 'down'
    }

def generate_predictions(df):
    # Generar predicciones simples
    avg_daily = df.groupby('fecha').size().mean()
    std_daily = df.groupby('fecha').size().std()
    
    return {
        'expected_daily_shifts': round(avg_daily, 2),
        'confidence_interval': [
            round(avg_daily - std_daily, 2),
            round(avg_daily + std_daily, 2)
        ]
    }

def calculate_distribution(df):
    return {
        'by_skill': df['skill'].value_counts().to_dict(),
        'by_day_type': df['tipo_dia'].value_counts().to_dict(),
        'by_schedule': df['horario'].value_counts().to_dict()
    }

def calculate_monthly_stats(start_date):
    """Calcula estadísticas mensuales"""
    stats = DiasNoHabiles.query.filter(
        DiasNoHabiles.fecha >= start_date
    ).with_entities(
        func.count().label('total_shifts'),
        func.count(func.distinct(DiasNoHabiles.dni)).label('unique_employees')
    ).first()
    
    return {
        'total_shifts': stats.total_shifts,
        'unique_employees': stats.unique_employees,
        'avg_shifts_per_day': stats.total_shifts / 30  # Promedio mensual
    }

def calculate_efficiency_metrics(start_date):
    """Calcula métricas de eficiencia"""
    return {
        'coverage_rate': 0.85,  # Ejemplo
        'schedule_adherence': 0.92,  # Ejemplo
        'utilization': 0.88  # Ejemplo
    }

def analyze_coverage(start_date):
    """Analiza la cobertura de turnos"""
    return {
        'weekday_coverage': 0.95,  # Ejemplo
        'weekend_coverage': 0.82,  # Ejemplo
        'peak_hours_coverage': 0.88  # Ejemplo
    } 