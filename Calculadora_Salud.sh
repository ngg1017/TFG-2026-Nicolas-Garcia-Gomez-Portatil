#!/bin/bash

#Nos aseguramos de estar en la carpeta donde está el script
cd "$(dirname "$0")"

echo "========================================================"
echo "        INICIANDO LA CALCULADORA DE SALUD..."
echo "========================================================"
echo ""

#Quitamos los silenciadores para ver si te pide tu contraseña de la Raspberry
#Despues del primer arranque comentar
sudo apt-get update -y
sudo apt-get install -y python3-venv

#Comprobamos si el entorno local ya está creado
if [ ! -f "entorno_local/bin/activate" ]; then
    echo "[!] Es la primera vez en la Raspberry. Creando entorno virtual local..."
    python3 -m venv entorno_local
    
    echo "[!] Descargando dependencias (requirements.txt)..."
    source entorno_local/bin/activate
    pip install --upgrade pip
    pip install -r requirements.txt
else
    echo "[OK] Entorno virtual listo."
    source entorno_local/bin/activate
fi

echo ""
echo "========================================================"
echo "  Compilando aplicacion web. Esto puede tardar un poco..."
echo "  El navegador se abrira AUTOMATICAMENTE cuando termine."
echo "  Para apagar la calculadora, cierra esta terminal."
echo "========================================================"
echo ""

export REFLEX_UPLOAD_DIR="/tmp/reflex_uploads"

#SENSOR INTELIGENTE:
(
  while ! bash -c "echo > /dev/tcp/127.0.0.1/3000" 2>/dev/null; do
    sleep 1
  done
  xdg-open http://localhost:3000 > /dev/null 2>&1
) &

#Arrancamos el servidor
reflex run