#!/usr/bin/env bash
# Gera o site na raiz do repositório (index.html, en.html, etc.).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
LAYOUT="$ROOT/site/layout.html"
TMP="$ROOT/.build-tmp"

if ! command -v pandoc >/dev/null; then
  echo "Erro: pandoc não encontrado." >&2
  exit 1
fi

mkdir -p "$ROOT/css" "$ROOT/js" "$TMP"

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
  local pt_active="${13}"
  local en_active="${14}"
  local sistemas_active="${15}"
  local sql_active="${16}"
  local lang_nav="${17}"
  local pdf_download="${18}"
  local pdf_href="${19}"

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
    -e "s|__PDF_DOWNLOAD__|$pdf_download|g" \
    -e "s|__TOC_LABEL__|$toc_label|g" \
    -e "s|__FOOTER__|$footer|g" \
    -e "s|__LANG_PT_ACTIVE__|$pt_active|g" \
    -e "s|__LANG_EN_ACTIVE__|$en_active|g" \
    -e "s|__VARIANT_SISTEMAS_ACTIVE__|$sistemas_active|g" \
    -e "s|__VARIANT_SQL_ACTIVE__|$sql_active|g" \
    -e "s|__LANG_NAV_LABEL__|$lang_nav|g" \
    -e "s|__PDF_HREF__|$pdf_href|g" \
    "$LAYOUT" > "$TMP/layout.html"

  sed -e '/__BODY__/r '"$TMP/body.html" -e '/__BODY__/d' "$TMP/layout.html" > "$out"
}

build_page "curriculo.md" "$ROOT/index.html" "pt-BR" \
  "Daniele de Lima Matos — Currículo" \
  "DBA Pleno · Engenharia de Dados · Business Intelligence" \
  "Currículo profissional de Daniele de Lima Matos — DBA, dados e BI." \
  "Currículo" \
  "Ir para o conteúdo" \
  "Imprimir / PDF" \
  "Imprimir currículo" \
  "Índice" \
  "Daniele de Lima Matos · Currículo online" \
  "is-active" "" "" "" \
  "Idioma" \
  "Baixar PDF" \
  "Curriculo-DanieleLM.pdf"

build_page "curriculo-en.md" "$ROOT/en.html" "en" \
  "Daniele de Lima Matos — Resume" \
  "Senior DBA · Data Engineering · Business Intelligence" \
  "Professional resume of Daniele de Lima Matos — DBA, data and BI." \
  "Resume" \
  "Skip to content" \
  "Print / PDF" \
  "Print resume" \
  "Contents" \
  "Daniele de Lima Matos · Online resume" \
  "" "is-active" "" "" \
  "Language" \
  "Download PDF" \
  "Curriculo-DanieleLM.pdf"

build_page "curriculo-analista-sistemas-auxiliadora.md" "$ROOT/analista-sistemas.html" "pt-BR" \
  "Daniele de Lima Matos — Analista de Sistemas" \
  "Analista de Sistemas · Sustentação · Requisitos · SQL" \
  "Currículo focado em Analista de Sistemas — Daniele de Lima Matos." \
  "Versão Analista de Sistemas" \
  "Ir para o conteúdo" \
  "Imprimir / PDF" \
  "Imprimir currículo" \
  "Índice" \
  "Versão Analista de Sistemas · candidaturas TI / sustentação" \
  "" "" "is-active" "" \
  "Idioma" \
  "Baixar PDF" \
  "curriculo-analista-sistemas-auxiliadora.pdf"

build_page "curriculo-desenvolvedor-sql-vetta.md" "$ROOT/desenvolvedor-sql.html" "pt-BR" \
  "Daniele de Lima Matos — Desenvolvedor SQL" \
  "Desenvolvedor SQL · T-SQL · ETL · Business Intelligence" \
  "Currículo focado em Desenvolvedor SQL — Daniele de Lima Matos." \
  "Versão Desenvolvedor SQL" \
  "Ir para o conteúdo" \
  "Imprimir / PDF" \
  "Imprimir currículo" \
  "Índice" \
  "Versão Desenvolvedor SQL · candidatura Vetta" \
  "" "" "" "is-active" \
  "Idioma" \
  "Baixar PDF" \
  "curriculo-desenvolvedor-sql-vetta.pdf"

rm -rf "$TMP"

# GitHub Pages: não usar Jekyll (evita README.md virar página inicial)
touch "$ROOT/.nojekyll"

echo "Site gerado na raiz do repositório:"
echo "  - index.html"
echo "  - en.html"
echo "  - analista-sistemas.html"
echo "  - desenvolvedor-sql.html"
echo "  - css/  js/"
echo "  - Curriculo-DanieleLM.pdf (incluir no commit para download no site)"
echo ""
echo "Visualizar: python3 -m http.server 8080"
echo "GitHub Pages: Settings → Pages → Branch main → Folder / (root)"
