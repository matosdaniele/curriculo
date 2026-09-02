# Pastas de vagas

Cada candidatura preparada fica em:

```
jobs/YYYY-MM-DD-empresa-cargo-slug/
├── jd.md                  # descrição da vaga
├── analise.md             # score de fit e recomendação
└── carta-apresentacao.md  # carta pronta para revisão
```

## Como criar

1. Copie `jobs/_template/` para a nova pasta com slug descritivo.
2. Preencha os três arquivos.
3. Atualize `applications.csv` na raiz.

## Fila manual

URLs para processar no próximo lote: `jobs/queue.md`

## Cartas antigas

As cartas na raiz do repo (`carta-apresentacao-*.md`) permanecem como referência de tom. Novas candidaturas devem ir em `jobs/`.
