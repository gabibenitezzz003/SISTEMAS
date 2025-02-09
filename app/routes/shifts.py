from flask import jsonify, request
from app.routes import shifts_bp
from app.models import DiasNoHabiles, Asesores
from app.database import db_session
from datetime import datetime

@shifts_bp.route('/by-date', methods=['GET'])
def get_shifts_by_date():
    date_str = request.args.get('date', datetime.now().strftime('%Y-%m-%d'))
    date = datetime.strptime(date_str, '%Y-%m-%d').date()
    
    shifts = DiasNoHabiles.query.filter_by(fecha=date).all()
    
    shifts_data = {
        'COM': [],
        'CROSS': []
    }
    
    for shift in shifts:
        shift_info = {
            'dni': shift.dni,
            'nombre': shift.nombre,
            'horario': shift.horario,
            'tipo_dia': shift.tipo_dia
        }
        shifts_data[shift.skill].append(shift_info)
    
    return jsonify(shifts_data)

@shifts_bp.route('/update', methods=['POST'])
def update_shift():
    data = request.json
    
    shift = DiasNoHabiles.query.filter_by(
        dni=data['dni'],
        fecha=datetime.strptime(data['fecha'], '%Y-%m-%d').date()
    ).first()
    
    if shift:
        shift.horario = data['horario']
        db_session.commit()
        return jsonify({'message': 'Turno actualizado correctamente'})
    
    return jsonify({'error': 'Turno no encontrado'}), 404

@shifts_bp.route('/weekend-schedule', methods=['POST'])
def generate_weekend_schedule():
    data = request.json
    date = datetime.strptime(data['fecha'], '%Y-%m-%d').date()
    
    # Lógica para generar horario de fin de semana
    # ... (implementar según necesidades específicas)
    
    return jsonify({'message': 'Horario de fin de semana generado'}) 