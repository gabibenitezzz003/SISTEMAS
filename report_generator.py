import pandas as pd
import plotly.graph_objects as go
from datetime import datetime
import pdfkit

class ReportGenerator:
    def __init__(self, db_session):
        self.session = db_session
        
    def generate_monthly_report(self, month, year):
        """Genera un reporte mensual completo"""
        data = self.gather_monthly_data(month, year)
        
        # Crear visualizaciones
        figures = self.create_visualizations(data)
        
        # Generar HTML
        html = self.create_html_report(data, figures)
        
        # Convertir a PDF
        pdf_path = f'reports/monthly_report_{year}_{month}.pdf'
        pdfkit.from_string(html, pdf_path)
        
        return pdf_path
        
    def create_visualizations(self, data):
        """Crea visualizaciones interactivas"""
        figures = {}
        
        # Gráfico de horas por departamento
        fig_hours = go.Figure(data=[
            go.Bar(
                x=data['departments'],
                y=data['hours_per_dept'],
                marker_color='rgb(0, 255, 157)'
            )
        ])
        fig_hours.update_layout(
            title='Horas por Departamento',
            template='plotly_dark'
        )
        figures['hours'] = fig_hours
        
        # Gráfico de eficiencia
        fig_efficiency = go.Figure(data=[
            go.Indicator(
                mode = "gauge+number",
                value = data['efficiency'],
                title = {'text': "Eficiencia Global"},
                gauge = {
                    'axis': {'range': [None, 100]},
                    'bar': {'color': "rgb(0, 255, 157)"},
                    'steps': [
                        {'range': [0, 60], 'color': "red"},
                        {'range': [60, 80], 'color': "yellow"},
                        {'range': [80, 100], 'color': "green"}
                    ]
                }
            )
        ])
        figures['efficiency'] = fig_efficiency
        
        return figures 