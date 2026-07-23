#!/usr/bin/env bash
# Gera PDF do currículo para candidatura Petlove — Analista de Dados Pleno (FNDIFB).
set -euo pipefail
cd "$(dirname "$0")"
./build-pdf.sh curriculo-analista-dados-petlove.md
echo "Concluído:"
echo "  - curriculo-analista-dados-petlove.pdf"
