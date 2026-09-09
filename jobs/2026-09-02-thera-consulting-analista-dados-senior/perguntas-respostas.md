# Respostas prontas — Thera Consulting · Analista de Dados Sênior

**Uso:** colar na Rê (Recrutei) ou falar em versão curta com humano.  
**Regra:** só fatos do currículo-base. Gaps explícitos.

---

## 1. Apresentação / experiência com dados e arquitetura de domínio

```text
Sou Daniele de Lima Matos, profissional de dados com 12 anos em TI, atuando como Analista de Dados/BI e como DBA Pleno em Microsoft SQL Server.

O ciclo que a vaga descreve — domínio, pipeline, modelagem, qualidade e ativo analítico — é o que já faço, com ênfase em consistência do dado antes do dashboard.

Na Keyrus, no cliente Telefônica/Vivo (MIS de contact center), estruturei a camada analítica de um domínio de negócio: atendimento, retenção, campanhas, faturamento e premiação de parceiros. Fontes operacionais entram via ETL/SSIS, viram data marts (fatos e dimensões) e são consumidas em Power BI e consultas SQL, com regra de KPI alinhada com stakeholders.

Na 838 Soluções em Benefícios fechei o outro lado: pipelines SSIS multi-fonte (arquivo, API, JSON/Mongo), views/procedures e bases analíticas em SQL Server, com rastreabilidade e parceria com desenvolvimento (C#) e áreas de negócio. O case de tuning de um job crítico de ~24h para ~1h30 resume o critério que uso: o ativo só é útil se chega no prazo e reconcilia com a origem.

No currículo o nível é pleno. Não implementei malha corporativa nem programa formal de governança (catálogo/steward). O que levo pronto é autonomia para definir e implementar a arquitetura analítica de um domínio, com qualidade e consumo claro para negócio e tecnologia. Estou disponível imediatamente, em modelo remoto, e aberta ao contrato PJ de projeto.
```

---

## 2. Arquitetura de dados dos domínios

```text
Para mim, arquitetura de dados de um domínio não é um desenho genérico de data lake: é delimitar um recorte de negócio (perguntas, grão, chaves, consumidores) e implementar camadas que se sustentam.

Abordagem que uso:
1) entender as decisões que o domínio precisa responder e com quem consome (negócio vs tecnologia);
2) mapear fontes, chaves, qualidade e ritmos de atualização;
3) definir camadas — origem → staging/ETL → modelo analítico (data mart / views) → consumo;
4) documentar grão e regra de negócio antes de “congelar” o modelo;
5) só então pipeline com reconciliação e contrato de dados (quem lê o quê, com que atraso).

Exemplo: no MIS da Vivo (Keyrus) o domínio era contact center. Separei fatos (atendimento, volume, valor) de dimensões (site, produto, período, parceiro) e materializei regras em bases/consultas reutilizáveis. Isso evitou SQL ad hoc a cada pedido novo e deu um número único para operação e campanha.

O que eu não vendo como experiência: data mesh, lakehouse ou arquitetura corporativa de plataforma. Se o projeto da Thera for essa camada analítica de domínio, é exatamente o que já entreguei. Se for plataforma Spark/lake, sou franca: não foi meu dia a dia — minha base transfere (modelo, qualidade, contrato), e a ferramenta do cliente eu aprofundo no projeto.
```

---

## 3. Pipelines (ETL) — desafio e trade-offs

```text
Um projeto relevante foi na 838: pipelines ETL/SSIS consolidando arquivos, APIs e documentos JSON/NoSQL (MongoDB) em bases SQL Server usadas por operação e análise.

O maior desafio foi consistência e rastreabilidade com fontes heterogêneas: ritmos diferentes, risco de duplicidade, atraso parcial de uma origem e divergência origem × destino.

Como tratei:
1) carga incremental com chaves e regras de negócio explícitas;
2) validações de qualidade (nulos críticos, duplicidade, reconciliação de totais);
3) falha isolada por etapa (extração vs transformação vs carga), com log e notificação — um arquivo ruim não derruba o restante;
4) documentação para homologar com negócio e desenvolvimento.

Trade-off: carga full é mais simples, mas cara e lenta. Incremental + checagens aumenta um pouco a complexidade e o monitoramento, e ganha pontualidade e confiança no número. Na Keyrus o mesmo rito alimentou data marts de contact center.

Orquestração no meu dia a dia foi SSIS/SQL Agent, não Airflow/Data Factory. O princípio (dependência, retry, qualidade, SLA da informação) é o mesmo; a ferramenta do cliente eu adapto.
```

---

## 4. Modelagem de dados

```text
Começo pelo negócio: quais perguntas e indicadores, com qual grão e quais dimensões. Depois fontes, chaves e qualidade. Só então o modelo — em geral dimensional (fatos + dimensões) ou views/procedures analíticas sobre o relacional, priorizando clareza do grão e reuso.

Exemplo: nos data marts do MIS (Vivo/Keyrus) e nas bases analíticas da 838, separar fato de dimensão e materializar regras em views/procedures melhorou performance (menos join ad hoc, filtro por chave) e flexibilidade — um novo corte reaproveitava o modelo em vez de SQL do zero.

O que eu faria diferente hoje: documentar grão e regra ainda mais cedo, e validar com amostra pequena + plano de execução antes de congelar a estrutura. Evita retrabalho quando o indicador vem ambíguo ou o join explode volume.
```

