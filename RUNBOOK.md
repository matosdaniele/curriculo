# Runbook — lote diário de candidaturas

Fluxo semi-automatizado: o agente **prepara**; Daniele **revisa e envia**.

## Comando para iniciar o dia

```
Execute o lote de candidaturas de hoje conforme RUNBOOK.md
```

Variantes:

```
Busque vagas remotas **Pleno** e **DBA SQL Server Sênior** (quando couber ao currículo) e Analista BI publicadas nas últimas 24h e prepare até 5 pacotes completos.
```

```
Processe esta URL de vaga: [cole o link]
```

## Regras invioláveis

1. **Nunca enviar candidatura** — não clicar Submit, não Easy Apply, não auto-apply.
2. **Nunca inventar experiência** — só usar fatos de `base-resume.md`.
3. **Ser franca sobre gaps** — como nas cartas PicPay e Stone.
4. **Não duplicar** — checar `applications.csv` antes de preparar uma vaga.
5. **Manter tom** das cartas existentes (`carta-apresentacao-*.md`): profissional, direto, em português.
6. **Elegibilidade cotas** (ver `config/criterios-busca.md`):
   - Daniele **não é PCD** → **não** preparar carta para vagas exclusivas/afirmativas PCD.
   - **Aceita** vagas com cota para **pessoa parda** (ou negro/pardo/indígena) → preparar normalmente; autodeclaração só no formulário da empresa, nunca inventada na carta.
7. **Inglês** (ver `config/criterios-busca.md`):
   - Daniele tem inglês **básico/técnico** (documentação) — **aceitar** vagas com exigência básica, técnica ou intermediária focada em leitura.
   - **Descartar** vagas que exijam inglês **fluente** ou comunicação diária em inglês; na carta citar só leitura técnica, nunca fluência.
8. **Nível** (ver `config/criterios-busca.md`):
   - Buscar e priorizar vagas **Pleno / PL**.
   - Incluir **DBA SQL Server Sênior** nas buscas quando núcleo SQL Server + fit ≥ 75 (tom PicPay; gaps honestos).
   - **Não** preparar júnior/estágio.
   - Analista BI/Dados **Sênior**: só exceção (URL colada ou fit ≥ 75 sem liderança/budget como núcleo).
   - Descartar qualquer sênior com liderança de time ou gestão de budget como requisito central.

## Fluxo passo a passo

### 1. Preparação

- Ler `base-resume.md` e `config/criterios-busca.md`
- Ler `applications.csv` (URLs e empresas já registradas)
- Verificar fila em `jobs/queue.md` (URLs pendentes enviadas pela Daniele)

### 2. Descoberta de vagas

Fontes (em ordem):

1. URLs em `jobs/queue.md`
2. Sites prioritários em `config/criterios-busca.md` → **Fontes de busca**:
   - https://jobs.keyrus.com.br/
   - https://trampos.co/
   - https://www.nerdin.com.br/vagas
   - https://www.catho.com.br/
   - https://www.linkedin.com/
   - https://portal.gupy.io/
   - https://talent.recrutei.com.br/recrutei-empregos/vacancy
   - https://www.glassdoor.com.br/Job/
   - https://br.indeed.com/
   - https://www.empregare.com/pt-br
3. Alertas / favoritos que a Daniele colar no chat

**Não buscar em BeBee** (`https://bebee.com/`) — candidatura não é gratuita. Ver fontes bloqueadas em `config/criterios-busca.md`.

**Não preparar pacote** quando a única fonte for agregador sem URL de inscrição (ex.: eu.dev.br apontando Softtek sem vaga em jobs.softtek.com). Exigir link Gupy / careers da empresa / LinkedIn / Empregare / e-mail RH.

Usar os termos de busca sugeridos em `config/criterios-busca.md` (DBA SQL Server, Analista BI, etc.).

Para cada vaga encontrada, registrar imediatamente em `applications.csv` com status `descoberta` ou `descartada`.

### 3. Extração da JD

Para vagas com fit potencial ≥ 60, criar pasta:

```
jobs/YYYY-MM-DD-empresa-cargo-slug/
```

Arquivos obrigatórios:

| Arquivo | Conteúdo |
|---------|----------|
| `jd.md` | Texto integral ou resumo fiel da vaga + link + data |
| `analise.md` | Score, matches, gaps, recomendação aplicar/sim/não |
| `carta-apresentacao.md` | Carta completa + versão curta LinkedIn |

