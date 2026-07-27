# Prática 1 — SQL rápido (45–60 min)

**Objetivo:** falar SQL avançado com segurança amanhã (CTEs, window functions, joins).  
**Ferramenta:** SSMS + `AdventureWorksLT2025` (ou qualquer base que você tenha).  
**Regra:** rode, leia o resultado, explique em voz alta o que a query faz (30 segundos).

---

## Setup

```sql
USE AdventureWorksLT2025;
GO
```

Se o schema for `SalesLT`, mantenha o prefixo nas queries abaixo.

---

## Exercício 1 — JOIN + agregação (10 min)

**Pergunta de negócio:** receita e quantidade de pedidos por cliente.

```sql
SELECT
    c.CustomerID,
    c.CompanyName,
    COUNT(DISTINCT h.SalesOrderID) AS QtdPedidos,
    SUM(h.TotalDue) AS Receita
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.SalesOrderHeader AS h
    ON c.CustomerID = h.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY Receita DESC;
```

**Fale em voz alta:** “Agrupei pedidos por cliente, somei receita e contei pedidos distintos.”

---

## Exercício 2 — CTE (10 min)

**Pergunta:** top 10 clientes por receita.

```sql
WITH ReceitaCliente AS (
    SELECT
        h.CustomerID,
        SUM(h.TotalDue) AS Receita
    FROM SalesLT.SalesOrderHeader AS h
    GROUP BY h.CustomerID
)
SELECT TOP 10
    c.CustomerID,
    c.CompanyName,
    r.Receita
FROM ReceitaCliente AS r
INNER JOIN SalesLT.Customer AS c
    ON c.CustomerID = r.CustomerID
ORDER BY r.Receita DESC;
```

**Fale:** “Usei CTE para isolar o cálculo e depois juntar com a dimensão de cliente.”

---

## Exercício 3 — Window function (15 min)

**Pergunta:** ranking de clientes por receita e % do total.

```sql
WITH Base AS (
    SELECT
        h.CustomerID,
        SUM(h.TotalDue) AS Receita
    FROM SalesLT.SalesOrderHeader AS h
    GROUP BY h.CustomerID
)
SELECT
    CustomerID,
    Receita,
    RANK() OVER (ORDER BY Receita DESC) AS Ranking,
    Receita * 1.0 / SUM(Receita) OVER () AS PctDoTotal
FROM Base
ORDER BY Ranking;
```

**Fale:** “Window function calcula ranking e participação sem colapsar as linhas como o GROUP BY faria sozinho.”

---

## Exercício 4 — Recorrência / proxy de retenção (15 min)

**Pergunta:** clientes com 2+ pedidos (recorrentes).

```sql
WITH PedidosPorCliente AS (
    SELECT
        CustomerID,
        COUNT(DISTINCT SalesOrderID) AS QtdPedidos
    FROM SalesLT.SalesOrderHeader
    GROUP BY CustomerID
)
SELECT
    COUNT(*) AS ClientesComPedido,
    SUM(CASE WHEN QtdPedidos >= 2 THEN 1 ELSE 0 END) AS ClientesRecorrentes,
    SUM(CASE WHEN QtdPedidos >= 2 THEN 1 ELSE 0 END) * 1.0
        / COUNT(*) AS PctRecorrentes
FROM PedidosPorCliente;
```

**Fale:** “Isso é um proxy de retenção/recorrência — lógica parecida com o que a vaga pede em jornada.”

---

## Exercício 5 — Validação de qualidade (10 min)

**Pergunta:** pedidos sem cliente (quebra de integridade).

```sql
SELECT h.*
FROM SalesLT.SalesOrderHeader AS h
LEFT JOIN SalesLT.Customer AS c
    ON h.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;
```

**Fale:** “Antes do dashboard, eu checo se o relacionamento está íntegro — reconciliação origem/destino.”

---

## Checklist

- [ ] 5 queries rodaram  
- [ ] Expliquei cada uma em voz alta  
- [ ] Sei citar: CTE, window function, join, qualidade  

**Frase para entrevista:**  
> “No dia a dia eu uso CTE para organizar a análise, window functions para ranking e participação, e sempre valido integridade antes de confiar no KPI.”
