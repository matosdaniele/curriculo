#!/usr/bin/env bash
# Gera PDF do currículo para candidatura Vetta — Desenvolvedor(a) SQL Pleno.
set -euo pipefail
cd "$(dirname "$0")"
./build-pdf.sh curriculo-desenvolvedor-sql-vetta.md
echo "Concluído:"
echo "  - curriculo-desenvolvedor-sql-vetta.pdf"
