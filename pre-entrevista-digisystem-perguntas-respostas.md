# Pré-entrevista Digisystem — Analista de Dados (SPS0001727)

**Empresa:** Digisystem  
**Vaga:** ANALISTA DE DADOS (SPS0001727)  
**Plataforma:** Recrutei · assistente Rê  
**Código de acesso:** D6P31JUL  
**Data:** ago/2026  

---

## 1. PostgreSQL × SQL Server (performance e escalabilidade)

**Pergunta**

> Conheci sua trajetória com SQL Server, mas a vaga exige domínio em PostgreSQL. Pode detalhar uma situação complexa onde você teve que desenvolver ou otimizar consultas em PostgreSQL, explicando sua abordagem para garantir performance e escalabilidade?

**Resposta enviada**

```text
Na minha trajetória, o ambiente de produção em que atuei com maior profundidade foi Microsoft SQL Server: consultas complexas, procedures, análise de planos de execução, índices/estatísticas e um case de otimização de job crítico de ~24h para ~1h30.

Em PostgreSQL, meu contato é complementar (formação e prática de SQL/modelagem), não a mesma vivência hands-on de produção que tenho em SQL Server. Mesmo assim, a abordagem de performance que uso é transferível e é a que aplicaria no Postgres:

1) entender o sintoma (tempo, volume, concorrência);
2) analisar o plano com EXPLAIN (ANALYZE, BUFFERS);
3) revisar joins, filtros sargable, estatísticas e índices;
4) extrair lógica pesada para funções/rotinas quando fizer sentido (em Postgres, PL/pgSQL);
5) validar impacto com medição antes/depois e garantir que a solução escale com o crescimento dos dados.

O que levo para a Digisystem é domínio sólido de SQL, ETL, qualidade de dados e tuning — e disposição clara de aprofundar PostgreSQL/PL/pgSQL no dia a dia da vaga, com a mesma rigorosidade que já apliquei em SQL Server.
```

---

## 2. ETL / movimentação de dados

**Pergunta**

> Descreva um projeto de ETL relevante em que você atuou. Qual foi o maior desafio técnico na integração e transformação de dados e como você o superou, considerando os trade-offs envolvidos?

**Resposta enviada**

```text
Um projeto relevante foi na 838, onde montei e mantive pipelines ETL/SSIS para consolidar dados de múltiplas fontes (arquivos, APIs e documentos JSON/NoSQL em MongoDB) em bases SQL Server usadas por processos operacionais e análises.

O maior desafio técnico foi garantir consistência e rastreabilidade com fontes heterogêneas e volumes/atualizações diferentes: risco de duplicidade, atraso parcial de uma origem e divergência origem × destino.

Como superei:
1) priorizei carga incremental com chaves/regras de negócio claras;
2) incluí validações de qualidade (nulos críticos, duplicidade, reconciliação de totais);
3) separei falhas por etapa (extração vs transformação vs carga) com logs/notificação para não “quebrar tudo” por um arquivo ruim;
4) documentei regras para homologação com negócio/dev.

Trade-offs: carga full é mais simples, mas cara e lenta — optei por incremental + checagens, ganhando performance e disponibilidade da informação, com um pouco mais de complexidade de regras e monitoramento. Em troca, o processo ficou mais confiável para decisão e operação.
```

---

## 3. Relatório gerencial / consulta analítica

**Pergunta**

> Compartilhe um projeto onde você precisou criar um relatório gerencial ou consulta analítica crucial para a tomada de decisão. Quais foram as fontes de dados, como você validou a integridade e qual foi o impacto direto para a empresa?

**Resposta enviada**

```text
Na Keyrus, no cliente Telefônica (Vivo), atuei no MIS de contact center criando consultas T-SQL, bases/data marts e dashboards Power BI para indicadores de atendimento e campanhas — volume e rastreio de ligações, retenção com/sem atendimento humano, faturamento e premiação de parceiros, por site e produto (pré/pós/controle, URA).

Fontes: bases SQL Server operacionais + dados consolidados via ETL/SSIS a partir de múltiplas origens do atendimento.

Validação de integridade: reconciliação origem × destino (totais e chaves), checagem de duplicidade/nulos críticos, revisão de regras de negócio com stakeholders e homologação iterativa antes de publicar o indicador.

Impacto: a área passou a ter visão confiável e atualizada para decidir operação e campanhas (alocação, retenção e acompanhamento de parceiros), reduzindo discussão por número divergente e apoiando decisão com evidência — não só “opinião do relatório”.
```

---

## 4. Modelagem de dados

**Pergunta**

> Como você aborda a modelagem de dados para um novo projeto analítico, especialmente em ambiente relacional? Compartilhe um exemplo onde sua decisão de modelagem impactou significativamente a performance ou a flexibilidade na elaboração de consultas, e o que você faria diferente hoje, se algo.

