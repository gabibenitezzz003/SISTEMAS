@echo off
echo Configurando proyecto Flask...

:: Limpiar instalación previa
rmdir /s /q iagtr-web
mkdir iagtr-web
cd iagtr-web

:: Crear entorno virtual
python -m venv venv
call venv\Scripts\activate

:: Instalar dependencias
echo Instalando dependencias...
pip install flask flask-sqlalchemy python-dotenv mysql-connector-python pandas numpy

:: Crear estructura de carpetas
mkdir static
mkdir static\css
mkdir static\js
mkdir templates

:: Crear app.py
echo from flask import Flask, render_template> app.py
echo from flask_sqlalchemy import SQLAlchemy>> app.py
echo from dotenv import load_dotenv>> app.py
echo import os>> app.py
echo.>> app.py
echo load_dotenv()>> app.py
echo.>> app.py
echo app = Flask(__name__)>> app.py
echo.>> app.py
echo # Configuración de la base de datos>> app.py
echo app.config['SQLALCHEMY_DATABASE_URL'] = f"mysql+mysqlconnector://{os.getenv('DB_USER')}:{os.getenv('DB_PASSWORD')}@{os.getenv('DB_HOST')}/{os.getenv('DB_NAME')}">> app.py
echo db = SQLAlchemy(app)>> app.py
echo.>> app.py
echo @app.route('/')>> app.py
echo def index():>> app.py
echo     return render_template('index.html')>> app.py
echo.>> app.py
echo if __name__ == '__main__':>> app.py
echo     app.run(debug=True)>> app.py

:: Crear archivo .env
echo DB_HOST=localhost> .env
echo DB_USER=root>> .env
echo DB_PASSWORD=gtr123>> .env
echo DB_NAME=gestion_dnh2>> .env

:: Crear template base
echo ^<!DOCTYPE html^>> templates\base.html
echo ^<html lang="es"^>>> templates\base.html
echo ^<head^>>> templates\base.html
echo     ^<meta charset="UTF-8"^>>> templates\base.html
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>>> templates\base.html
echo     ^<title^>IAGTR - {% block title %}{% endblock %}^</title^>>> templates\base.html
echo     ^<link rel="stylesheet" href="{{ url_for('static', filename='css/style.css') }}"^>>> templates\base.html
echo     ^<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"^>>> templates\base.html
echo ^</head^>>> templates\base.html
echo ^<body class="bg-dark text-light"^>>> templates\base.html
echo     ^<nav class="navbar navbar-expand-lg navbar-dark bg-dark"^>>> templates\base.html
echo         ^<div class="container-fluid"^>>> templates\base.html
echo             ^<a class="navbar-brand" href="/"^>IAGTR^</a^>>> templates\base.html
echo             ^<div class="navbar-nav"^>>> templates\base.html
echo                 ^<a class="nav-link" href="/"^>Dashboard^</a^>>> templates\base.html
echo                 ^<a class="nav-link" href="/schedule"^>Horarios^</a^>>> templates\base.html
echo                 ^<a class="nav-link" href="/analytics"^>Analytics^</a^>>> templates\base.html
echo                 ^<a class="nav-link" href="/upload"^>Cargar Datos^</a^>>> templates\base.html
echo             ^</div^>>> templates\base.html
echo         ^</div^>>> templates\base.html
echo     ^</nav^>>> templates\base.html
echo     ^<div class="container mt-4"^>>> templates\base.html
echo         {% block content %}{% endblock %}>> templates\base.html
echo     ^</div^>>> templates\base.html
echo     ^<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"^>^</script^>>> templates\base.html
echo ^</body^>>> templates\base.html
echo ^</html^>>> templates\base.html

:: Crear template index
echo {% extends "base.html" %}> templates\index.html
echo {% block title %}Dashboard{% endblock %}>> templates\index.html
echo {% block content %}>> templates\index.html
echo ^<div class="card bg-dark"^>>> templates\index.html
echo     ^<div class="card-body"^>>> templates\index.html
echo         ^<h1 class="card-title"^>Sistema de Gestión de Horarios^</h1^>>> templates\index.html
echo         ^<p class="card-text"^>Bienvenido al sistema inteligente de gestión de turnos y horarios^</p^>>> templates\index.html
echo     ^</div^>>> templates\index.html
echo ^</div^>>> templates\index.html
echo {% endblock %}>> templates\index.html

:: Crear CSS
echo body {> static\css\style.css
echo     background-color: #121212;>> static\css\style.css
echo     color: #ffffff;>> static\css\style.css
echo }>> static\css\style.css
echo.>> static\css\style.css
echo .card {>> static\css\style.css
echo     border: 1px solid #333;>> static\css\style.css
echo     margin-bottom: 20px;>> static\css\style.css
echo }>> static\css\style.css

cd ..
echo Configuración de Flask completada!
pause 