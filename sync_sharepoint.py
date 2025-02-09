from office365.runtime.auth.authentication_context import AuthenticationContext
from office365.sharepoint.client_context import ClientContext
from office365.sharepoint.files.file import File
import pandas as pd
import mysql.connector
from datetime import datetime
import io
import schedule
import time

class SharePointToMySQL:
    def __init__(self):
        # Configuración SharePoint
        self.sharepoint_url = "https://atpgsolutions-my.sharepoint.com"
        self.sharepoint_file = "/personal/gabriel_benitez_atp_gsolutions_com_ar/EY3xNgqfyOVAqnfam22KdO8B0_Rk11OLE2NuAHyz927UWw"
        self.username = "gabriel.benitez@atp.gsolutions.com.ar"
        self.password = "Nux87704"  

        # Configuración MySQL
        self.mysql_config = {
            'host': 'localhost',
            'user': 'root',
            'password': 'gtr123',
            'database': 'gestion_dnh2'
        }

    def connect_sharepoint(self):
        try:
            ctx_auth = AuthenticationContext(self.sharepoint_url)
            if ctx_auth.acquire_token_for_user(self.username, self.password):
                ctx = ClientContext(self.sharepoint_url, ctx_auth)
                return ctx
            else:
                raise Exception("Error de autenticación en SharePoint")
        except Exception as e:
            print(f"Error conectando a SharePoint: {e}")
            raise

    def get_excel_file(self, ctx):
        try:
            file = ctx.web.get_file_by_server_relative_url(self.sharepoint_file)
            response = File.open_binary(ctx, file.serverRelativeUrl)
            return pd.read_excel(io.BytesIO(response.content))
        except Exception as e:
            print(f"Error leyendo archivo Excel: {e}")
            raise

    def process_data(self, df):
        try:
            # Procesar asesores
            asesores_df = df[['dni', 'nombre', 'lider', 'skill']].drop_duplicates()
            
            # Procesar días no hábiles
            dias_df = df[[
                'dni', 'fecha', 'horario', 'horas_trabajadas', 
                'tipo_dia', 'skill', 'nombre', 'lider'
            ]]

            # Asegurar tipos de datos correctos
            dias_df['fecha'] = pd.to_datetime(dias_df['fecha']).dt.date
            dias_df['horas_trabajadas'] = pd.to_numeric(dias_df['horas_trabajadas'], errors='coerce')

            return asesores_df, dias_df
        except Exception as e:
            print(f"Error procesando datos: {e}")
            raise

    def update_database(self, asesores_df, dias_df):
        conn = mysql.connector.connect(**self.mysql_config)
        cursor = conn.cursor()

        try:
            # Actualizar tabla asesores
            for _, row in asesores_df.iterrows():
                cursor.execute("""
                    INSERT INTO asesores (dni, nombre, lider, skill)
                    VALUES (%s, %s, %s, %s)
                    ON DUPLICATE KEY UPDATE
                    nombre = VALUES(nombre),
                    lider = VALUES(lider),
                    skill = VALUES(skill)
                """, (row['dni'], row['nombre'], row['lider'], row['skill']))

            # Actualizar tabla dias_no_habiles
            for _, row in dias_df.iterrows():
                cursor.execute("""
                    INSERT INTO dias_no_habiles 
                    (dni, fecha, horario, horas_trabajadas, tipo_dia, skill, nombre, lider)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                """, (
                    row['dni'], row['fecha'], row['horario'], 
                    row['horas_trabajadas'], row['tipo_dia'],
                    row['skill'], row['nombre'], row['lider']
                ))

            conn.commit()
            print(f"Base de datos actualizada exitosamente: {datetime.now()}")

        except Exception as e:
            print(f"Error actualizando la base de datos: {e}")
            conn.rollback()
            raise

        finally:
            cursor.close()
            conn.close()

    def sync_data(self):
        try:
            print(f"Iniciando sincronización: {datetime.now()}")
            ctx = self.connect_sharepoint()
            df = self.get_excel_file(ctx)
            asesores_df, dias_df = self.process_data(df)
            self.update_database(asesores_df, dias_df)
            print(f"Sincronización completada: {datetime.now()}")
        except Exception as e:
            print(f"Error en la sincronización: {e}")

def main():
    syncer = SharePointToMySQL()
    
    # Ejecutar sincronización inicial
    print("Iniciando primera sincronización...")
    syncer.sync_data()
    
    # Programar sincronización cada 15 minutos
    schedule.every(15).minutes.do(syncer.sync_data)
    
    print("Script en ejecución. Presiona Ctrl+C para detener.")
    while True:
        schedule.run_pending()
        time.sleep(60)

if __name__ == "__main__":
    main()