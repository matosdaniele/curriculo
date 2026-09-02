# Critérios de busca de vagas

Ajuste estes filtros quando quiser mudar o foco da campanha.

## Elegibilidade (cotas e afirmativas)

| Situação | Regra |
|----------|--------|
| **Não é PCD** | **Descartar** vagas reservadas ou afirmativas **exclusivas para PCD** (ex.: "Afirmativa PCD", "vaga PCD", "exclusiva PcD"). Não preparar carta nem recomendar candidatura. |
| **Pessoa parda** | **Aceitar** vagas com cota ou ação afirmativa para **pessoa parda** (ou "negro/pardo/indígena", "cotas raciais", "afirmativa raça/cor"). Preparar normalmente; na carta **não inventar** autodeclaração — isso é preenchido no formulário da empresa. |
| **Vaga ampla + afirmativa paralela** | Se a mesma empresa publica vaga geral **e** vaga afirmativa PCD separada, usar só a **vaga geral**. |
| **Dúvida no título** | Se não estiver claro se é exclusiva PCD, registrar em `applications.csv` como `descartada` com motivo "possível exclusiva PCD — confirmar JD" até a Daniele validar. |

## Inglês

| Situação | Regra |
|----------|--------|
| **Nível da candidata** | **Básico** ou **técnico** — leitura de documentação, termos de TI/SQL/cloud; curso interno (NCR) e uso profissional pontual. **Não** reuniões ou operação diária fluente em inglês. |
| **Aceitar na vaga** | "Inglês básico", "inglês técnico", "desejável", "para leitura de documentação", "intermediário" *(se o foco for técnico, não call diária em EN)* |
| **Descartar ou sinalizar forte** | "Inglês **fluente**", "advanced", "full professional proficiency", reuniões/apresentações diárias em inglês, atendimento a cliente internacional em EN |
| **Na carta** | Pode citar leitura de documentação técnica em inglês; **não** declarar fluência ou inglês avançado |

## Nível (senioridade) — alvo: **Pleno** + **DBA Sênior** (quando couber)

| Situação | Regra |
|----------|--------|
| **Alvo principal** | Vagas **Pleno** / **PL** / **Mid-level** — prioridade máxima na busca e nos pacotes. |
| **Alvo secundário (busca ativa)** | **DBA SQL Server Sênior / SR** — incluir nas buscas quando o núcleo for administração SQL Server (backup, restore, tuning, segurança, jobs, HA básico, ETL/SSIS). Daniele tem 12 anos em TI, atuação como **DBA Pleno** em produção e case de tuning (~24h→~1h30); já candidatou a DBA Sênior (ex.: PicPay). |
| **Aceitar** | Título ou JD com "Pleno", "PL", "PL/SR" *(se o núcleo for pleno)*, "Analista III" *(avaliar se ≈ pleno)*, **"DBA Sênior" / "DBA SR"** *(se critérios DBA Sênior abaixo)*, sem liderança formal como núcleo. |
| **Não priorizar / descartar na busca** | **Júnior**, **JR**, estágio, trainee — **não preparar carta**. |
| **Sênior — Analista BI/Dados/Engenharia** | **Não buscar ativamente** (diferente de DBA Sênior). Só preparar se URL colada **ou** fit técnico ≥ 75 **e** gaps de senioridade/liderança forem honestos na carta (como Stone/Boticário). |
| **Descartar qualquer sênior** | Liderança de time, gestão de budget/metas em cascata ou "especialista referência" como requisito **central** → **descartar**. |
| **Termos de busca** | Rotacionar **Pleno** e **DBA Sênior** (ver lista abaixo). |

### DBA Sênior — quando buscar e preparar

