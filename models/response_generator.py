import torch
import torch.nn as nn
from transformers import AutoModelForCausalLM, AutoTokenizer

class ResponseGenerator(nn.Module):
    def __init__(self):
        super().__init__()
        self.tokenizer = AutoTokenizer.from_pretrained("bertin-project/bertin-gpt-j-6B")
        self.model = AutoModelForCausalLM.from_pretrained("bertin-project/bertin-gpt-j-6B")
        
    def generate(self, query, intent, context):
        """Genera una respuesta basada en la consulta, intención y contexto"""
        prompt = self._build_prompt(query, intent, context)
        inputs = self.tokenizer(prompt, return_tensors="pt")
        
        outputs = self.model.generate(
            **inputs,
            max_length=200,
            num_return_sequences=1,
            temperature=0.7
        )
        
        return self.tokenizer.decode(outputs[0])
        
    def fine_tune(self, embeddings):
        """Ajusta el modelo con nuevos datos"""
        # Implementar fine-tuning
        pass
        
    def _build_prompt(self, query, intent, context):
        """Construye el prompt para la generación"""
        return f"""
        Contexto: {context}
        Intención detectada: {intent}
        Consulta: {query}
        Respuesta:""" 