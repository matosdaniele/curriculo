# Entrevista — Thera Consulting · Analista de Dados Sênior

**Empresa:** Thera Consulting (consultoria SAP / dados / AMS · Alphaville–SP)  
**Vaga:** Analista de Dados Sênior · PJ · remoto · ~5 meses (prorrogável) · início imediato  
**Link:** https://empregos.recrutei.com.br/vaga/thera-consulting/153595-analista-de-dados  
**Núcleo da JD:** arquitetura por domínio · pipelines · modelagem · governança · qualidade · ativos analíticos  
**Seu ângulo:** analista/DBA pleno com ownership de marts, SSIS e qualidade — não arquiteta enterprise nem Spark

Se for **Rê (Recrutei):** respostas em bloco, 1 exemplo concreto, gaps explícitos. Copiar de `perguntas-respostas.md`.  
Se for **humano:** 60–90s, STAR, não ler texto.

---

## Fit rápido (seja honesta)

| Pedido da vaga | Você |
|----------------|------|
| Pipelines / ETL | Forte (SSIS, multi-fonte, incremental, rastreio) |
| Modelagem | Forte (dimensional, data marts, views/procedures) |
| Qualidade da informação | Forte (reconciliação, homologação, regra documentada) |
| Ativos para negócio e tech | Forte (Power BI + bases/views SQL) |
| Domínios de negócio | Bom (MIS contact center Vivo; benefícios/operação 838) |
| Arquitetura de dados dos domínios | Parcial (camada analítica do domínio, não malha/lake corporativo) |
| Governança | Parcial (qualidade + acesso + documentação; não catálogo/Collibra) |
| Título sênior | Parcial (pleno no CV; autonomia no que era dona) |
| Spark / Airflow / ADF / SAP BW | Não (agregador inflou; SAP não foi dia a dia) |

**Frase-guia:** *“Eu desenho e entrego a camada analítica do domínio: fontes → pipeline com qualidade → modelo → ativo que o negócio e o time técnico consomem. Não vendo governança de catálogo nem Spark como se fosse meu dia a dia.”*

---

## Pitch (30–45s)

> Sou Daniele, profissional de dados com 12 anos em TI. Atuo como Analista de Dados/BI e DBA SQL Server: pipelines ETL/SSIS, modelagem dimensional, qualidade e ativos analíticos — data marts, views/procedures e Power BI. Na Keyrus, no cliente Vivo, estruturei o domínio de contact center (atendimento, retenção, campanhas). Na 838, pipelines multi-fonte e bases analíticas com rastreabilidade; case de tuning de job crítico de ~24h para ~1h30. No currículo o nível é pleno; o que levo é autonomia para implementar arquitetura analítica de domínio, não catálogo corporativo. Estou disponível imediatamente, remoto, e aberta ao PJ de projeto.

---

## Como traduzir a JD (não use jargão vazio)

| Eles dizem | Você conta |
|------------|------------|
| Arquitetura de dados dos **domínios** | Um domínio = um recorte de negócio com grão, chaves e consumidores. Ex.: MIS de contact center. Camadas: origem operacional → staging/ETL → data mart (fatos/dims) → consumo (PBI / SQL). |
| **Pipelines** | SSIS: extração, transformação, carga incremental, validação, log, notificação de falha. Fontes: arquivo, API, JSON/Mongo. |
| **Modelagem** | Começar pela pergunta de negócio e pelo grão. Fatos × dimensões. Materializar regra em view/procedure. |
| **Governança** | Regra única do indicador, documentação, quem acessa (roles), versionamento Git, homologar antes de publicar. *Não* Collibra/steward. |
| **Qualidade** | Reconciliação origem×destino, nulos críticos, duplicidade, não publicar número sem validar. |
| **Ativos analíticos** | Para negócio: dashboard/KPI. Para tech: base, view, procedure, contrato de dados com o C#. |

---

## Q&A — 60–90s (humano) ou bloco escrito (Rê)

**1. Apresente-se / por que esta vaga**  
12 anos em TI; Analista de Dados + DBA Pleno SQL Server. Keyrus/Vivo (MIS) + 838 (ETL, bases analíticas, produção). Quero o ciclo completo da JD: domínio → pipeline → modelo → qualidade → ativo. Consultoria já conheço (Keyrus). PJ remoto e início imediato ok. Título no CV é pleno — autonomia no recorte que era meu.

**2. O que é “arquitetura de dados de um domínio” na sua prática?**  
Não é data mesh no papel. É: (1) delimitar o domínio e as perguntas; (2) mapear fontes, chaves, qualidade; (3) definir camadas e grão; (4) pipeline com reconciliação; (5) modelo reutilizável; (6) contrato de consumo (PBI e SQL). Exemplo: domínio atendimento/campanhas na Vivo.

**3. Conte um domínio que você estruturou**  
STAR Keyrus/Vivo: MIS de contact center. Fontes operacionais + SSIS → data marts (atendimento, retenção, faturamento, premiação) por site/produto. Stakeholders validavam a regra. Impacto: número único para operação e campanha, menos briga de relatório.