| Critério | Buscar / preparar | Descartar |
|----------|-------------------|-----------|
| **Núcleo técnico** | SQL Server, T-SQL, backup/restore, tuning, segurança, jobs, SSIS/ETL, modelagem, sustentação produção | Oracle/PostgreSQL como **único** SGBD; núcleo cloud DE (Databricks/Snowflake) sem SQL Server |
| **Fit mínimo** | Score ≥ **75** (técnico forte compensa título sênior) | Fit < 75 ou red flags de modalidade/inglês |
| **Senioridade na carta** | Admitir gap honesto: título formal pleno, prontidão para ownership sênior em operação SQL Server (como PicPay); **não** inventar anos extras nem liderança formal | — |
| **Gaps esperados** | AWS/Azure avançado, Always On/RAC, sharding, log shipping, gestão de time — citar como aprofundamento, não como experiência central | — |
| **Referência de tom** | `carta-apresentacao-picpay-dba-senior.md`, `checklist-entrevista-safeweb-dba.md` | — |

## Perfis-alvo (prioridade)

1. **DBA SQL Server Pleno**
2. **DBA SQL Server Sênior** *(busca ativa; ver critérios acima)*
3. **Analista de Dados / BI Pleno**
4. **Engenharia de Dados / BI Pleno** (quando SQL + ETL + modelagem forem o núcleo)

## Palavras-chave positivas

`SQL Server`, `T-SQL`, `DBA`, `Power BI`, `ETL`, `SSIS`, `BI`, `dados`, `modelagem`, `performance tuning`, `MongoDB`

## Palavras-chave neutras (avaliar caso a caso)

`PostgreSQL`, `MySQL`, `AWS`, `Databricks`, `dbt`, `Airflow`, `Python`, `engenharia de dados`

## Sinais de alerta (fit baixo ou descartar)

- Vaga **exclusiva PCD** / **Afirmativa PCD** (Daniele **não é PCD**)
- Vaga **júnior** / estágio / trainee (**descartar** — alvo é **pleno**)
- Vaga **sênior/staff** com liderança formal ou gestão de budget como requisito central (**descartar**)
- **DBA Sênior** com stack quase 100% Oracle/PostgreSQL sem SQL Server (**descartar**)
- **Analista BI/Dados Sênior** sem URL colada e fit < 75 (**não priorizar**; DBA Sênior segue regra própria acima)
- Stack quase 100% **Oracle** ou **PostgreSQL** sem SQL Server
- **Presencial obrigatório** fora de Porto Alegre/região metropolitana (salvo exceção explícita)
- Vaga genérica “analista” sem menção a SQL/dados/BI
- Requisito de **inglês fluente** / avançado para operação ou comunicação diária (**descartar**)
- Inglês **intermediário** só com red flag se a JD exigir calls/apresentações frequentes em inglês

## Modalidade

- **Preferência:** remoto (Brasil)
- **Aceitável:** híbrido em Porto Alegre / região metropolitana
- **Evitar:** presencial em outra cidade sem realocação

## Faixa salarial (referência interna)

Preencher quando souber o piso desejado. O agente **não inventa** expectativa salarial nas cartas.

| Perfil | Piso desejado (CLT) | Observação |
|--------|---------------------|------------|
| DBA Pleno | _(preencher)_ | Alvo principal |
| DBA Sênior | _(preencher)_ | Busca ativa quando fit ≥ 75 e núcleo SQL Server |
| Analista BI Pleno | _(preencher)_ | Alvo principal |
| Analista BI/Dados Sênior | _(preencher)_ | Só exceção (URL colada ou fit ≥ 75) |

## Empresas / setores de interesse

- Fintech, bancos digitais, pagamentos (PicPay, Stone, etc.)
- Food delivery / marketplaces (iFood, etc.)
- Consultorias de dados e BI
- Telecom (histórico Vivo)
- Saúde, benefícios, varejo com operação crítica de dados

## Fontes de busca (sites prioritários)

Consultar **nesta ordem** em cada lote (após `jobs/queue.md`):

