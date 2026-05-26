#!/usr/bin/env bash
# Regenera todos os PDFs a partir dos arquivos Markdown.
set -euo pipefail
cd "$(dirname "$0")"
./build-pdf.sh curriculo.md
./build-pdf.sh curriculo-en.md
echo "Concluído: curriculo.pdf e curriculo-en.pdf"
