# Checklist — Entrevista Safeweb DBA SR · 14:00 Teams

**Vaga:** Administrador de Banco de Dados SR (SQL Server) · Grupo Safepar (certificação digital)  
**Modalidade:** híbrido POA — presencial **3x/semana** (confirme se topa)  
**Seu ângulo:** DBA Pleno 838 (prod/homolog) · backup/segurança/jobs · tuning **~24h → ~1h30** · apoio a C#/modelagem

---

## Pitch (30s)
> Sou Daniele, DBA SQL Server em produção e homologação: monitorei instâncias, backup/restore, segurança (logins/roles), SQL Agent e tuning. Case: job crítico de ~24h para ~1h30. Quero atuar em ambiente crítico de alta disponibilidade, como o da Safeweb.

---

## Q&A — respostas-modelo (fale em 60–90s)

**1. Conte sobre sua experiência como DBA.**  
DBA Pleno na 838 (mai/22–mar/26): produção + homologação SQL Server — admin, backup/restore, permissões, jobs, troubleshooting e tuning. Antes: Analista de Dados (SQL/SSIS). Formação: ADS + MBA Data Science/BI + MBA Oracle (complementar).

**2. Como você faz backup/restore? RPO/RTO?**  
Política full + diff + log conforme criticidade; teste periódico de restore; validar checksum/VERIFYONLY; documentar RPO (perda aceitável) e RTO (tempo de retorno). Em incidente: avaliar última full/diff/log → restore em ambiente controlado → validar app.

**3. O que é Always On? Você já usou?**  
AG: réplicas sincronizadas/assíncronas, listener, failover automático/manual, backups preferencialmente na secundária. **Honestidade:** não administrei AG em produção; domínio forte em backup/restore, disponibilidade e monitoramento — aprendo rápido AG (setup, quorum, failover drill).

**4. Como você faz tuning de query?**  
Sintoma (duração/CPU/IO/blocking) → plano de execução → waits/estatísticas → índices/rewrite (joins, sargability, evitar scans desnecessários) → medir antes/depois. **Case:** job ~24h → ~1h30 (índices/plano/estatísticas + ajuste da rotina).

**5. Blocking / deadlock — o que faz?**  
Identificar sessão bloqueadora (`sp_who2`/DMVs), duração, recurso; matar só se necessário e com alinhamento; depois: ordem de acesso, índices, transações curtas, isolamento adequado.

**6. Segurança / permissões / criptografia?**  
Menor privilégio: logins → users → roles; separar app vs pessoas; auditoria de acessos privilegiados. Criptografia: TDE / Always Encrypted / SSL conforme política — alinhar com segurança/compliance (Safeweb = certificação digital → segurança é core).

**7. SQL Agent / automação?**  
Jobs de backup, manutenção (index/stats), alertas de falha; scripts T-SQL/PowerShell para rotinas repetíveis; monitoramento de histórico de jobs.

**8. Apoio ao desenvolvimento (modelagem/índices)?**  
Revisar modelo e índices com o time; evitar N+1 e scans em tabelas grandes; sugerir covering indexes; homologar mudanças antes de produção.

**9. Controle de mudança / versionamento de banco?**  
Scripts versionados (Git), review, aplicar em homolog → validar → produção em janela; evitar alteração ad hoc sem registro.

**10. Conte um incidente em produção.**  
(STAR) Situação → impacto → diagnóstico → ação (restore/contorno/tuning) → prevenção (alerta, job, doc). Tenha 1 caso pronto.

**11. Windows Server / Active Directory?**  
Uso no dia a dia: contas de serviço, permissões de pasta/share de backup, firewall/portas SQL. Se AD avançado for gap: diga o que já fez + vontade de aprofundar com o time de infra.

**12. Por que Safeweb? Senior vs Pleno?**  
Ambiente crítico de confiança digital; quero evoluir em HA (Always On), segurança e disponibilidade. Senior = autonomia + ownership de produção + mentoria/documentação — já opereí como dona do banco no dia a dia.

---

## Gaps — como falar (sem se sabotar)
| Tema | Frase |
|------|--------|
| Always On | Conceito ok; sem hands-on prod; curva rápida + lab/drill |
| AD / rede | Operacional básico; aprofundar com infra |
| Nível SR | Experiência pleno forte em SQL Server; pronta para ownership sênior |

---

## Perguntas para eles (escolha 3)
1. Quantas instâncias/versões? Já usam Always On?  
2. Plantão / on-call?  
3. Stack além do SQL (integrações, monitoring)?  
4. Time de DBA hoje — tamanho e desafios dos próximos 6 meses?  
5. Próximos passos do processo?

---

## Antes das 14:00
- [ ] Aceitar convite Teams + testar câmera/áudio/link  
- [ ] Currículo PDF + link do site abertos  
- [ ] Confirmar disponibilidade **híbrido 3x POA**  
- [ ] Revisar case 24h→1h30 e 1 incidente STAR  
- [ ] Água, ambiente silencioso, chegar 5 min antes
