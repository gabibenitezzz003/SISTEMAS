from sklearn.ensemble import RandomForestRegressor, GradientBoostingClassifier
from sklearn.preprocessing import StandardScaler
import numpy as np
import pandas as pd
from datetime import datetime, timedelta

class MLEngine:
    def __init__(self, db_session):
        self.session = db_session
        self.models = {
            'hours_predictor': None,
            'efficiency_predictor': None,
            'anomaly_detector': None,
            'pattern_recognizer': None
        }
        self.scalers = {}
        
    def train_all_models(self, historical_data):
        """Entrena todos los modelos del sistema"""
        # Preparar datos
        X, y = self.prepare_training_data(historical_data)
        
        # Modelo de predicción de horas
        self.models['hours_predictor'] = self.train_hours_predictor(X, y['hours'])
        
        # Modelo de eficiencia
        self.models['efficiency_predictor'] = self.train_efficiency_predictor(X, y['efficiency'])
        
        # Detector de anomalías
        self.models['anomaly_detector'] = self.train_anomaly_detector(X)
        
        # Reconocedor de patrones
        self.models['pattern_recognizer'] = self.train_pattern_recognizer(X, y['patterns'])
        
    def detect_patterns(self, data):
        """Detecta patrones en los datos históricos"""
        patterns = {
            'seasonal_trends': self.analyze_seasonality(data),
            'peak_hours': self.find_peak_hours(data),
            'employee_preferences': self.analyze_employee_preferences(data),
            'efficiency_factors': self.identify_efficiency_factors(data)
        }
        return patterns
        
    def predict_future_needs(self, horizon_days=30):
        """Predice necesidades futuras de personal"""
        predictions = {
            'staff_needed': [],
            'expected_workload': [],
            'optimal_shifts': [],
            'risk_factors': []
        }
        
        for day in range(horizon_days):
            date = datetime.now() + timedelta(days=day)
            features = self.prepare_prediction_features(date)
            
            predictions['staff_needed'].append(
                self.predict_staff_needs(features)
            )
            predictions['expected_workload'].append(
                self.predict_workload(features)
            )
            predictions['optimal_shifts'].append(
                self.optimize_shift_distribution(features)
            )
            predictions['risk_factors'].append(
                self.assess_risk_factors(features)
            )
            
        return predictions 