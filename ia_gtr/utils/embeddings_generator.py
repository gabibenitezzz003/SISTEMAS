from sentence_transformers import SentenceTransformer
import torch
import os

class EmbeddingsGenerator:
    def __init__(self):
        # Reducir el uso de memoria
        os.environ['PYTORCH_CUDA_ALLOC_CONF'] = 'max_split_size_mb:32'
        torch.backends.cuda.max_memory_split_size = 32 * 1024 * 1024
        
        # Usar modelo más ligero y configuración de bajo consumo
        self.model = SentenceTransformer(
            'distiluse-base-multilingual-cased-v2',  # Modelo más ligero
            device='cpu',
            cache_folder='./model_cache'
        )

    def generate(self, text):
        """Genera embeddings para un texto"""
        try:
            with torch.no_grad():
                return self.model.encode(
                    text,
                    convert_to_tensor=True,
                    show_progress_bar=False,
                    batch_size=1  # Procesar uno a la vez
                )
        except Exception as e:
            print(f"Error al generar embedding: {str(e)}")
            raise

    def batch_generate(self, texts, batch_size=8):
        """Genera embeddings para una lista de textos"""
        try:
            with torch.no_grad():
                return self.model.encode(
                    texts,
                    batch_size=batch_size,
                    show_progress_bar=True,
                    convert_to_tensor=True
                )
        except Exception as e:
            print(f"Error en batch_generate: {str(e)}")
            raise 