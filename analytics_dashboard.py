from datetime import datetime, timedelta
from random import random
import pandas as pd
import plotly.graph_objects as go
from models import CompanyMetrics, MarketData, SalesData

class TelecomBI:
    def __init__(self, db_session):
        self.session = db_session
        self.companies = ['Movistar', 'Personal', 'Claro']
        self.provincias = [
            'Buenos Aires', 'CABA', 'Catamarca', 'Chaco', 'Chubut', 'Córdoba',
            'Corrientes', 'Entre Ríos', 'Formosa', 'Jujuy', 'La Pampa', 'La Rioja',
            'Mendoza', 'Misiones', 'Neuquén', 'Río Negro', 'Salta', 'San Juan',
            'San Luis', 'Santa Cruz', 'Santa Fe', 'Santiago del Estero',
            'Tierra del Fuego', 'Tucumán'
        ]
        
    def get_market_metrics(self):
        """Obtiene métricas principales del mercado"""
        return {
            "market_share": self.calculate_market_share(),
            "price_comparison": self.analyze_price_trends(),
            "customer_satisfaction": self.get_satisfaction_metrics(),
            "revenue_growth": self.calculate_revenue_growth()
        }

    def create_dashboard_layout(self):
        """Crea el layout del dashboard de BI enfocado en análisis provincial"""
        return {
            "title": "Business Intelligence - Análisis Provincial Movistar",
            "sections": [
                {
                    "name": "Indicadores Provinciales",
                    "charts": [
                        {
                            "type": "choropleth",
                            "title": "Mapa de Cobertura por Provincia",
                            "data": self.coverage_map()
                        },
                        {
                            "type": "bar",
                            "title": "Participación de Mercado por Provincia",
                            "data": self.market_share_by_province()
                        }
                    ]
                },
                {
                    "name": "Análisis Competitivo Provincial",
                    "charts": [
                        {
                            "type": "heatmap",
                            "title": "Satisfacción del Cliente por Provincia",
                            "data": self.satisfaction_heatmap()
                        },
                        {
                            "type": "line",
                            "title": "Evolución de Clientes por Provincia",
                            "data": self.customer_evolution()
                        }
                    ]
                }
            ]
        }

    def coverage_map(self):
        """Genera mapa de Argentina con datos de cobertura por provincia"""
        return go.Figure(data=go.Choropleth(
            locations=self.provincias,
            z=self.get_coverage_by_province(),
            locationmode='country names',
            colorscale='Viridis',
            colorbar_title="% Cobertura"
        ))

    def market_share_by_province(self):
        """Análisis de participación de mercado por provincia"""
        return go.Figure(data=[
            go.Bar(
                name=company,
                x=self.provincias,
                y=self.get_market_share_data(company)
            ) for company in self.companies
        ])

    def satisfaction_heatmap(self):
        """Mapa de calor de satisfacción del cliente por provincia"""
        return go.Figure(data=go.Heatmap(
            z=self.get_satisfaction_by_province(),
            x=self.companies,
            y=self.provincias,
            colorscale='RdYlGn'
        ))

    def customer_evolution(self):
        """Evolución temporal de clientes por provincia"""
        return go.Figure(data=[
            go.Scatter(
                name=provincia,
                x=self.get_date_range(),
                y=self.get_customer_data(provincia)
            ) for provincia in self.provincias
        ])

    def get_coverage_by_province(self):
        """Obtiene datos de cobertura por provincia desde la base de datos"""
        try:
            # Implementar consulta a la base de datos
            coverage_data = self.session.query(
                CompanyMetrics.coverage
            ).filter_by(company='Movistar').all()
            return [data[0] for data in coverage_data]
        except Exception as e:
            print(f"Error al obtener datos de cobertura: {e}")
            return [0] * len(self.provincias)

    def get_market_share_data(self, company):
        """Obtiene datos de participación de mercado por provincia"""
        try:
            # Implementar consulta a la base de datos
            market_data = self.session.query(
                MarketData.market_share
            ).filter_by(company=company).all()
            return [data[0] for data in market_data]
        except Exception as e:
            print(f"Error al obtener datos de mercado: {e}")
            return [0] * len(self.provincias)

    def get_satisfaction_by_province(self):
        """Obtiene datos de satisfacción por provincia"""
        try:
            # Implementar consulta a la base de datos
            satisfaction_data = self.session.query(
                CompanyMetrics.satisfaction_score
            ).filter_by(company='Movistar').all()
            return [[data[0] for data in satisfaction_data]]
        except Exception as e:
            print(f"Error al obtener datos de satisfacción: {e}")
            return [[0] * len(self.companies) for _ in self.provincias]

    def get_customer_data(self, provincia):
        """Obtiene evolución de clientes por provincia"""
        try:
            # Implementar consulta a la base de datos
            customer_data = self.session.query(
                SalesData.customer_count
            ).filter_by(
                company='Movistar',
                province=provincia
            ).all()
            return [data[0] for data in customer_data]
        except Exception as e:
            print(f"Error al obtener datos de clientes: {e}")
            return [0] * 12

    def get_date_range(self):
        """Obtiene rango de fechas para análisis"""
        end_date = datetime.now()
        start_date = end_date - timedelta(days=365)
        return pd.date_range(start=start_date, end=end_date, freq='M')

    def get_price_data(self, company):
        """Obtiene datos históricos de precios"""
        # Implementar lógica real de obtención de datos
        return [random.uniform(2000, 5000) for _ in range(12)]

    def get_satisfaction_scores(self):
        """Obtiene puntuaciones de satisfacción"""
        # Implementar lógica real
        return [92, 87, 85, 78]

    def get_service_metrics(self, company):
        """Obtiene métricas de servicio por empresa"""
        # Implementar lógica real
        return [random.uniform(60, 95) for _ in range(5)]

    def get_coverage_data(self):
        """Obtiene datos de cobertura por región"""
        # Implementar lógica real
        return [[random.uniform(70, 100) for _ in range(4)] for _ in range(6)] 