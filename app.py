from flask import Flask, render_template, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import os
from dotenv import load_dotenv
from database import db, db_session, init_db
from ml_engine import MLEngine
from performance_analyzer import PerformanceAnalyzer
from notification_system import NotificationSystem
from audit_system import AuditSystem
from incident_manager import IncidentManager
from models import AIQuery, Employee, Shift

# Cargar variables de entorno
load_dotenv()

app = Flask(__name__)

# Configuración de la base de datos
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Inicializar la extensión db con la app
db.init_app(app)

# Crear el contexto de la aplicación
with app.app_context():
    init_db()

# Inicializar componentes básicos
ml_engine = MLEngine(db_session)
performance_analyzer = PerformanceAnalyzer(db_session)
notification_system = NotificationSystem(db_session)
audit_system = AuditSystem(db_session)
incident_manager = IncidentManager(db_session)

# Variable global para el asistente
assistant = None

# Agregar esta ruta para servir archivos estáticos
app.static_folder = 'static'

@app.route('/')
def welcome():
    """Página de bienvenida"""
    return render_template('welcome.html')

@app.route('/submenu')
def submenu():
    """Menú principal"""
    return render_template('submenu.html')

@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

@app.route('/shift-management')
def shift_management():
    return render_template('gestion_cambios.html')

@app.route('/ia-gtr')
def ia_gtr():
    """Chat con IA integrado"""
    global assistant
    
    if assistant is None:
        try:
            # Configurar torch para usar menos memoria
            import torch
            torch.backends.cuda.max_memory_allocated = 512 * 1024 * 1024  # 512MB
            torch.backends.cuda.max_memory_cached = 1024 * 1024 * 1024    # 1GB
            
            from ia_gtr.ai_assistant import AIAssistant
            from ia_gtr.training.train_model import ModelTrainer
            
            if not os.getenv('GEMINI_API_KEY'):
                return "Error: GEMINI_API_KEY no encontrada", 500
                
            trainer = ModelTrainer()
            knowledge_base = trainer.load_or_train()
            if knowledge_base is None:
                return "Error cargando base de conocimiento", 500
                
            assistant = AIAssistant(db_session, knowledge_base=knowledge_base)
            
        except Exception as e:
            print(f"Error inicializando IA: {str(e)}")
            return f"Error inicializando IA: {str(e)}", 500
    
    return render_template('ia_gtr.html')

@app.route('/analytics')
def analytics():
    return render_template('analytics.html', active_page='analytics')

@app.route('/analytics/business-intelligence')
def business_intelligence():
    return render_template('business_intelligence.html')

@app.route('/analytics/market-analysis')
def market_analysis():
    return render_template('market_analysis.html')

@app.route('/api/ia/analyze', methods=['POST'])
def analyze_query():
    try:
        data = request.json
        query = data.get('query', '')
        
        global assistant
        if assistant is None:
            from ia_gtr.ai_assistant import AIAssistant
            from ia_gtr.training.train_model import ModelTrainer
            trainer = ModelTrainer()
            knowledge_base = trainer.train_from_directory('ia_gtr/training/manuales')
            trainer.train_from_directory('ia_gtr/training/politicas')
            assistant = AIAssistant(db_session, knowledge_base=trainer.knowledge_base)
        
        # Procesar la consulta
        response = assistant.process_query(query)
        
        # Guardar la interacción
        new_query = AIQuery(
            query=query,
            response=response,
            timestamp=datetime.now()
        )
        db.session.add(new_query)
        db.session.commit()
        
        return jsonify({
            'status': 'success',
            'analysis': response
        })
        
    except Exception as e:
        print(f"Error en /api/ia/analyze: {str(e)}")
        return jsonify({
            'status': 'error',
            'error': str(e)
        }), 500

@app.route('/api/actions/predict', methods=['POST'])
def predict_automation():
    try:
        predictions = ml_engine.predict_future_needs(horizon_days=30)
        return jsonify(predictions)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/actions/analyze-trends', methods=['POST'])
def analyze_trends():
    try:
        trends = ml_engine.detect_patterns(data=None)  # Implementar lógica de datos
        return jsonify(trends)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/shifts/optimize', methods=['POST'])
def optimize_shifts():
    try:
        data = request.json
        month = data.get('month')
        year = data.get('year')
        
        optimization_result = ml_engine.optimize_shifts(month, year)
        return jsonify(optimization_result)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/analytics/performance', methods=['GET'])
def get_performance_analytics():
    try:
        department_id = request.args.get('department_id')
        period = request.args.get('period', 'month')
        analytics = performance_analyzer.analyze_department_performance(
            department_id, 
            period
        )
        return jsonify(analytics)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/incidents', methods=['POST'])
def report_incident():
    try:
        incident_data = request.json
        response = incident_manager.register_incident(incident_data)
        notification_system.send_notification({
            'type': 'incident',
            'severity': incident_data.get('severity', 'medium'),
            'message': incident_data.get('description')
        })
        return jsonify(response)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/shifts', methods=['GET'])
def get_shifts():
    # Aquí podrías obtener los datos de tu base de datos
    horarios = {
        '08:00 a 14:00': 7,
        '08:30 a 14:30': 7.5,
        '09:00 a 14:00': 6,
        '09:00 a 15:00': 8,
        '09:30 a 15:30': 8.5,
        '10:00 a 16:00': 9,
        '10:30 a 16:30': 9.5,
        '11:00 a 17:00': 10,
        '11:30 a 17:30': 10.5,
        '12:00 a 18:00': 11,
        '12:30 a 18:30': 11.5,
        '13:00 a 19:00': 12,
        '13:30 a 19:30': 12,
        '14:00 a 20:00': 12,
        '14:30 a 20:30': 12,
        '15:00 a 21:00': 12,
        '15:30 a 21:30': 12,
        '16:00 a 22:00': 12
    }
    return jsonify(horarios)

@app.route('/api/estados', methods=['GET'])
def get_estados():
    estados = {
        'LICENCIA': 6,
        'FALTA_INJUSTIFICADA': 6,
        'CERTIFICADO': 6,
        'AUSENTE': 0,
        'PRESENTE': 6,
        'ASESOR_MESSI': 5,
        'CAMBIO_DE_ROL': 5,
        'CAMBIO_DE_PRODUCTO': 0,
        'DEVOLUCION_DE_HORAS': 'No se modifica cómputo'
    }
    return jsonify(estados)

# Endpoint para el chat IA
@app.route('/api/chat', methods=['POST'])
def chat():
    """Endpoint para el chat IA"""
    global assistant
    
    if assistant is None:
        return jsonify({"error": "Sistema IA no inicializado"}), 500
        
    try:
        query = request.json.get('text')
        response = assistant.process_query(query)
        return jsonify({"response": response})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='127.0.0.1', port=5000) 