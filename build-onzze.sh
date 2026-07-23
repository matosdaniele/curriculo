#!/usr/bin/env bash
# Gera PDF do currículo para candidatura Onzze — Desenvolvedor SQL (Analista de Dados).
set -euo pipefail
cd "$(dirname "$0")"
./build-pdf.sh curriculo-desenvolvedor-sql-onzze.md
echo "Concluído:"
echo "  - curriculo-desenvolvedor-sql-onzze.pdf"
