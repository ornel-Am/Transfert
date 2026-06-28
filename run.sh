#!/bin/bash
# run.sh - Lance l'application

cd "$(dirname "$0")"

if [ -f "dist/transfert" ]; then
    echo "🚀 Lancement de Transfert..."
    ./dist/transfert
else
    echo "❌ Exécutable non trouvé !"
    echo "   Lancez d'abord: ./build.sh"
    exit 1
fi