Use `jobs/_template/` como base.

### 4. Análise de fit (`analise.md`)

Incluir:

- **Score (0–100)** com breakdown dos pesos em `config/criterios-busca.md`
- **Matches** — requisitos atendidos com evidência do currículo-base
- **Gaps** — o que falta ou é parcial; como abordar com honestidade
- **Recomendação** — `aplicar` | `considerar` | `não aplicar`
- **Trechos do CV** a enfatizar na carta

### 5. Carta de apresentação (`carta-apresentacao.md`)

Estrutura (seguir cartas PicPay/Stone/iFood):

```markdown
# Carta de apresentação — [Empresa]

**Vaga:** [título]
**Link:** [url]
**Uso:** colar no LinkedIn Easy Apply, portal da empresa ou enviar com PDF.

---

[Corpo da carta — 3–4 parágrafos + fechamento]

---

## Versão curta (se o LinkedIn limitar caracteres)

\`\`\`text
[até ~1500 caracteres]
\`\`\`
```

Regras de redação:

- Abrir com fit concreto (não genérico)
- Um parágrafo de experiência mais relevante + case ~24h→~1h30 quando couber
- Parágrafo de gaps honestos quando necessário
- Fechar com remoto, link do currículo e contatos
- Opcional: seção **InMail** (~400 chars) baseada em `linkedin-inmail.md`

### 6. Atualizar controle

Atualizar `applications.csv`:

```csv
data_descoberta,empresa,cargo,url,fit_score,status,data_aplicacao,pasta,notas
```

Status permitidos:

| Status | Significado |
|--------|-------------|
| `descoberta` | Vaga encontrada, ainda sem análise |
| `descartada` | Fit baixo ou red flag |
| `preparada` | Pasta completa; aguardando revisão humana |
| `aplicada` | Daniele confirmou envio |
| `entrevista` | Processo em andamento |
| `recusada` | Feedback negativo ou desistência |
| `oferta` | Proposta recebida |

### 7. Resumo para a Daniele

Ao final do lote, enviar **cabeçalho com data e hora** (fuso **UTC-3 / America/Sao_Paulo**) e a tabela abaixo.

**Exemplo de cabeçalho:**

```
Lote executado em: 2026-08-19 16:36 (UTC-3)
Fontes consultadas: Keyrus, Trampos, Nerdin, Catho, LinkedIn, Gupy, Recrutei, Glassdoor, Indeed, Empregare
Vagas analisadas: 12 | Pacotes preparados: 5 | Descartadas: 4
```

Tabela (incluir **horário de trabalho** e **nível** de cada vaga; se nível não constar, inferir da JD ou escrever `não informado`):

| Empresa | Cargo | Nível | Fit | Horário | Recomendação | Pasta / link |
|---------|-------|-------|-----|---------|--------------|--------------|

Coluna **Nível** — preferência **Pleno**; exemplos: `Pleno`, `PL`, `Sênior`, `não informado`.

Coluna **Horário** — exemplos válidos:

- `seg–sex 8h–18h`
- `comercial`
- `flexível`
- `12x36`
- `44h/semana`
- `não informado`

Registrar também em cada `jd.md`: **Hora de descoberta** (momento em que a vaga entrou no lote).

E listar **ações humanas**:

- [ ] Revisar carta em `jobs/.../carta-apresentacao.md`
- [ ] Ajustar currículo PDF se necessário
- [ ] Aplicar manualmente e marcar `applications.csv` como `aplicada`

## Manutenção semanal (opcional)

- Arquivar vagas `descartadas` antigas (> 30 dias)
- Revisar `config/criterios-busca.md` (salário, foco DBA vs BI)
- Sincronizar `base-resume.md` se o site (`index.html`) for atualizado

## Arquivos de referência

| Arquivo | Uso |
|---------|-----|
| `base-resume.md` | Fonte da verdade |
| `config/criterios-busca.md` | Filtros e scoring |
| `applications.csv` | Log anti-duplicata |
| `jobs/queue.md` | URLs enviadas manualmente |
| `linkedin-inmail.md` | Modelos InMail curtos |
| `carta-apresentacao-*.md` | Tom e estrutura das cartas |
