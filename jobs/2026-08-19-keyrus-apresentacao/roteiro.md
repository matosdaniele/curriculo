# Apresentação — retorno à Keyrus

**Uso:** conversa com People / liderança técnica (10–12 min) ou pitch de 45s no início.  
**Slides:** abrir `apresentacao.html` no navegador (setas ← →, Espaço, ou clique).  
**Contato People:** Franscielen Quintao (Talent Acquisition) — vagas DataViz e Data AMS.

**Ângulo:** ex-colaboradora (Vivo/MIS, 2018–2020) que voltou mais completa: BI consultivo **e** SQL Server em produção (DBA Pleno). Na Keyrus o título “DBA” quase não aparece — o equivalente aberto agora é **Support Engineer PL/SR (Data AMS)**.

---

## Pitch de 45 segundos (abrir a conversa)

> Sou a Daniele. Já atuei na Keyrus, de 2018 a 2020, como Analista de BI no cliente Telefônica/Vivo, no MIS de contact center: T-SQL, SSIS, data marts, KPIs e Power BI, com levantamento de requisito e apresentação para o negócio.
>
> Depois fui para a 838 e aprofundei o que deixa o dado confiável: pipelines ETL, qualidade, e DBA Pleno em SQL Server — backup, segurança, jobs e tuning. O case que resume isso é um job crítico que saiu de cerca de 24 horas para cerca de 1h30.
>
> Estou buscando voltar em duas frentes que a casa tem abertas: **Analista de BI (Power BI & Alteryx)** e **Support Engineer PL/SR**, que é o perfil de sustentação SQL/SSIS mais próximo do DBA. Trabalho remoto, em Alvorada/RS.

---

## Roteiro dos slides

### 1. Capa

Só se apresentar. Não ler o slide. Fechar com: *“Trouxe um recorte curto da trajetória e do fit nas vagas abertas.”*

### 2. Por que Keyrus de novo

Falar em 3 frases:

1. Já conheço a entrega consultiva (cliente, prazo, stakeholder).
2. Voltei com visão de **ponta a ponta**: do requisito ao dashboard **e** da causa raiz no banco.
3. Quero contribuir de novo com rigor e pragmatismo — o dado certo, no prazo, para decisão.

Não romantizar “cultura”. Keyrus valoriza **confiabilidade** e **impacto concreto**.

### 3. Trajetória

| Período | Papel | O que levar da fala |
|---------|--------|---------------------|
| 2018–2020 | Keyrus · BI · Vivo/MIS | Consultoria, KPIs, Power BI, SSIS, Alteryx (curso interno + uso) |
| 2020–2022 | 838 · Analista de Dados | SQL, DTS/SSIS, homologação entre sistemas |
| 2022–2026 | 838 · DBA Pleno | Produção/homologação, backup, segurança, tuning |
| 2026 | MBA DS/BI/IA (concluído) | Reforço analítico; disponível para retorno |

Fechar: *“Saí Analista de BI. Volto BI + operação de SQL Server.”*

### 4. Duas trilhas (não é indecisão)

Deixar explícito que **não está pedindo as duas ao mesmo tempo no mesmo projeto** — está aberta ao time que tiver demanda:

- **DataViz / BI:** dashboards, modelagem, KPI, conversa com negócio.
- **Data AMS / SQL:** sustentação, incidente, ETL/SSIS, performance — o que no mercado chamam de DBA pleno.

Frase-chave: *“O mesmo rigor: qualidade do dado antes do visual, causa raiz antes do paliativo.”*

### 5. Trilha BI — o que já entreguei aqui

Vivo/MIS, contact center:

- Análises de atendimento, retenção, faturamento e premiação de parceiros
- Data marts, modelagem dimensional, KPIs
- Power BI ligado a SQL Server
- Requisitos, homologação iterativa, apresentação de resultado

Se perguntarem Alteryx: *“Curso interno na própria Keyrus e uso profissional. O volume maior de pipeline em produção, depois, foi SSIS. Consigo retomar Alteryx Designer com curva curta porque o raciocínio de fluxo, qualidade e automação já é o meu dia a dia.”*

### 6. Trilha SQL / AMS — o DBA que a vaga pede

838, DBA Pleno:

- Instâncias produção e homologação
- Backup/restore, logins/roles, jobs, troubleshooting
- SSIS multi-fonte (arquivo, API, JSON/MongoDB)
- Case **~24h → ~1h30**

SSAS: *“Faz parte do stack Microsoft BI que conheço (curso/ferramenta). Não foi o núcleo diário da operação na 838. Se o cliente tiver cubo/tabular legado, investigo pelo mesmo método: sintoma, código existente, causa raiz.”*

### 7. Dois cases (STAR, 60–90s cada)

**BI — Vivo/MIS**  
Situação: indicadores de contact center para decisão (site, produto, campanha).  
Tarefa: data mart + KPI + Power BI com regra de negócio validada.  
Ação: T-SQL/SSIS, reconciliação origem/destino, homologação com stakeholder.  
Resultado: informação rastreável e apresentação para o negócio — não só gráfico bonito.

**DBA — job crítico**  
Situação: rotina que rodava ~24h e atrasava a informação.  
Tarefa: devolver a carga no prazo, sem “chute”.  
Ação: sintoma (duração/CPU/IO) → plano de execução → índice/estatística/rewrite da rotina.  
Resultado: ~1h30; dado disponível para análise.

