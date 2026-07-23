# Preparação — Entrevista com gestor(a)  
## Sicredi | Analista de Dados PL — Inteligência de Marketing

Documento de treino: termos técnicos, posicionamento e respostas-modelo.  
Atualizado: julho/2026

---

## Frase-mestra (45 segundos)

Na Keyrus, no projeto da Vivo, eu tratava dados de **SAC e retenção** com **SQL**, fazia **cargas com SSIS** entre servidores e alimentava bases para o **Power BI**, perto da área de negócio. Na 838 aprofundei **SQL**, **qualidade de dados** e **performance** de consultas. Quero aplicar isso em **jornadas e inteligência de marketing** na Sicredi: dados confiáveis, indicadores claros e apoio à decisão.

---

## 1. Glossário da vaga (prioridade alta)

| Termo | Em português simples | Como ligar à sua experiência |
|-------|----------------------|------------------------------|
| **SQL / T-SQL** | Linguagem para consultar e manipular dados no banco | Ponto forte (838, Keyrus) |
| **Join** | Juntar tabelas pelo que elas têm em comum (ex.: id do cliente) | “Faço joins entre várias tabelas para montar a base da análise” |
| **CTE (`WITH`)** | Consulta organizada em etapas, mais fácil de ler | “Uso para quebrar lógica longa em partes” |
| **View / procedure** | View = consulta salva; procedure = rotina no banco | “Crio views/procedures para bases e rotinas analíticas” |
| **ETL / SSIS** | Extrair → transformar → carregar dados (SSIS = ferramenta Microsoft) | Vivo: carga servidor→servidor com SSIS |
| **Qualidade de dados** | Conferir se o dado está certo, completo, sem duplicar | Reconciliação origem×destino |
| **Grain** | Nível do dado (por dia? por cliente? por campanha?) | “Defino a granularidade correta da tabela analítica” |
| **KPI / indicador** | Número que mede resultado (abertura, conversão, retenção) | Keyrus: KPIs e dashboards |
| **Power BI** | Ferramenta de dashboard/relatório | Conexão SQL + fatos/dimensões + painéis |
| **Fato e dimensão** | Fato = números (vendas, cliques); dimensão = contexto (data, canal, cliente) | Modelagem dimensional Keyrus |
| **Jornada** | Caminho do cliente (conhecer → usar → ficar ou sair) | Dados de SAC/retenção Vivo |
| **Retenção** | Cliente que continua | Caso mais forte |
| **Churn** | Cliente que sai / cancela | Conceito; analisar via SQL se tiver base |
| **Conversão** | Quem fez a ação desejada (ex.: abriu e contratou) | Conceito; não inventar campanha se não fez |
| **Segmentação** | Separar clientes em grupos | “Via SQL por perfil/comportamento; sem suite CRM” |
| **CRM** | Gestão do relacionamento (e-mail, SMS, regras) | Não operou a ferramenta; operou **dados** de retenção/SAC |
| **Performance / tuning** | Deixar consulta/job mais rápido | Case ~24h → ~1h30 |

---

## 2. O que admitir sem medo (diferenciais / avançado)

| Termo | Resposta segura |
|-------|-----------------|
| **A/B test** | “Não conduzi testes A/B; entendo a ideia de comparar grupos; posso aprender” |
| **Holdout / grupo de controle** | “Conceito: grupo que não recebe a ação para medir impacto” |
| **LTV** | “Valor do cliente no tempo; não calculei LTV formalmente” |
| **Atribuição** | “Como creditar o resultado a um canal; não é meu forte hoje” |
| **Databricks / PySpark** | “Ainda não usei no dia a dia; tenho Python/pandas no MBA” |
| **DAX avançado** | “Power BI com modelo e dashboards; DAX avançado em evolução” |

---

## 3. Perguntas e respostas (treino)

### O que é ETL?
Extrair dados da origem, tratar/transformar e carregar na base que o BI ou a análise usa. Eu fiz isso com **SSIS**.

### Qual sua experiência com CRM?
Não operei a ferramenta de CRM. Trabalhei com **dados de retenção e SAC**, que alimentam análise de relacionamento.

### Como você garante qualidade?
Valido volumetria, duplicidade, reconcilio origem e destino e documento regras de negócio.

### Conte um case técnico
Job/consulta crítica que demorava muitas horas; revisei filtros e lógica para o cliente certo e reduzi para cerca de **1h30**, liberando o dado a tempo para o negócio.

### E marketing digital / campanhas?
Minha base é dados e BI. Campanha/A-B não foi meu dia a dia; retenção/SAC sim. Aprendo rápido o glossário do time.

---

## 4. Respostas objetivas (material enviado à área — referência)

### Ferramentas / tecnologias
SQL Server / T-SQL; SSIS (ETL); Power BI; Excel; modelagem dimensional (fatos/dimensões); qualidade e reconciliação de dados; Git; Jira; MongoDB (complementar); Python/pandas (MBA); Alteryx (curso Keyrus).

### Aderência ao perfil analítico / insights / negócio
Aderência alta. Sou analítica, investigo dados com SQL, entrego indicadores/dashboards (Power BI) e atuo perto do negócio (Keyrus/Vivo: SAC e retenção; 838: bases e performance). Foco em insights acionáveis e decisões com dados confiáveis.

### Por que contribuir / onde fará diferença
Construção e confiabilidade das bases (SQL/SSIS), qualidade dos dados e indicadores/dashboards. Diferença em: tratativa e carga; validação/reconciliação; performance de consultas; traduzir necessidade de negócio em análises/Power BI; parceria com as áreas.

### Conversão, retenção, churn, segmentação, performance
Mais forte em **retenção e SAC** (Keyrus/Vivo: SQL/SSIS → Power BI). Conversão, churn e segmentação avançada de CRM: conceito + análise via SQL, sem suite CRM nem A/B. **Performance:** sólida (ex.: ~24h → ~1h30).

### Interface Marketing / CRM / Growth / Produto
Não atuei como interface dedicada dessas áreas. Keyrus/Vivo: próxima ao negócio com dados de SAC/retenção. 838/consultoria: desenvolvimento e áreas usuárias (requisitos, homologação, indicadores).

### Interesse no Sicredi
Propósito cooperativo; cultura (GPTW); vaga alinhada (SQL, BI, dados de relacionamento). Alvorada + híbrido CAS viável. Quero crescer em analytics apoiando marketing/jornada.

---

## 5. Rotina de prática (15 min/dia)

1. Ler o glossário em voz alta (5 min).  
2. Gravar a frase-mestra 2 vezes.  
3. Responder as 5 perguntas da seção 3 **sem olhar** (≈40s cada).  
4. Anotar 3 termos que travou e repetir só eles.

---

## 6. Lembretes da Fabiana / Eliana

- Títulos no currículo: **Analista de Dados** / **Analista de Dados / BI** (não só “sistemas” ou só DBA).  
- Não marcar no material o que não domina (ex.: testes A/B).  
- Ser objetiva com o gestor; honestidade + vontade de aprender.

---

*Arquivo: `preparacao-entrevista-sicredi-marketing.md`*
