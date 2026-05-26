#!/usr/bin/env bash
# Gera PDF do currículo e da carta para candidatura Auxiliadora Predial.
set -euo pipefail
cd "$(dirname "$0")"
./build-pdf.sh curriculo-analista-sistemas-auxiliadora.md
./build-pdf.sh carta-auxiliadora-predial.md
echo "Concluído:"
echo "  - curriculo-analista-sistemas-auxiliadora.pdf"
echo "  - carta-auxiliadora-predial.pdf"
