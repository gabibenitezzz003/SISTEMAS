import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestRegressor
from sklearn.preprocessing import StandardScaler
from datetime import datetime, timedelta
import joblib

class GTRPredictor:
    def __init__(self, db_session):
        self.session = db_session
        self.model = None
        self.scaler = StandardScaler()
        
    def train_model(self):
        """Entrena el modelo predictivo con datos históricos"""
        # Obtener datos históricos
        historical_data = self.get_historical_data()
        
        # Preparar características
        X = self.prepare_features(historical_data)
        y = historical_data['hours'].values
        
        # Escalar datos
        X_scaled = self.scaler.fit_transform(X)
        
        # Entrenar modelo
        self.model = RandomForestRegressor(n_estimators=100, random_state=42)
        self.model.fit(X_scaled, y)
        
        # Guardar modelo
        joblib.dump(self.model, 'models/gtr_predictor.joblib')
        joblib.dump(self.scaler, 'models/gtr_scaler.joblib')
        
    def predict_next_month(self):
        """Predice las necesidades de personal para el próximo mes"""
        if not self.model:
            self.model = joblib.load('models/gtr_predictor.joblib')
            self.scaler = joblib.load('models/gtr_scaler.joblib')
            
        # Generar fechas para el próximo mes
        next_month = datetime.now() + timedelta(days=30)
        dates = pd.date_range(next_month, periods=30, freq='D')
        
        predictions = []
        for date in dates:
            features = self.prepare_prediction_features(date)
            scaled_features = self.scaler.transform([features])
            prediction = self.model.predict(scaled_features)[0]
            
            predictions.append({
                'date': date,
                'predicted_hours': prediction,
                'confidence': self.calculate_confidence(prediction)
            })
            
        return predictions
    
    def calculate_confidence(self, prediction):
        """Calcula el nivel de confianza de la predicción"""
        # Implementar lógica de confianza basada en la varianza del modelo
        return np.random.uniform(0.85, 0.95)  # Simplificado para el ejemplo 