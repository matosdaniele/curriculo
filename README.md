# Currículo — Daniele de Lima Matos

Repositório do currículo profissional, com base no perfil do [LinkedIn](https://www.linkedin.com/in/daniele-de-lima-matos/).

## Arquivos

| Arquivo | Descrição |
|---------|-----------|
| [`curriculo.md`](curriculo.md) | Versão geral em português (DBA / dados / BI) |
| [`curriculo-en.md`](curriculo-en.md) | Versão em inglês (vagas internacionais / remotas) |
| [`curriculo-analista-sistemas-auxiliadora.md`](curriculo-analista-sistemas-auxiliadora.md) | Versão focada na vaga **Analista de Sistemas \| TI** — Auxiliadora Predial |
| [`carta-auxiliadora-predial.md`](carta-auxiliadora-predial.md) | Carta de apresentação para a mesma candidatura |

### Auxiliadora Predial (Analista de Sistemas)

```bash
chmod +x build-auxiliadora.sh
./build-auxiliadora.sh
```

Gera `curriculo-analista-sistemas-auxiliadora.pdf` e `carta-auxiliadora-predial.pdf`.

## Atualizar documentos (PDF)

Após editar os `.md`, regenere os PDFs:

```bash
chmod +x build-pdf.sh build-all.sh
./build-all.sh
```

Ou um arquivo por vez:

```bash
./build-pdf.sh              # gera curriculo.pdf
./build-pdf.sh curriculo-en.md   # gera curriculo-en.pdf
```

## Exportar para PDF

### Opção recomendada (script)

Use `./build-all.sh` ou os comandos acima.

O script tenta **Pandoc + LaTeX**; se faltar o pacote `lmodern`, usa **HTML + Chrome** automaticamente.

### Erro `lmodern.sty not found`

O TeX Live está instalado, mas o pacote de fontes `lmodern` foi removido. Corrija com:

```bash
sudo apt install lmodern
```

Depois:

```bash
pandoc curriculo.md -o curriculo.pdf --pdf-engine=xelatex -V geometry:margin=2cm
```

### Sem sudo

Use o script `build-pdf.sh` (fallback com Google Chrome) ou exporte pelo preview do Cursor/VS Code (imprimir → Salvar como PDF).

## Personalizar

No topo dos arquivos já constam e-mail e telefone. Você pode acrescentar GitHub ou portfólio, se quiser.

Os dados de experiência, formação e competências foram extraídos do LinkedIn em maio/2026.
