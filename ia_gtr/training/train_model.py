import os
import logging
import pickle
from tqdm import tqdm
from ..utils.document_processor import DocumentProcessor
from ..utils.embeddings_generator import EmbeddingsGenerator
from ..models.knowledge_base import KnowledgeBase
from ..models.intent_classifier import IntentClassifier
from ..models.response_generator import ResponseGenerator

logger = logging.getLogger(__name__)

class ModelTrainer:
    def __init__(self):
        self.doc_processor = DocumentProcessor()
        self.cache_dir = 'ia_gtr/cache'
        os.makedirs(self.cache_dir, exist_ok=True)
        
        # Inicializar componentes
        try:
            os.environ['PYTORCH_CUDA_ALLOC_CONF'] = 'max_split_size_mb:64'
            self.embeddings_gen = EmbeddingsGenerator()
            self.knowledge_base = KnowledgeBase()
            self.intent_classifier = IntentClassifier()
            self.response_generator = ResponseGenerator(knowledge_base=self.knowledge_base)
        except Exception as e:
            logger.error(f"Error inicializando ModelTrainer: {str(e)}")
            raise

    def train_from_directory(self, data_dir, batch_size=4):
        """Entrena los modelos con documentos en lotes pequeños"""
        try:
            documents = []
            for file in os.listdir(data_dir):
                if file.endswith(('.pdf', '.docx')):
                    text = self.doc_processor.process(os.path.join(data_dir, file))
                    if text:
                        documents.append(text)
                        
            # Procesar en lotes pequeños
            for i in range(0, len(documents), batch_size):
                batch = documents[i:i + batch_size]
                embeddings = self.embeddings_gen.batch_generate(batch)
                self.knowledge_base.update(embeddings, texts=batch)
                
            return self.knowledge_base
            
        except Exception as e:
            logger.error(f"Error en train_from_directory: {str(e)}")
            return None

    def _train_intent_classifier(self, documents):
        """Entrena el clasificador de intenciones"""
        # Implementar lógica de entrenamiento específica
        pass

    def _train_response_generator(self, documents):
        """Fine-tuning del generador de respuestas"""
        # Implementar lógica de fine-tuning específica
        pass

    def load_or_train(self):
        """Carga el modelo desde caché o entrena si no existe"""
        try:
            cache_file = os.path.join(self.cache_dir, 'knowledge_base.pkl')
            
            if os.path.exists(cache_file):
                logger.info("Cargando modelo desde caché...")
                with open(cache_file, 'rb') as f:
                    self.knowledge_base = pickle.load(f)
                return self.knowledge_base
            
            logger.info("Caché no encontrada, iniciando entrenamiento...")
            self.knowledge_base = self.train_from_directory('ia_gtr/training/manuales')
            if self.knowledge_base:
                self.train_from_directory('ia_gtr/training/politicas')
                
                # Guardar en caché
                with open(cache_file, 'wb') as f:
                    pickle.dump(self.knowledge_base, f)
                
            return self.knowledge_base
            
        except Exception as e:
            logger.error(f"Error en load_or_train: {str(e)}")
            return None 