**Resposta enviada**

```text
Para um novo projeto analítico em ambiente relacional, começo pelo negócio: quais perguntas e indicadores precisam ser respondidos, com quais grãos e dimensões. Depois mapeio fontes, chaves e qualidade; só então defino o modelo — em geral dimensional (fatos + dimensões) ou views/procedures analíticas sobre o relacional, priorizando clareza do grão e reuso.

Exemplo: na construção de data marts/consultas para MIS (Vivo/Keyrus) e bases analíticas na 838, a decisão de separar fatos (atendimentos, volumes, valores) de dimensões (site, produto, período, parceiro) e materializar regras em views/procedures melhorou performance (menos joins ad hoc repetidos, filtros por chaves) e flexibilizou novas consultas — o negócio pedia novo corte e eu reaproveitava o modelo em vez de reinventar SQL do zero.

O que eu faria diferente hoje: documentar o grão e as regras de negócio ainda mais cedo, e validar com amostra pequena + EXPLAIN/plano antes de “congelar” a estrutura — evita retrabalho quando surge um indicador com definição ambígua ou um join que explode volume.
```

---

## 5. Problema complexo / causa raiz

**Pergunta**

> Conte sobre uma vez em que você se deparou com um problema complexo e não trivial em um ambiente de dados. Qual foi sua abordagem para identificar a causa raiz, com quais ferramentas você trabalhou e qual foi a solução final, mensurando o impacto?

**Resposta enviada**

```text
O caso mais complexo foi um job/processo crítico em SQL Server que levava cerca de 24 horas e comprometia a disponibilidade da informação para operação e análise.

Abordagem de causa raiz:
1) delimitar o sintoma (duração, horário, volume);
2) isolar a etapa mais lenta (consulta/procedure vs carga);
3) analisar plano de execução, waits, uso de índices/estatísticas e possíveis scans ou joins caros;
4) validar se era dado (pico de volume/qualidade) ou código/modelo.

Ferramentas: SSMS, planos de execução, T-SQL/DMVs para diagnóstico, e ajuste de índices/estatísticas + reescrita da rotina quando necessário.

Solução: otimização da consulta/rotina e estratégia de índices/estatísticas, com medição antes e depois em homologação e depois em produção.

Impacto: o processamento caiu de ~24h para ~1h30 — informação disponível no dia, menos risco operacional e menos retrabalho da equipe esperando o job.
```

---

## 6. Power BI (visualização / performance)

**Pergunta**

> Com relação às ferramentas de BI, você tem boa experiência com Power BI. Houve alguma situação onde você precisou usar o Power BI para resolver um desafio incomum de visualização ou performance que exigiu um conhecimento mais aprofundado da ferramenta? Como você abordou e qual foi o resultado?

**Resposta enviada**

```text
Sim. Em projetos de Power BI (Keyrus/Vivo e bases analíticas na 838), o desafio não era só “montar gráfico”, e sim deixar o painel rápido e confiável com volume alto e regras de negócio complexas.

Situação: dashboards de indicadores (atendimento/campanhas ou operação) ficavam lentos ou inconsistentes quando a medida misturava grãos diferentes ou puxava dados demais direto da fonte.

Abordagem:
1) ajustar o modelo (relacionamentos claros, dimensões/fatos, evitar colunas desnecessárias);
2) preferir agregações e regras validadas no SQL/ETL quando o cálculo era pesado, e no Power BI usar medidas DAX objetivas;
3) cuidar de performance de atualização/visual (filtros, cardinalidade, não explodir visuals);
4) validar número do painel contra a consulta SQL / reconciliação origem × destino antes de liberar.

Resultado: painel utilizável no dia a dia da área, com tempo de resposta aceitável e indicadores alinhados à fonte — a liderança confiava no número para decidir, sem divergência entre “SQL” e “Power BI”.
```

---

## Encerramento (Rê)

> Entendido. O seu foco em delegar o processamento pesado para a camada de SQL/ETL enquanto utiliza o DAX de forma otimizada no Power BI é uma prática recomendada que garante a escalabilidade dos dashboards. Fico satisfeito em ver como você prioriza a governança e a consistência dos números, que é o que realmente gera valor para a tomada de decisão.
>
> Agradeço muito o seu tempo e clareza. Todas as respostas foram salvas e estão disponíveis para a equipe de recrutamento. Boa sorte!

**Ação:** Finalizar pré-entrevista.

---

## Notas

- Respostas alinhadas ao currículo (838, Keyrus/Vivo, SQL Server, SSIS, Power BI).  
- Gap declarado com honestidade: PostgreSQL complementar vs produção em SQL Server.  
- Material de estudo relacionado: `checklist-pre-entrevista-digisystem-dados.md`
