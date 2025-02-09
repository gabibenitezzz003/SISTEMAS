import torch
import torch.nn as nn
from transformers import AutoTokenizer, AutoModel

class IntentClassifier(nn.Module):
    def __init__(self):
        super().__init__()
        self.tokenizer = AutoTokenizer.from_pretrained('PlanTL-GOB-ES/roberta-base-bne')
        self.bert = AutoModel.from_pretrained('PlanTL-GOB-ES/roberta-base-bne')
        self.classifier = nn.Linear(768, 8)  # 8 clases de intenciones diferentes
        
    def classify(self, text):
        """Clasifica la intención del usuario"""
        inputs = self.tokenizer(text, return_tensors="pt", padding=True, truncation=True)
        outputs = self.bert(**inputs)
        logits = self.classifier(outputs.pooler_output)
        return torch.argmax(logits, dim=1) 