from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build
from sqlalchemy.orm import sessionmaker
from app.database import engine
from app.models import Employee, Shift, WeekendSchedule
import pandas as pd

def sync_with_sheets():
    # Configuración de credenciales de Google Sheets
    SCOPES = ['https://www.googleapis.com/auth/spreadsheets.readonly']
    creds = Credentials.from_authorized_user_file('token.json', SCOPES)
    
    service = build('sheets', 'v4', credentials=creds)
    
    # ID de tu hoja de cálculo y rango
    SPREADSHEET_ID = 'tu_id_de_spreadsheet'
    RANGE_NAME = 'DNH!A:Z'  # Ajusta según tu hoja
    
    sheet = service.spreadsheets()
    result = sheet.values().get(spreadsheetId=SPREADSHEET_ID, range=RANGE_NAME).execute()
    values = result.get('values', [])
    
    # Convertir a DataFrame
    df = pd.DataFrame(values[1:], columns=values[0])
    
    # Sincronizar con la base de datos
    Session = sessionmaker(bind=engine)
    session = Session()
    
    try:
        # Actualizar empleados y turnos
        for _, row in df.iterrows():
            employee = session.query(Employee).filter_by(name=row['Nombre']).first()
            if not employee:
                employee = Employee(name=row['Nombre'], skill=row['Skill'])
                session.add(employee)
            
            # Crear o actualizar turnos
            # ... lógica para procesar turnos ...
            
        session.commit()
    except Exception as e:
        session.rollback()
        raise e
    finally:
        session.close() 