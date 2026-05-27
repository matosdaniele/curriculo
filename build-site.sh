#!/usr/bin/env bash
# Gera o site estático em site/ a partir dos arquivos Markdown.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SITE="$ROOT/site"
LAYOUT="$SITE/layout.html"
TMP="$SITE/.build-tmp"

if ! command -v pandoc >/dev/null; then
  echo "Erro: pandoc não encontrado." >&2
  exit 1
fi

mkdir -p "$SITE/css" "$SITE/js" "$TMP"

md_to_html() {
  local file="$1"
  pandoc "$file" -f gfm -t html5 --wrap=none 2>/dev/null | awk '
    BEGIN { mode = "header" }
    mode == "header" && /^<h1 / { next }
    mode == "header" && /^<p>/ { next }
    mode == "header" && /^<hr/ { mode = "body"; next }
    { print }
  '
}

build_page() {
  local md="$1"
  local out="$2"
  local lang="$3"
  local title="$4"
  local tagline="$5"
  local meta="$6"
  local eyebrow="$7"
  local skip="$8"
  local print="$9"
  local print_label="${10}"
  local toc_label="${11}"
  local footer="${12}"
  local variant_label="${13}"
  local pt_active="${14}"
  local en_active="${15}"
  local variant_active="${16}"
  local lang_nav="${17}"

  md_to_html "$ROOT/$md" > "$TMP/body.html"

  sed \
    -e "s|__LANG__|$lang|g" \
    -e "s|__TITLE__|$title|g" \
    -e "s|__TAGLINE__|$tagline|g" \
    -e "s|__META_DESC__|$meta|g" \
    -e "s|__EYEBROW__|$eyebrow|g" \
    -e "s|__SKIP__|$skip|g" \
    -e "s|__PRINT__|$print|g" \
    -e "s|__PRINT_LABEL__|$print_label|g" \
    -e "s|__TOC_LABEL__|$toc_label|g" \
    -e "s|__FOOTER__|$footer|g" \
    -e "s|__VARIANT_LABEL__|$variant_label|g" \
    -e "s|__LANG_PT_ACTIVE__|$pt_active|g" \
    -e "s|__LANG_EN_ACTIVE__|$en_active|g" \
    -e "s|__VARIANT_ACTIVE__|$variant_active|g" \
    -e "s|__LANG_NAV_LABEL__|$lang_nav|g" \
    "$LAYOUT" > "$TMP/layout.html"

  sed -e '/__BODY__/r '"$TMP/body.html" -e '/__BODY__/d' "$TMP/layout.html" > "$out"
}

build_page "curriculo.md" "$SITE/index.html" "pt-BR" \
  "Daniele de Lima Matos — Currículo" \
  "DBA Pleno · Engenharia de Dados · Business Intelligence" \
  "Currículo profissional de Daniele de Lima Matos — DBA, dados e BI." \
  "Currículo" \
  "Ir para o conteúdo" \
  "Imprimir / PDF" \
  "Imprimir currículo" \
  "Índice" \
  "Daniele de Lima Matos · Currículo online" \
  "Sistemas" \
  "is-active" "" "" \
  "Idioma"

build_page "curriculo-en.md" "$SITE/en.html" "en" \
  "Daniele de Lima Matos — Resume" \
  "Senior DBA · Data Engineering · Business Intelligence" \
  "Professional resume of Daniele de Lima Matos — DBA, data and BI." \
  "Resume" \
  "Skip to content" \
  "Print / PDF" \
  "Print resume" \
  "Contents" \
  "Daniele de Lima Matos · Online resume" \
  "Systems" \
  "" "is-active" "" \
  "Language"

build_page "curriculo-analista-sistemas-auxiliadora.md" "$SITE/analista-sistemas.html" "pt-BR" \
  "Daniele de Lima Matos — Analista de Sistemas" \
  "Analista de Sistemas · Sustentação · Requisitos · SQL" \
  "Currículo focado em Analista de Sistemas — Daniele de Lima Matos." \
  "Versão Analista de Sistemas" \
  "Ir para o conteúdo" \
  "Imprimir / PDF" \
  "Imprimir currículo" \
  "Índice" \
  "Versão Analista de Sistemas · candidaturas TI / sustentação" \
  "Sistemas" \
  "" "" "is-active" \
  "Idioma"

rm -rf "$TMP"

echo "Site gerado em $SITE/"
echo "  - index.html"
echo "  - en.html"
echo "  - analista-sistemas.html"
echo ""
echo "Visualizar: cd site && python3 -m http.server 8080"
echo "Abrir: http://localhost:8080"
