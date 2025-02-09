import os
import ast
import json

class InfoVisitor(ast.NodeVisitor):
    """
    Visitor que extrae información detallada (imports, clases, funciones, asignaciones) de un AST.
    """
    def __init__(self):
        super().__init__()
        self.imports = []
        self.classes = []
        self.functions = []
        self.assignments = []

    def visit_Import(self, node: ast.Import):
        """
        Captura sentencias del tipo 'import x', 'import x as y', etc.
        """
        modules = []
        for name in node.names:
            modules.append({
                "module": name.name,
                "asname": name.asname
            })
        self.imports.append({
            "type": "import",
            "modules": modules,
            "lineno": node.lineno
        })
        self.generic_visit(node)

    def visit_ImportFrom(self, node: ast.ImportFrom):
        """
        Captura sentencias 'from x import y' o 'from x import y as z', etc.
        """
        modules = []
        for name in node.names:
            modules.append({
                "name": name.name,
                "asname": name.asname
            })
        self.imports.append({
            "type": "from",
            "module": node.module,
            "level": node.level,  # nivel de import relativo (si lo hay)
            "names": modules,
            "lineno": node.lineno
        })
        self.generic_visit(node)

    def visit_ClassDef(self, node: ast.ClassDef):
        """
        Captura definición de clases (nombre, docstring, decoradores, métodos).
        """
        class_info = {
            "nombre": node.name,
            "lineno": node.lineno,
            "docstring": ast.get_docstring(node),
            "decoradores": [ast.unparse(dec) for dec in node.decorator_list],
            "metodos": []
        }
        # Recorrer subnodos para encontrar métodos (FunctionDef dentro de la clase)
        for child in node.body:
            if isinstance(child, ast.FunctionDef):
                metodo_info = {
                    "nombre": child.name,
                    "lineno": child.lineno,
                    "docstring": ast.get_docstring(child),
                    "decoradores": [ast.unparse(dec) for dec in child.decorator_list],
                    "argumentos": [arg.arg for arg in child.args.args],
                }
                class_info["metodos"].append(metodo_info)

        self.classes.append(class_info)
        self.generic_visit(node)

    def visit_FunctionDef(self, node: ast.FunctionDef):
        """
        Captura funciones a nivel de módulo (nombre, docstring, decoradores, argumentos).
        (Los métodos de clase ya se capturan dentro de 'visit_ClassDef'.)
        """
        func_info = {
            "nombre": node.name,
            "lineno": node.lineno,
            "docstring": ast.get_docstring(node),
            "decoradores": [ast.unparse(dec) for dec in node.decorator_list],
            "argumentos": [arg.arg for arg in node.args.args],
        }
        self.functions.append(func_info)
        self.generic_visit(node)

    def visit_Assign(self, node: ast.Assign):
        """
        Captura asignaciones top-level (posibles variables globales).
        """
        targets_code = [ast.unparse(t) for t in node.targets]
        value_code = ast.unparse(node.value) if node.value else None

        self.assignments.append({
            "lineno": node.lineno,
            "targets": targets_code,
            "value": value_code
        })
        self.generic_visit(node)


def extraer_informacion_archivo(ruta_archivo):
    """
    Lee un archivo .py y devuelve un dict con datos (imports, clases, funciones, etc.).
    Incluye también el código completo en "contenido_completo".
    """
    # Intentar leer con utf-8, si falla reintentar con latin-1
    contenido = None
    try:
        with open(ruta_archivo, "r", encoding="utf-8") as f:
            contenido = f.read()
    except UnicodeDecodeError:
        try:
            with open(ruta_archivo, "r", encoding="latin-1") as f:
                contenido = f.read()
        except UnicodeDecodeError:
            # No se pudo leer con ninguna codificación
            return None

    if contenido is None:
        return None

    # Intentar parsear con AST
    try:
        tree = ast.parse(contenido)
    except SyntaxError:
        # Si el archivo tiene errores de sintaxis, se ignora
        return None

    docstring_modulo = ast.get_docstring(tree)

    visitor = InfoVisitor()
    visitor.visit(tree)

    info_archivo = {
        "archivo": os.path.basename(ruta_archivo),
        "ruta_completa": os.path.abspath(ruta_archivo),
        "docstring_modulo": docstring_modulo,
        "contenido_completo": contenido,  # Omitir si no quieres un JSON muy grande
        "imports": visitor.imports,
        "clases": visitor.classes,
        "funciones": visitor.functions,
        "asignaciones": visitor.assignments
    }

    return info_archivo


def generar_informacion_por_archivo(ruta_directorio, carpeta_salida):
    """
    Recorre todo el proyecto y crea 1 archivo JSON *por cada* archivo .py encontrado.
    Cada JSON se guarda en 'carpeta_salida'.
    """
    # Crea la carpeta de salida si no existe
    if not os.path.exists(carpeta_salida):
        os.makedirs(carpeta_salida)

    contador = 0

    for root, dirs, files in os.walk(ruta_directorio):
        for file in files:
            if file.endswith(".py"):
                ruta_archivo = os.path.join(root, file)
                info_archivo = extraer_informacion_archivo(ruta_archivo)
                if info_archivo:
                    # Generar un nombre único para el .json:
                    #   1) Obtener la ruta *relativa* al directorio base
                    ruta_relativa = os.path.relpath(ruta_archivo, ruta_directorio)
                    #   2) Reemplazar separadores de carpeta por subguiones
                    nombre_json = ruta_relativa.replace(os.sep, "_") + ".json"
                    
                    # Ruta final
                    path_salida = os.path.join(carpeta_salida, nombre_json)
                    
                    # Asegurarse de que la subcarpeta exista (si usas subcarpetas en la salida)
                    # En este enfoque, iremos directo a la carpeta_salida con nombres "carpeta_subcarpeta_archivo.py.json"
                    # Si deseas replicar la estructura, habría que crear subcarpetas. 
                    
                    with open(path_salida, "w", encoding="utf-8") as f:
                        json.dump(info_archivo, f, indent=4, ensure_ascii=False)
                    
                    contador += 1
                    print(f"[{contador}] Generado: {path_salida}")

    print(f"\n¡Listo! Se generaron {contador} archivos JSON en: {carpeta_salida}")


def main():
    print("========================================")
    print("  GENERADOR DE JSON (1 por archivo .py) ")
    print("========================================\n")

    
    ruta_proyecto = input("Ingresa la ruta ABSOLUTA donde está tu proyecto (.py):\n> ")
    ruta_proyecto = ruta_proyecto.strip('"').strip()  
    
    if not os.path.isdir(ruta_proyecto):
        print(f"La ruta '{ruta_proyecto}' no existe o no es un directorio.")
        return

    
    carpeta_salida = input("\nIngresa la ruta ABSOLUTA donde quieres guardar los JSON:\n> ")
    carpeta_salida = carpeta_salida.strip('"').strip()
    
    
    if not carpeta_salida:
        carpeta_salida = "info_por_archivo"

    
    print(f"\nEscaneando proyecto en: {ruta_proyecto} ...")
    generar_informacion_por_archivo(ruta_proyecto, carpeta_salida)


if __name__ == "__main__":
    main()
