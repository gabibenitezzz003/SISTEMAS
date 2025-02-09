@echo off
echo Iniciando configuracion del proyecto IAGTR...

:: Limpiar directorios existentes si existen
if exist backend rd /s /q backend
if exist static rd /s /q static
if exist templates rd /s /q templates

:: Crear estructura de carpetas
echo Creando estructura de directorios...
mkdir app
mkdir app\core
mkdir app\models
mkdir app\services
mkdir app\utils
mkdir static\css
mkdir static\js
mkdir templates
mkdir tests

:: Copiar archivos estáticos
echo Copiando archivos estaticos...
xcopy /E /I "static\css\*" "static\css\"
xcopy /E /I "static\js\*" "static\js\"
xcopy /E /I "templates\*" "templates\"

:: Crear requirements.txt
echo Creando requirements.txt...
echo flask==2.3.3> requirements.txt
echo flask-sqlalchemy==3.1.1>> requirements.txt
echo python-dotenv==1.0.0>> requirements.txt
echo openai==1.12.0>> requirements.txt
echo pandas==2.1.1>> requirements.txt
echo numpy==1.24.3>> requirements.txt
echo scikit-learn==1.3.0>> requirements.txt
echo tensorflow==2.13.0>> requirements.txt
echo plotly==5.17.0>> requirements.txt
echo pdfkit==1.0.0>> requirements.txt
echo mysql-connector-python==8.0.33>> requirements.txt
echo chart.js==4.4.1>> requirements.txt
echo ortools==9.7.2996>> requirements.txt

:: Configurar entorno Python
echo Configurando entorno virtual...
python -m venv venv
call venv\Scripts\activate
pip install -r requirements.txt

:: Crear .env
echo Creando archivo .env...
echo DB_HOST=localhost> .env
echo DB_USER=root>> .env
echo DB_PASSWORD=>> .env
echo DB_NAME=gestor_horarios>> .env
echo OPENAI_API_KEY=tu_api_key>> .env

:: Crear .gitignore
echo Creando .gitignore...
echo # Python> .gitignore
echo __pycache__/>> .gitignore
echo *.py[cod]>> .gitignore
echo venv/>> .gitignore
echo .env>> .gitignore
echo # IDE>> .gitignore
echo .vscode/>> .gitignore
echo .idea/>> .gitignore

:: Descargar dependencias de JavaScript
echo Descargando dependencias de JavaScript...
mkdir static\js\vendor
cd static\js\vendor

:: Descargar Chart.js
curl -o chart.js https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js
:: Descargar Particles.js
curl -o particles.js https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js

cd ..\..\..

echo Configuracion completada!
echo.
echo Para iniciar el servidor: flask run
pause 