from flask import jsonify
from app.routes import dashboard_bp
from app.models import DiasNoHabiles, Asesores
from sqlalchemy import func
from datetime import datetime, timedelta

@dashboard_bp.route('/stats')
def get_dashboard_stats():
    # Obtener fecha actual
    today = datetime.now().date()
    
    # Estadísticas generales
    stats = {
        'total_asesores': Asesores.query.count(),
        'com_count': Asesores.query.filter_by(skill='COM').count(),
        'cross_count': Asesores.query.filter_by(skill='CROSS').count(),
        'dias_no_habiles_mes': DiasNoHabiles.query.filter(
            func.extract('month', DiasNoHabiles.fecha) == today.month
        ).count()
    }
    
    # Datos para gráficos
    charts_data = {
        'distribucion_skill': {
            'labels': ['COM', 'CROSS'],
            'values': [stats['com_count'], stats['cross_count']]
        },
        'turnos_semana': get_weekly_shifts(),
        'tendencia_mensual': get_monthly_trend()
    }
    
    return jsonify({
        'stats': stats,
        'charts': charts_data
    })

def get_weekly_shifts():
    # Obtener turnos de la semana actual
    today = datetime.now().date()
    start_of_week = today - timedelta(days=today.weekday())
    end_of_week = start_of_week + timedelta(days=6)
    
    daily_shifts = DiasNoHabiles.query.filter(
        DiasNoHabiles.fecha.between(start_of_week, end_of_week)
    ).all()
    
    # Procesar datos para el gráfico
    days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo']
    shifts_count = [0] * 7
    
    for shift in daily_shifts:
        day_index = shift.fecha.weekday()
        shifts_count[day_index] += 1
    
    return {
        'labels': days,
        'values': shifts_count
    }

def get_monthly_trend():
    # Obtener tendencia de los últimos 3 meses
    today = datetime.now().date()
    three_months_ago = today - timedelta(days=90)
    
    monthly_data = DiasNoHabiles.query.filter(
        DiasNoHabiles.fecha >= three_months_ago
    ).all()
    
    # Procesar datos por mes
    months = {}
    for shift in monthly_data:
        month_key = shift.fecha.strftime('%Y-%m')
        months[month_key] = months.get(month_key, 0) + 1
    
    # Ordenar por mes
    sorted_months = sorted(months.items())
    
    return {
        'labels': [m[0] for m in sorted_months],
        'values': [m[1] for m in sorted_months]
    } 