| # | Site | URL base | Uso |
|---|------|----------|-----|
| 1 | Keyrus | https://jobs.keyrus.com.br/ | Ex-empregadora; BI/dados |
| 2 | Trampos | https://trampos.co/ | Tech e remoto |
| 3 | Nerdin | https://www.nerdin.com.br/vagas | Foco TI (dados, infra, dev); candidatura gratuita |
| 4 | Catho | https://www.catho.com.br/ | Amplo mercado BR |
| 5 | LinkedIn | https://www.linkedin.com/ | Vagas + alertas |
| 6 | Gupy | https://portal.gupy.io/ | Portais de empresas |
| 7 | Recrutei | https://talent.recrutei.com.br/recrutei-empregos/vacancy | Agregador |
| 8 | Glassdoor | https://www.glassdoor.com.br/Job/ | Salários e vagas |
| 9 | Indeed | https://br.indeed.com/ | Amplo mercado BR |
| 10 | Empregare | https://www.empregare.com/pt-br | Vagas BR |

### Termos de busca sugeridos

Rotacionar por perfil-alvo (incluir **pelo menos 1 termo DBA Sênior** por lote):

**DBA (prioridade):**
- `DBA SQL Server Pleno remoto`
- `DBA SQL Server PL remoto`
- `DBA SQL Server Sênior remoto`
- `DBA SQL Server SR remoto`
- `Administrador banco de dados Sênior SQL Server remoto`

**BI / Dados (Pleno):**
- `Analista BI Pleno Power BI remoto`
- `Analista de Dados Pleno SQL Server remoto`
- `ETL SSIS Pleno remoto`

### Fontes bloqueadas (não usar)

| Site | Motivo |
|------|--------|
| **BeBee** (`https://bebee.com/`) | Não permite candidatura gratuita — **não buscar**, não preparar pacote só com link BeBee |
| **Agregadores sem link de inscrição** (ex.: eu.dev.br, Workflowza, Remotar sem redirect) | Só citam a vaga; **não preparar carta** até achar URL oficial (Gupy, careers da empresa, LinkedIn Easy Apply, Empregare, e-mail de RH) |

Se a mesma vaga aparecer no BeBee/agregador **e** em fonte gratuita com candidatura, usar **somente** a URL gratuita.

### Regras na descoberta

- Registrar **URL canônica** da vaga (página da empresa/Gupy/LinkedIn), não só o agregador.
- **Não preparar pacote** se a única fonte for agregador sem botão/link de candidatura verificável.
- Se a mesma vaga aparecer em vários sites, uma linha em `applications.csv` (URL principal).
- Respeitar elegibilidade (PCD, inglês, modalidade) antes de preparar pacote.
- **Ignorar BeBee** e qualquer agregador que cobre para candidatar.
- No **relatório do lote**, incluir hora de execução (UTC-3) e coluna **Horário** (jornada da vaga) — ver `RUNBOOK.md` §7.

## Limite diário sugerido

| Etapa | Quantidade |
|-------|------------|
| Vagas descobertas | até 15 |
| Pré-selecionadas (fit ≥ 60) | até 8 |
| Pacotes completos (carta + análise) | até 5 |
| Candidaturas enviadas | **0 automático** — só após revisão humana |

## Score de fit (0–100)

| Faixa | Significado | Ação |
|-------|-------------|------|
| 85–100 | Forte | Preparar carta completa + versão curta LinkedIn |
| 70–84 | Bom | Preparar carta; revisar gaps antes de aplicar |
| 60–69 | Parcial | Registrar na fila; aplicar só se poucas vagas no dia |
| 40–59 | Fraco | Arquivar com motivo; não gastar carta |
| 0–39 | Descartar | Registrar motivo em `applications.csv` |

### Pesos sugeridos

- **40%** — match técnico (SQL Server, T-SQL, DBA ou BI conforme a vaga)
- **25%** — senioridade vs experiência real
- **20%** — modalidade e localização
- **15%** — setor / tipo de empresa / red flags na JD
