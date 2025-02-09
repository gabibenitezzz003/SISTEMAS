import torch
import torch.nn as nn
import faiss
import numpy as np
import logging

logger = logging.getLogger(__name__)

class KnowledgeBase(nn.Module):
    def __init__(self):
        super().__init__()
        self.dimension = 384  # Dimensión de los embeddings
        self.index = faiss.IndexFlatL2(self.dimension)
        self.knowledge_store = []
        
    def update(self, new_embeddings, texts=None):
        """Actualiza la base de conocimiento"""
        try:
            # Convertir a numpy si es tensor
            if isinstance(new_embeddings, torch.Tensor):
                new_embeddings = new_embeddings.detach().cpu().numpy()
            
            # Asegurar que sea 2D
            if len(new_embeddings.shape) == 1:
                new_embeddings = new_embeddings.reshape(1, -1)
                
            # Verificar dimensiones
            if new_embeddings.shape[1] != self.dimension:
                raise ValueError(f"Dimensión incorrecta: esperada {self.dimension}, recibida {new_embeddings.shape[1]}")
            
            # Agregar a la base de conocimiento
            self.index.add(new_embeddings)
            
            # Guardar textos si se proporcionan
            if texts:
                self.knowledge_store.extend(texts)
                
            logger.info(f"Agregados {len(new_embeddings)} nuevos embeddings a la base de conocimiento")
            return True
            
        except Exception as e:
            logger.error(f"Error actualizando base de conocimiento: {str(e)}")
            raise
            
    def search_relevant(self, query_embedding, k=3):
        """Busca información relevante para una consulta"""
        try:
            if isinstance(query_embedding, torch.Tensor):
                query_embedding = query_embedding.detach().cpu().numpy()
                
            if len(query_embedding.shape) == 1:
                query_embedding = query_embedding.reshape(1, -1)
            
            # Verificar que hay documentos en el índice
            if self.index.ntotal == 0:
                logger.warning("Base de conocimiento vacía")
                return []
                
            # Asegurar que k es válido
            k = min(k, self.index.ntotal)
            if k <= 0:
                logger.warning("No hay suficientes documentos para buscar")
                return []
                
            D, I = self.index.search(query_embedding, k)
            
            # Retornar documentos encontrados
            results = []
            for idx in I[0]:
                if idx < len(self.knowledge_store):
                    results.append({
                        'text': self.knowledge_store[idx],
                        'score': float(D[0][len(results)])
                    })
            
            return results
            
        except Exception as e:
            logger.error(f"Error en búsqueda: {str(e)}")
            return [] 