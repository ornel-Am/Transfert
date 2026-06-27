#!/bin/bash
# build.sh - Construction de l'application Transfert

set -e

APP_NAME="transfert"
APP_VERSION="1.0.0"
VENV_DIR="venv-build"

echo "🔨 Construction de Transfert v${APP_VERSION}"

# Nettoyage
rm -rf dist build __pycache__ "$VENV_DIR"

# Environnement virtuel
python3 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"

# Installation
pip install --upgrade pip > /dev/null 2>&1
pip install pyinstaller > /dev/null 2>&1

# Build
pyinstaller --onefile --windowed --name "$APP_NAME" src/transfert.py

# Vérification
if [ -f "dist/$APP_NAME" ]; then
    echo "✅ Build réussi: dist/$APP_NAME"
    echo "📏 Taille: $(du -h dist/$APP_NAME | cut -f1)"
else
    echo "❌ Échec du build"
    exit 1
fi

deactivate
echo "✅ Terminé !"
