# Análise de fit — Thera Consulting / Analista de Dados Sênior

**Score:** 73 / 100  
**Recomendação:** considerar (já em entrevista)  
**Data:** 2026-09-02

## Breakdown do score

| Critério | Peso | Nota (0–100) | Ponderado | Evidência |
|----------|------|--------------|-----------|-----------|
| Match técnico | 40% | 78 | 31,2 | SQL, SSIS, modelagem dimensional, qualidade, Power BI, data marts; “arquitetura de domínio” e governança formal parciais |
| Senioridade | 25% | 52 | 13,0 | Título pleno no CV; 12 anos em TI; ownership de marts/pipelines, sem arquitetura enterprise |
| Modalidade/local | 20% | 100 | 20,0 | Remoto; Alvorada/RS |
| Setor/red flags | 15% | 58 | 8,7 | PJ 5 meses; consultoria SAP (sem SAP no CV); JD genérica |
| **Total** | | | **73** | |

## Matches (requisitos atendidos)

| Requisito da vaga | Evidência no currículo-base |
|-------------------|----------------------------|
| Pipelines | SSIS/DTS na 838 e Keyrus; multi-fonte (arquivo, API, JSON/Mongo); incremental, log, rastreabilidade |
| Modelagem | Dimensional (fatos/dimensões), data marts MIS Vivo; views/procedures analíticas na 838 |
| Qualidade da informação | Reconciliação origem×destino, duplicidade/nulos, homologação, regra documentada |
| Ativos analíticos | Data marts + Power BI (negócio); views/procedures/bases SQL (tecnologia) |
| Domínios de negócio | Contact center/MIS (atendimento, retenção, campanhas, faturamento, premiação); benefícios/operação na 838 |
| Disponibilidade imediata | Saída 838 em mar/2026; busca ativa |
| Remoto | Preferência explícita |
| Consultoria | Keyrus (cliente Telefônica/Vivo) — já entregou em modelo de projeto/cliente |

## Gaps (parcial ou ausente)

| Requisito | Situação | Como abordar |
|-----------|----------|----------------------|
| Título sênior | parcial | 12 anos TI, DBA/Analista Pleno com ownership; não inventar liderança/budget |
| Arquitetura de dados dos domínios | parcial | Traduzir para camada analítica do domínio (fonte → ETL → mart → consumo), não data mesh/lakehouse |
| Governança formal | parcial | Qualidade, regra única, acesso (roles), Git, homologação — não catálogo Collibra/stewardship |
| Spark / Airflow / ADF / lake | ausente (só em agregador) | Não citar como experiência; perguntar o stack do cliente |
| SAP / BW | ausente | Thera é SAP; ETL multi-fonte transfere; SAP não foi dia a dia |
| PJ 5 meses | a confirmar | CNPJ e pretensão — perguntar faixa deles primeiro |

## Trechos a enfatizar

1. Keyrus/Vivo MIS: domínio de contact center → data marts + KPIs + Power BI
2. 838: pipelines SSIS + bases analíticas + qualidade/rastreabilidade
3. Case ~24h → ~1h30: ativo analítico só vale se chega no prazo e bate com a origem
4. Ponte negócio ↔ tech (C#, stakeholders)

## Red flags

- Contrato curto PJ (5 meses) — alinhar expectativa de continuidade
- JD genérica: o cliente real e o stack só aparecem na entrevista
- Agregadores inventaram Big Data/Spark — não estudar isso como se fosse a vaga
- Sênior de arquitetura vs. analista pleno com profundidade SQL/ETL

## Notas

- Processo provavelmente Recrutei (Rê ou humano). Mesmo formato da Digisystem.
- Confirmar na abertura: **analista remoto** ≠ engenheiro híbrido SP.