### 8. Vagas abertas (ago/2026) — o que dizer ao People

| Vaga | Fit | O que falar |
|------|-----|-------------|
| [Analista de BI \| Power BI & Alteryx](https://jobs.keyrus.com.br/jobs/8170538-analista-de-bi-power-bi-alteryx) · DataViz · remoto | **Aplicar** (score 81) | Melhor match de BI; Alteryx com honestidade (curso Keyrus; SSIS no volume) |
| [Support Engineer PL/SR](https://jobs.keyrus.com.br/jobs/8157666-support-engineer-pl-sr) · Data AMS · remoto | **Aplicar** (score 84) | Melhor match “DBA”: SQL Server + SSIS + incidente + ambiente legado |
| Analista de Dados Sênior · DataViz · remoto | Considerar | Senioridade de título; DAX/storytelling ok, sem inflar “sênior de governança Fabric” |
| Analista de Dados e Automação PL/SR · **híbrido SP** | Não priorizar | Mora em Alvorada/RS; híbrido SP fora do critério |
| Data Engineer AWS / Snowflake / Fabric sênior | Não forçar | Gap real de cloud/engenharia; não inventar |

Pedido ao recrutamento: *“Podem me encaixar na trilha BI ou na trilha AMS, conforme a demanda. As duas fazem sentido com o que já entreguei aqui e com o que evoluí depois.”*

### 9. Gaps — frases prontas (sem se sabotar)

| Tema | Frase |
|------|--------|
| Alteryx Designer | Curso interno Keyrus + uso; pipeline de maior volume = SSIS. Retomo Designer pelo raciocínio de fluxo/qualidade. |
| SSAS | Ferramenta do stack Microsoft BI; não foi o núcleo diário. Método de sustentação é o mesmo. |
| Snowflake / Fabric / Databricks | Sem produção nesse volume. Não invento. Aprendo no padrão da conta. |
| PostgreSQL / Oracle prod | Formação Oracle (MBA); Postgres complementar. Produção forte = SQL Server. |
| Inglês | Leitura técnica. Não fluente para call diária em inglês. |
| Título DBA na Keyrus | O mercado chama DBA; aqui o aberto agora é Support Engineer / AMS. É o trabalho que já faço. |

### 10. Fechamento

> Estou disponível remoto, com currículo em matosdaniele.github.io/curriculo. Quero voltar a entregar no padrão Keyrus — dado confiável, no prazo, para o cliente decidir.

Perguntas para eles (escolha 2–3):

1. A demanda mais urgente agora é DataViz (novo dashboard) ou Data AMS (sustentação SQL/SSIS)?
2. As contas em vista são Microsoft BI clássico (SQL/SSIS/Power BI) ou já Fabric/Snowflake?
3. No AMS, o plantão/on-call faz parte do desenho da vaga?
4. Para quem já foi da casa, o processo é o mesmo ou há via de recontratação?
5. Próximo passo — conversa técnica com quem?

---

## Mensagem para People / LinkedIn (~400 caracteres)

```text
Olá, Franscielen! Sou Daniele, ex-Keyrus (2018–2020, Vivo/MIS: Power BI, T-SQL, SSIS). Depois atuei como DBA Pleno SQL Server (tuning ~24h→~1h30). Quero voltar: BI Pleno (Power BI & Alteryx) e/ou Support Engineer PL/SR (AMS). Posso enviar currículo ou conversar sobre o fit?
https://matosdaniele.github.io/curriculo/
```

## E-mail curto (People)

**Assunto:** Retorno Keyrus — Daniele de Lima Matos (BI + SQL Server/AMS)

```text
Olá, equipe People,

Sou Daniele de Lima Matos, Analista de BI na Keyrus de nov/2018 a mar/2020 (cliente Telefônica/Vivo, MIS). Candidatei-me / gostaria de ser considerada para:

• Analista de BI | Power BI & Alteryx (DataViz, remoto)
• Support Engineer PL/SR (Data AMS, remoto) — perfil mais próximo do DBA SQL Server que exerci na 838

Desde que saí, aprofundei T-SQL, ETL/SSIS, qualidade de dados e administração SQL Server em produção (backup, segurança, jobs, performance; case de job crítico ~24h → ~1h30). MBA em Data Science, BI e IA (UniSenac) concluído. Trabalho remoto a partir de Alvorada/RS.

Alteryx: curso interno na Keyrus e uso profissional; o volume maior de pipeline depois foi SSIS. SSAS faz parte do stack Microsoft BI, sem ser o núcleo diário.

Currículo: https://matosdaniele.github.io/curriculo/
Telefone: (11) 99431-4568

Obrigada,
Daniele
```

---

## Checklist antes da call

- [ ] Abrir `apresentacao.html` e testar tela cheia (F11)
- [ ] Ter o site do currículo e o PDF abertos
- [ ] Ensaio do pitch 45s + case 24h→1h30 + Alteryx honesto
- [ ] Confirmar: remoto, Alvorada/RS, aberta a BI **ou** AMS
- [ ] Não candidatar a híbrido SP nem a Data Engineer AWS/Snowflake sênior
- [ ] Aplicar manualmente nas duas vagas-alvo no [jobs.keyrus.com.br](https://jobs.keyrus.com.br/jobs) e marcar `applications.csv`
