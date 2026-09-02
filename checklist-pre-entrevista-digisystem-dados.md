# Pré-entrevista Rê — Digisystem · Analista de Dados (SPS0001727)

**Código de acesso:** `D6P31JUL`  
**Formato:** conversa com assistente de IA (Rê); humano analisa depois  
**Modalidade da vaga:** remoto · CLT  
**Núcleo da vaga:** PostgreSQL avançado + PL/pgSQL + ETL + tuning + relatórios

---

## Fit rápido (seja honesta)
| Pedido | Você |
|--------|------|
| SQL avançado + tuning + planos | Forte (SQL Server / T-SQL; case 24h→1h30) |
| ETL / integração | Forte (SSIS) |
| Modelagem + qualidade | Forte |
| Relatórios / BI | Forte (Power BI) |
| Git / Python | Bom |
| **PostgreSQL + PL/pgSQL avançado** | Parcial (formação/uso complementar; produção = SQL Server) |

**Como posicionar:** domínio profundo de SQL/ETL/tuning em SQL Server; conceitos transferem para PostgreSQL; disposição de aprofundar PL/pgSQL no dia a dia. Não invente anos de Postgres em produção.

---

## Dicas Rê (prática)
- Ambiente quieto, boa internet; fale claro e em blocos curtos  
- Responda a pergunta pedida; depois 1 exemplo concreto  
- Se travar: “Posso estruturar: contexto → ação → resultado”  
- Não leia texto longo na tela — use bullets mentais  
- Código: se pedir exemplo SQL, use sintaxe genérica ou diga “em T-SQL eu faria X; em Postgres o equivalente é Y (EXPLAIN ANALYZE, function)”

---

## Pitch (30–45s)
> Sou Daniele, Analista de Dados/BI e DBA com foco em SQL. Atuei com consultas complexas, procedures, ETL/SSIS, qualidade de dados e Power BI. Case de tuning: job crítico de ~24h para ~1h30. Tenho modelagem relacional/dimensional e parceria com negócio e desenvolvimento. Minha base forte é SQL Server; trago o mesmo rigor de SQL, ETL e performance para PostgreSQL.

---

## Respostas-modelo (60–90s)

**1. Apresente-se / experiência com dados**  
12 anos em TI; Analista de Dados + DBA Pleno. Extração/transformação SQL, SSIS, reconciliação, indicadores e dashboards Power BI (incl. consultoria Vivo/Keyrus). Formação: ADS + MBA Data Science/BI + MBA bancos.

**2. PostgreSQL / PL/pgSQL**  
Experiência forte em SQL avançado (joins, CTE, window, procedures) em SQL Server; formação e uso complementar em PostgreSQL. Sei o papel de functions/procedures, EXPLAIN ANALYZE e boas práticas de índices. Em produção meu dia a dia foi T-SQL; transferível e com curva rápida em PL/pgSQL.

**3. Otimização / plano de execução**  
Olho duração, CPU/IO, plano (scans vs seeks), estatísticas, índices e reescrita (sargability, joins). Meço antes/depois. Case: ~24h → ~1h30.

**4. ETL / integração**  
SSIS: cargas incrementais, multi-fonte (arquivo, API, JSON/Mongo), validação origem×destino, rastreabilidade e notificação de falha.

**5. Qualidade de dados**  
Regras de negócio documentadas, checagem de duplicidade/nulos/integridade, homologação com área, não publicar número sem validar.

**6. Relatórios / BI**  
Power BI + KPIs; modelagem dimensional; apresentar resultado em linguagem de negócio (o que mudou na decisão).

**7. Exemplo de problema difícil**  
(STAR) Job/processo lento ou dado inconsistente → diagnóstico SQL/plano ou reconciliação → correção (índice/procedure/regra) → tempo ou qualidade melhorada.

**8. Trabalho com times**  
Traduzir pedido do negócio em consulta/ETL; alinhar com dev (índices, contratos de dados); comunicar risco e prazo.

---

## Se pedirem SQL ao vivo (esqueleto)
```sql
-- CTE + agregação + filtro
WITH base AS (
  SELECT cliente_id, DATE_TRUNC('month', dt) AS mes, SUM(valor) AS total
  FROM vendas
  WHERE dt >= CURRENT_DATE - INTERVAL '12 months'
  GROUP BY 1, 2
)
SELECT * FROM base WHERE total > 0
ORDER BY mes, total DESC;
```
Citar: `EXPLAIN (ANALYZE, BUFFERS)`, índices, evitar função na coluna do WHERE.

---

## Perguntas suas (se sobrar espaço)
1. Stack: só PostgreSQL ou também outros bancos?  
2. Volume / DW / ferramentas de ETL atuais?  
3. Próxima etapa após a Rê?

---

## Antes de clicar
- [ ] Ambiente tranquilo + fone  
- [ ] Código `D6P31JUL` à mão  
- [ ] Pitch + case 24h→1h30 ensaiados  
- [ ] Frase pronta sobre Postgres (honesta)  
- [ ] Água; responder sem pressa
