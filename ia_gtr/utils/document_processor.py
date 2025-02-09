import PyPDF2
from docx import Document
import os

class DocumentProcessor:
    def process(self, file_path):
        """Procesa documentos PDF y Word"""
        ext = os.path.splitext(file_path)[1].lower()
        
        if ext == '.pdf':
            return self._process_pdf(file_path)
        elif ext == '.docx':
            return self._process_docx(file_path)
        else:
            raise ValueError("Formato no soportado")
            
    def _process_pdf(self, file_path):
        """Extrae texto de archivos PDF"""
        text = ""
        with open(file_path, 'rb') as file:
            reader = PyPDF2.PdfReader(file)
            for page in reader.pages:
                text += page.extract_text() + "\n"
        return self._clean_text(text)
        
    def _process_docx(self, file_path):
        """Extrae texto de archivos Word"""
        doc = Document(file_path)
        text = ""
        for para in doc.paragraphs:
            text += para.text + "\n"
        return self._clean_text(text)
        
    def _clean_text(self, text):
        """Limpia y normaliza el texto extraído"""
        # Eliminar espacios extra
        text = " ".join(text.split())
        # Normalizar saltos de línea
        text = text.replace("\r", "\n")
        # Eliminar líneas vacías múltiples
        text = "\n".join(line for line in text.splitlines() if line.strip())
        return text 