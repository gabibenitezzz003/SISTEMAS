from flask import Flask
from app.database import db_session
from app.config.config import Config
from app.routes import dashboard_bp, shifts_bp, ia_bp, analytics_bp

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Registrar blueprints
    app.register_blueprint(dashboard_bp)
    app.register_blueprint(shifts_bp)
    app.register_blueprint(ia_bp)
    app.register_blueprint(analytics_bp)

    @app.teardown_appcontext
    def shutdown_session(exception=None):
        db_session.remove()

    return app
