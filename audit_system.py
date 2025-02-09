from datetime import datetime
import logging
from sqlalchemy import Column, Integer, String, DateTime, JSON
from sqlalchemy.ext.declarative import declarative_base
import os

Base = declarative_base()

class AuditLog(Base):
    __tablename__ = 'audit_logs'
    
    id = Column(Integer, primary_key=True)
    user_id = Column(Integer)
    action_type = Column(String(50))
    details = Column(JSON)
    timestamp = Column(DateTime, default=datetime.utcnow)

class AuditSystem:
    def __init__(self, db_session):
        self.session = db_session
        self.logger = self.setup_logging()
        
    def setup_logging(self):
        """Configura el sistema de logging"""
        # Crear directorio logs si no existe
        log_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'logs')
        os.makedirs(log_dir, exist_ok=True)
        
        # Configurar logger
        logger = logging.getLogger('audit_system')
        logger.setLevel(logging.INFO)
        
        # Crear handler para archivo
        fh = logging.FileHandler(
            os.path.join(log_dir, f'gtr_audit_{datetime.now().strftime("%Y%m")}.log')
        )
        fh.setLevel(logging.INFO)
        
        # Crear formatter
        formatter = logging.Formatter(
            '%(asctime)s [%(levelname)s] - %(message)s'
        )
        fh.setFormatter(formatter)
        
        # Agregar handler al logger
        logger.addHandler(fh)
        
        return logger
        
    def log_action(self, user_id, action_type, details):
        """Registra una acción en el sistema"""
        try:
            # Registrar en base de datos
            audit_entry = AuditLog(
                user_id=user_id,
                action_type=action_type,
                details=details
            )
            self.session.add(audit_entry)
            self.session.commit()
            
            # Registrar en archivo de log
            self.logger.info(f"User {user_id} performed {action_type}: {details}")
            
        except Exception as e:
            self.logger.error(f"Error logging action: {str(e)}")
            
    def generate_audit_report(self, start_date, end_date):
        """Genera un reporte de auditoría"""
        logs = self.session.query(AuditLog).filter(
            AuditLog.timestamp.between(start_date, end_date)
        ).all()
        
        report = {
            'period': f"{start_date} to {end_date}",
            'total_actions': len(logs),
            'actions_by_type': {},
            'actions_by_user': {},
            'suspicious_activities': []
        }
        
        # Analizar logs
        for log in logs:
            # Contar por tipo
            report['actions_by_type'][log.action_type] = \
                report['actions_by_type'].get(log.action_type, 0) + 1
                
            # Contar por usuario
            report['actions_by_user'][log.user_id] = \
                report['actions_by_user'].get(log.user_id, 0) + 1
                
            # Detectar actividades sospechosas
            if self.is_suspicious_activity(log):
                report['suspicious_activities'].append(log)
                
        return report 