---

## 5. Governança

```text
Sou direta: não implantei um programa corporativo de governança de dados (catálogo tipo Collibra, conselho, data steward formal). O que fiz, e o que considero governança do ativo analítico, foi:

1) uma regra de negócio documentada por indicador — evita “cada área com uma planilha”;
2) qualidade na carga (reconciliação, duplicidade, nulos críticos) antes de publicar;
3) rastreabilidade da pipeline (o que rodou, quando, o que falhou);
4) acesso por menor privilégio (logins, users, roles) no SQL Server;
5) versionamento de scripts/pacotes (Git) e homologação com negócio/tech antes de produção.

Isso é o que faz o time de negócio e o de tecnologia consumirem o mesmo número. Se a Thera precisar de política enterprise de DG, eu contribuo com o recorte de domínio e qualidade; não apresento isso como se eu já tivesse puxado o programa inteiro.
```

---

## 6. Qualidade da informação

```text
Qualidade, para mim, é não publicar número que não reconcilia e não chega no horário em que a decisão acontece.

Na prática: regras de negócio escritas; checagem de duplicidade, nulos críticos e integridade referencial; reconciliação de totais e chaves origem × destino; amostra com a área; só então o ativo (mart, view ou Power BI).

Na 838 isso estava no pipeline SSIS. Na Keyrus, na homologação dos KPIs de atendimento e campanha. O case de performance (~24h → ~1h30) também é qualidade: informação atrasada é informação inútil para operação.

Se o número do painel diverge do SQL, eu bloqueio a publicação até fechar a regra — não “ajusto o visual” para parecer certo.
```

---

## 7. Disponibilização de ativos analíticos (negócio e tecnologia)

```text
Trato dois consumidores diferentes, com o mesmo dado.

Para o time de negócio: data marts + dashboards Power BI, com KPI cujo DAX não inventa regra — a regra pesada fica no SQL/ETL, o painel consome medida objetiva. Storytelling: o que mudou na decisão (alocação, retenção, parceiro), não só o gráfico.

Para o time de tecnologia: views, procedures e bases com contrato (grão, chave, janela de atualização). Na 838 isso ia para processos e para o desenvolvimento em C#. Sem contrato, cada sistema lê um recorte diferente e a briga de número volta.

Validação cruzada: totais do painel contra a consulta SQL / origem. Só libero quando bate. Performance: modelo enxuto, agregação na origem quando o cálculo é pesado, evitar visual que explode cardinalidade.
```

---

## 8. Problema complexo / causa raiz

```text
O caso mais complexo foi um job/processo crítico em SQL Server que levava cerca de 24 horas e comprometia a disponibilidade da informação para operação e análise.

Causa raiz:
1) delimitar sintoma (duração, horário, volume);
2) isolar a etapa mais lenta (consulta/procedure vs carga);
3) plano de execução, waits, índices/estatísticas, scans e joins caros;
4) separar problema de dado (pico/qualidade) de problema de código/modelo.

Ferramentas: SSMS, planos de execução, T-SQL/DMVs; ajuste de índice/estatística e reescrita da rotina; medição antes/depois em homologação e depois em produção.

Impacto: ~24h para ~1h30 — informação no dia, menos risco operacional e menos fila da equipe esperando o job. É o tipo de ownership que eu levo para um projeto de 5 meses: o ativo analítico tem que existir no horário do negócio.
```

---

## 9. Senioridade, PJ, 5 meses, stack moderno

```text
No currículo atuo no nível pleno (Analista de Dados Pleno e DBA Pleno). A senioridade que ofereço é fechar o ciclo de um domínio com autonomia: requisito, modelo, pipeline, qualidade e ativo — documentado e alinhado com negócio e tech. Não fui líder de time nem dona de budget, e não vendo isso.

Disponibilidade imediata: sim. Remoto: sim. Projeto PJ de cerca de 5 meses, com chance de prorrogação: faz sentido se o escopo dos primeiros 30 dias estiver claro (qual domínio, qual stack, o que é sucesso).

Sobre ferramentas que aparecem em anúncios agregados (Spark, Airflow, Data Factory, lakehouse): não foram meu ambiente de produção. Produção foi SQL Server, SSIS e Power BI, com Python para automação pontual. Conceitos de pipeline, qualidade e modelo transferem; a ferramenta específica do cliente eu aprofundo no projeto, com a mesma disciplina que usei em tuning e reconciliação.

SAP: a Thera tem prática SAP forte; SAP BW/HANA não foram meu dia a dia. Integração de origem heterogênea e qualidade, sim. Se o SAP for fonte, aplico o rito de domínio e reconciliação que já usei com arquivo, API e SQL.
```

---

## Encerramento (se a Rê ou o recrutador pedir perguntas)

```text
Gostaria de confirmar três pontos para entregar certo nos primeiros 30 dias: (1) qual domínio de negócio deste projeto; (2) qual o stack real do cliente (SQL/SSIS versus lake/Spark); (3) se a vaga é a analista 100% remota, e não a de engenheiro de dados híbrida em São Paulo. Também pergunto o critério de sucesso do contrato de 5 meses e a faixa PJ prevista.
```
