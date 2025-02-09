import os
import logging
from ia_gtr.training.train_model import ModelTrainer

# Configurar logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def main():
    try:
        # Inicializar entrenador
        trainer = ModelTrainer()
        
        # Obtener ruta base del proyecto
        base_path = os.path.dirname(os.path.abspath(__file__))
        
        # Definir rutas de entrenamiento
        training_paths = {
            'manuales': os.path.join(base_path, 'ia_gtr', 'training', 'manuales'),
            'politicas': os.path.join(base_path, 'ia_gtr', 'training', 'politicas')
        }
        
        # Entrenar con cada conjunto de documentos
        for category, path in training_paths.items():
            if os.path.exists(path):
                logger.info(f"Entrenando con documentos de {category} en {path}")
                success = trainer.train_from_directory(path)
                
                if success:
                    logger.info(f"Entrenamiento de {category} completado exitosamente")
                else:
                    logger.error(f"Error en el entrenamiento de {category}")
            else:
                logger.warning(f"Directorio no encontrado: {path}")
                
    except Exception as e:
        logger.error(f"Error en el proceso de entrenamiento: {str(e)}")
        raise

if __name__ == "__main__":
    main() 