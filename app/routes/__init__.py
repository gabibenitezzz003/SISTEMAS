from flask import Blueprint

# Crear blueprints para cada módulo
dashboard_bp = Blueprint('dashboard', __name__, url_prefix='/api/dashboard')
shifts_bp = Blueprint('shifts', __name__, url_prefix='/api/shifts')
ia_bp = Blueprint('ia', __name__, url_prefix='/api/ia')
analytics_bp = Blueprint('analytics', __name__, url_prefix='/api/analytics') 