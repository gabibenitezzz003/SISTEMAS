@echo off
echo Iniciando configuracion del proyecto...

:: Crear estructura de carpetas
echo Creando estructura de carpetas...
mkdir frontend\src\components
mkdir frontend\src\pages
mkdir frontend\src\utils
mkdir frontend\public
mkdir backend\app\db
mkdir backend\app\ia
mkdir backend\app\interfaz
mkdir backend\tests

:: Configurar frontend
echo Configurando frontend...
cd frontend

:: Crear package.json
echo {^
  "name": "gestor-horarios-gss",^
  "version": "1.0.0",^
  "dependencies": {^
    "@emotion/react": "^11.11.1",^
    "@emotion/styled": "^11.11.0",^
    "@mui/material": "^5.15.0",^
    "@mui/x-date-pickers": "^5.0.20",^
    "date-fns": "^2.30.0",^
    "react": "^18.2.0",^
    "react-dom": "^18.2.0",^
    "react-lottie": "^1.2.3",^
    "react-router-dom": "^6.20.0"^
  },^
  "devDependencies": {^
    "react-scripts": "5.0.1",^
    "@types/react": "^18.2.0",^
    "@types/react-dom": "^18.2.0",^
    "typescript": "^4.9.5"^
  },^
  "scripts": {^
    "start": "react-scripts start",^
    "build": "react-scripts build",^
    "test": "react-scripts test",^
    "eject": "react-scripts eject"^
  },^
  "eslintConfig": {^
    "extends": [^
      "react-app"^
    ]^
  },^
  "browserslist": {^
    "production": [^
      ">0.2%%",^
      "not dead",^
      "not op_mini all"^
    ],^
    "development": [^
      "last 1 chrome version",^
      "last 1 firefox version",^
      "last 1 safari version"^
    ]^
  }^
} > package.json

:: Instalar dependencias de frontend
echo Instalando dependencias de frontend...
call npm install

cd ..

:: Configurar backend
echo Configurando backend...
python -m venv venv
call venv\Scripts\activate

:: Instalar dependencias de Python
echo Instalando dependencias de Python...
cd backend
pip install -r requirements.txt
cd ..

:: Crear archivo .env
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
echo # Node>> .gitignore
echo node_modules/>> .gitignore
echo build/>> .gitignore
echo .env.local>> .gitignore
echo .env.development.local>> .gitignore
echo .env.test.local>> .gitignore
echo .env.production.local>> .gitignore
echo # IDE>> .gitignore
echo .vscode/>> .gitignore
echo .idea/>> .gitignore

:: Después de crear las carpetas, agregar:
echo Creando archivos iniciales...

:: Crear index.html
echo ^<!DOCTYPE html^>^
<html lang="es"^>^
  ^<head^>^
    ^<meta charset="utf-8" /^>^
    ^<link rel="icon" href="%%PUBLIC_URL%%/favicon.ico" /^>^
    ^<meta name="viewport" content="width=device-width, initial-scale=1" /^>^
    ^<meta name="theme-color" content="#000000" /^>^
    ^<meta name="description" content="Sistema de Gestión de Horarios GTR" /^>^
    ^<link rel="apple-touch-icon" href="%%PUBLIC_URL%%/logo192.png" /^>^
    ^<link rel="manifest" href="%%PUBLIC_URL%%/manifest.json" /^>^
    ^<title^>GTR System^</title^>^
  ^</head^>^
  ^<body^>^
    ^<noscript^>Necesitas habilitar JavaScript para ejecutar esta aplicación.^</noscript^>^
    ^<div id="root"^>^</div^>^
  ^</body^>^
</html^> > frontend\public\index.html

:: Crear manifest.json
echo {^
  "short_name": "GTR System",^
  "name": "Sistema de Gestión de Horarios GTR",^
  "icons": [^
    {^
      "src": "favicon.ico",^
      "sizes": "64x64 32x32 24x24 16x16",^
      "type": "image/x-icon"^
    }^
  ],^
  "start_url": ".",^
  "display": "standalone",^
  "theme_color": "#000000",^
  "background_color": "#ffffff"^
} > frontend\public\manifest.json

echo Configuracion completada!
echo.
echo Para iniciar el frontend: cd frontend ^& npm start
echo Para iniciar el backend: cd backend ^& python -m flask run
pause 