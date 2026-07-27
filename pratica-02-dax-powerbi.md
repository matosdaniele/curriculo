# Prática 2 — DAX no Power BI (40–50 min)

**Objetivo:** criar/medir com segurança e saber explicar na entrevista.  
**Arquivo:** seu `AW_Sicredi_Treino.pbix` (ou novo arquivo com AdventureWorks).  
**Lembrete:** medida = **Nova medida** (não Consulta DAX). Coluna = **Nova coluna**.

Use os nomes reais das suas tabelas (ex.: `'SalesLT SalesOrderHeader'`).

---

## Parte A — Medidas base (15 min)

Crie (ou confira) estas medidas:

```dax
Qtd Pedidos = DISTINCTCOUNT( 'SalesLT SalesOrderHeader'[SalesOrderID] )
```

```dax
Qtd Clientes = DISTINCTCOUNT( 'SalesLT SalesOrderHeader'[CustomerID] )
```

```dax
Receita = SUM( 'SalesLT SalesOrderHeader'[TotalDue] )
```

```dax
Ticket Medio = DIVIDE( [Receita], [Qtd Pedidos], 0 )
```

```dax
Pedidos por Cliente = DIVIDE( [Qtd Pedidos], [Qtd Clientes], 0 )
```

**Teste:** 5 cartões na página. Nenhum em branco.

---

## Parte B — Recorrência (15 min)

```dax
Clientes Recorrentes =
SUMX(
    VALUES( 'SalesLT SalesOrderHeader'[CustomerID] ),
    IF(
        CALCULATE( DISTINCTCOUNT( 'SalesLT SalesOrderHeader'[SalesOrderID] ) ) >= 2,
        1,
        0
    )
)
```

```dax
% Clientes Recorrentes =
DIVIDE( [Clientes Recorrentes], [Qtd Clientes], 0 )
```

Formato da medida `%`: porcentagem, 1 casa decimal (selecione a medida → Ferramentas de medida).

**Se der branco:** use só `Pedidos por Cliente` no 4º cartão e siga.

---

## Parte C — Produto (10 min)

```dax
Receita Itens =
SUMX(
    'SalesLT SalesOrderDetail',
    'SalesLT SalesOrderDetail'[OrderQty] * 'SalesLT SalesOrderDetail'[UnitPrice]
)
```

*(Se existir `LineTotal`: `Receita Itens = SUM( 'SalesLT SalesOrderDetail'[LineTotal] )`.)*

Gráfico de barras: produto `Name` + `Receita Itens` + filtro Top 10.

---

## Parte D — Coluna AnoMes (5 min)

**Nova coluna** (não medida) na tabela de pedido:

```dax
AnoMes = FORMAT( 'SalesLT SalesOrderHeader'[OrderDate], "yyyy-MM" )
```

Slicer com `AnoMes` + cartões devem reagir ao filtro.

---

## Explique em voz alta (1 min)

> Modelei cliente, pedido, item e produto. Criei medidas de receita, ticket e recorrência. Uma página: cartões, evolução no tempo, top produtos e tabela de clientes. Foco em decisão, não em enfeite.

---

## Checklist

- [ ] Medidas base ok  
- [ ] Recorrência ou Pedidos por Cliente ok  
- [ ] Top 10 produtos ok  
- [ ] Slicer filtra a página  
- [ ] Script de 1 min ensaiado  

**Salvar:** `AW_Sicredi_Treino.pbix`
