from flask import jsonify, request
from app.routes import ia_bp
from app.models import DiasNoHabiles, Asesores
from sqlalchemy import func
from datetime import datetime, timedelta
import pandas as pd

@ia_bp.route('/query', methods=['POST'])
def process_query():
    data = request.json
    query = data.get('query', '').lower()
    
    # Procesamiento básico de consultas naturales
    if 'cuantos asesores' in query:
        if 'com' in query:
            count = Asesores.query.filter_by(skill='COM').count()
            return jsonify({
                'answer': f'Hay {count} asesores COM actualmente.',
                'type': 'count'
            })
        elif 'cross' in query:
            count = Asesores.query.filter_by(skill='CROSS').count()
            return jsonify({
                'answer': f'Hay {count} asesores CROSS actualmente.',
                'type': 'count'
            })
    
    elif 'turnos' in query and ('hoy' in query or 'fecha' in query):
        date = data.get('date', datetime.now().date())
        shifts = DiasNoHabiles.query.filter_by(fecha=date).all()
        return jsonify({
            'answer': f'Hay {len(shifts)} turnos programados para esa fecha.',
            'details': [{'nombre': s.nombre, 'horario': s.horario} for s in shifts],
            'type': 'shifts'
        })

    return jsonify({
        'answer': 'Lo siento, no pude entender tu consulta.',
        'type': 'error'
    })

@ia_bp.route('/analytics', methods=['GET'])
def get_ia_analytics():
    # Análisis predictivo de turnos
    today = datetime.now().date()
    last_month = today - timedelta(days=30)
    
    historical_data = DiasNoHabiles.query.filter(
        DiasNoHabiles.fecha >= last_month
    ).all()
    
    # Convertir a DataFrame para análisis
    df = pd.DataFrame([{
        'fecha': h.fecha,
        'skill': h.skill,
        'tipo_dia': h.tipo_dia,
        'horario': h.horario
    } for h in historical_data])
    
    # Análisis básico
    analysis = {
        'total_turnos': len(df),
        'distribucion_skill': df['skill'].value_counts().to_dict(),
        'dias_mas_frecuentes': df['tipo_dia'].value_counts().to_dict(),
        'horarios_comunes': df['horario'].value_counts().head(3).to_dict()
    }
    
    return jsonify(analysis)

@ia_bp.route('/predict/attendance', methods=['GET'])
def predict_attendance():
    # Predicción simple basada en históricos
    date_str = request.args.get('date')
    if date_str:
        target_date = datetime.strptime(date_str, '%Y-%m-%d').date()
        weekday = target_date.weekday()
        
        # Obtener promedio histórico para ese día de la semana
        historical = DiasNoHabiles.query.filter(
            func.extract('dow', DiasNoHabiles.fecha) == weekday
        ).all()
        
        attendance_prediction = len(historical) / max(1, len(set(h.fecha for h in historical)))
        
        return jsonify({
            'date': date_str,
            'predicted_attendance': round(attendance_prediction, 2),
            'confidence': 0.85  # Valor ejemplo
        })
    
    return jsonify({'error': 'Se requiere una fecha'}), 400 