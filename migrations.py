from database import db, init_db
from flask import Flask
from sqlalchemy import text
import os

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL', 'sqlite:///gtr.db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)

def upgrade_database():
    with app.app_context():
        # Usar text() para las consultas SQL
        with db.engine.connect() as conn:
            # Eliminar la tabla existente
            conn.execute(text('DROP TABLE IF EXISTS ai_queries'))
            
            # Crear la tabla con la nueva estructura
            conn.execute(text('''
                CREATE TABLE ai_queries (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    query VARCHAR(500),
                    response LONGTEXT,
                    timestamp DATETIME
                )
            '''))
            # Confirmar los cambios
            conn.commit()
            
        print("Migración completada exitosamente")

if __name__ == '__main__':
    upgrade_database() 