#!/usr/bin/env bash
# Gera PDF a partir de curriculo.md (ou outro .md passado como argumento).
set -euo pipefail

cd "$(dirname "$0")"

INPUT="${1:-curriculo.md}"
BASE="${INPUT%.md}"
OUTPUT="${BASE}.pdf"
HTML="${BASE}.html"

if [[ ! -f "$INPUT" ]]; then
  echo "Arquivo não encontrado: $INPUT" >&2
  exit 1
fi

build_with_chrome() {
  local title="${1:-Currículo}"
  if ! command -v pandoc >/dev/null; then
    echo "Erro: pandoc não encontrado." >&2
    return 1
  fi

  local chrome=""
  for c in google-chrome google-chrome-stable chromium chromium-browser; do
    if command -v "$c" >/dev/null; then
      chrome="$c"
      break
    fi
  done

  if [[ -z "$chrome" ]]; then
    echo "Erro: Chrome/Chromium não encontrado para gerar PDF." >&2
    return 1
  fi

  pandoc "$INPUT" -o "$HTML" \
    --standalone \
    --metadata title="$title" \
    --css pdf.css \
    --embed-resources

  "$chrome" --headless --disable-gpu --no-pdf-header-footer \
    --print-to-pdf="$OUTPUT" \
    "file://$(realpath "$HTML")" \
    2>/dev/null

  echo "PDF gerado com HTML + $chrome: $OUTPUT"
}

# Método 1: Pandoc + LaTeX (se disponível e sem erro)
if command -v pandoc >/dev/null && command -v xelatex >/dev/null; then
  if kpsewhich lmodern.sty >/dev/null 2>&1; then
    if pandoc "$INPUT" -o "$OUTPUT" \
      --pdf-engine=xelatex \
      -V geometry:margin=2cm \
      -V lang=pt-BR 2>/dev/null; then
      echo "PDF gerado com Pandoc/LaTeX: $OUTPUT"
      exit 0
    fi
    echo "Aviso: Pandoc/LaTeX falhou. Usando fallback HTML + Chrome..."
    echo
  else
    echo "Aviso: pacote LaTeX lmodern ausente."
    echo "  Instale com: sudo apt install lmodern"
    echo "  Usando fallback HTML + Chrome..."
    echo
  fi
fi

# Método 2: HTML + Chrome headless
TITLE="Currículo"
[[ "$INPUT" == *-en.md ]] && TITLE="Resume"
build_with_chrome "$TITLE"