**4. Pipeline — desafio e trade-off**  
838: SSIS multi-fonte (arquivo, API, Mongo/JSON) → SQL Server. Desafio: consistência com ritmos diferentes. Incremental + checagens por etapa + log. Trade-off: full é simples e caro; incremental + qualidade é mais complexo e entrega no prazo.

**5. Modelagem — decisão que mudou consulta/performance**  
Separar fato (evento/volume/valor) de dimensão (site, produto, período, parceiro) e materializar regra em view/procedure. Novos cortes reaproveitam o modelo. Hoje eu documentaria o grão ainda mais cedo e validaria plano/EXPLAIN numa amostra antes de congelar.

**6. Governança — o que você de fato fez**  
Honesta: não implantei programa de DG (catálogo, conselho, steward). Fiz governança do ativo: regra documentada, um número oficial, permissão por role, Git, homologação, não publicar sem reconciliação. Isso evita “cada área com uma planilha”.

**7. Qualidade da informação**  
Regras de negócio → checagem de nulo/duplicidade/integridade → totais origem×destino → amostra com a área → só então o dashboard. Case de tuning: qualidade também é pontualidade (~24h → ~1h30).

**8. Como você disponibiliza o ativo para negócio e para tech?**  
Negócio: Power BI com medida alinhada ao SQL. Tech: view/procedure/base com contrato (grão, chave, atualização). Parceria com C# na 838. Divergência PBI vs SQL = bloqueio de publicação.

**9. Problema complexo / causa raiz**  
Job ~24h. Sintoma → isolar etapa → plano/índice/estatística/rewrite → medir homolog → produção. Resultado ~1h30. Ferramentas: SSMS, planos, T-SQL/DMVs.

**10. Sênior vs pleno**  
Título formal pleno. Senioridade que ofereço: fechar o ciclo sozinha (requisito → modelo → pipeline → qualidade → ativo), documentar e alinhar risco/prazo. O que não fui: liderança de time, budget, arquitetura corporativa de dados.

**11. Spark, Airflow, Data Factory, lakehouse?**  
Não foram produção. Produção: SQL Server + SSIS + Power BI. Conceitos de orquestração, incremental e qualidade transferem. Se o cliente usa isso, curva no projeto — sem inflar.

**12. SAP?**  
Thera é forte em SAP. Não trabalhei SAP BW/HANA. Já integrei fontes heterogêneas via SSIS; se o SAP for origem (tabela, extractor, arquivo), aplico o mesmo rito de qualidade.

**13. PJ, 5 meses, início imediato**  
Início imediato sim (disponível desde mar/2026). Remoto sim. Projeto de 5 meses com prorrogação possível: ok se o escopo for claro. PJ: confirmar CNPJ e perguntar a faixa **deles** antes de cravar número.

**14. Por que Thera / projeto curto?**  
Consultoria + cliente: já fiz isso na Keyrus. Projeto curto pede entrega cedo: eu começo pelo domínio de maior valor, um pipeline confiável e um ativo homologado — não por um “framework” de 6 meses.

---

## Gaps — frase pronta (não se sabotar)

| Tema | Fale assim |
|------|------------|
| Sênior | “No CV sou plena; no recorte de domínio analítico já fechei o ciclo com autonomia.” |
| Arquitetura | “Arquitetura analítica do domínio (camadas, grão, contrato). Não malha corporativa.” |
| Governança | “Governança do indicador e da carga, não escritório de DG.” |
| Spark/Airflow | “Não foi produção. Posso aprender no stack do cliente; minha base é SQL/SSIS/qualidade.” |
| SAP | “Não foi meu SGBD. Integração e qualidade de fonte, sim.” |

---

## Perguntas suas (escolha 3–4)

1. Qual é o **cliente/domínio** deste projeto (finanças, supply, comercial, SAP…)?  
2. Stack **real**: SQL Server/SSIS, ou já é lake/Spark/ADF?  
3. Já existe modelo/catálogo, ou vamos **definir do zero** em 5 meses?  
4. Consumidores: só Power BI, ou também API/self-service para tech?  
5. Time: você entra só, ou tem engenheiro de dados / DBA no cliente?  
6. Confirmar: esta vaga é a **analista 100% remota**, não a de engenheiro híbrido em SP?  
7. Próxima etapa e critério de sucesso nos primeiros 30 dias?  
8. Faixa PJ e expectativa de extensão além dos 5 meses?

---

## Antes de entrar

- [ ] Confirmar formato (Rê / Meet / Teams) e código, se houver  
- [ ] Ambiente quieto, fone, água  
- [ ] Pitch + case 24h→1h30 + domínio Vivo ensaiados em voz alta  
- [ ] Frases de gap: sênior, governança, Spark, SAP  
- [ ] CNPJ / disponibilidade PJ (não inventar pretensão; pergunte a faixa deles)  
- [ ] Currículo: https://matosdaniele.github.io/curriculo/  
- [ ] Não ler bloco longo na tela
