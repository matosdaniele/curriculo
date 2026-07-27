# Prática Power BI — 3 horas (AdventureWorksLT2025)

**Objetivo:** retomar Power BI com um dashboard simples e ter uma história concreta para a entrevista Sicredi.  
**Pré-requisito:** Power BI Desktop + SQL Server com `AdventureWorksLT2025` (conexão ok no SSMS).  
**Não precisa ficar perfeito** — precisa **funcionar** e você **saber explicar**.

---

## Antes de começar (10 min)

1. Abra o **Power BI Desktop**.
2. **Obter dados → SQL Server**
   - **Servidor:** o mesmo do SSMS (ex.: `.` ou `localhost` ou `SEU-PC\INSTANCIA`)
   - **Banco:** `AdventureWorksLT2025` (campo separado — não junte com `;`)
   - **Autenticação:** a **mesma** do SSMS (Windows ou SQL)
3. No Navegador, marque só as tabelas abaixo (schema `SalesLT`).

### Tabelas que você vai usar

| Tabela | Para quê |
|--------|----------|
| `SalesLT.Customer` | Cliente / “associado” |
| `SalesLT.SalesOrderHeader` | Pedido (data, valor, cliente) |
| `SalesLT.SalesOrderDetail` | Itens do pedido |
| `SalesLT.Product` | Produto |
| `SalesLT.ProductCategory` | Categoria (opcional, se aparecer no Navegador) |

Se `ProductCategory` não listar fácil, ignore — dá para fechar o dashboard sem ela.

**Dica Sicredi:** trate Cliente = associado, Pedido = conversão/compra, Pedidos repetidos = retenção/recorrência. Não diga que é CRM real; diga que é **proxy de jornada comercial** para treino.

---

## Bloco 1 — Conectar e limpar (45 min)

### 1.1 Importar
- Importe as tabelas.
- Em **Transformar dados** (Power Query), para cada tabela:
  - Confira tipos (datas = Data, valores = Decimal/Moeda, IDs = número inteiro).
  - Remova colunas claramente inúteis só se atrapalharem (não precisa limpar tudo).

### 1.2 Colunas úteis (foque nisto)

**Customer**
- `CustomerID`
- `FirstName`, `LastName` (ou `CompanyName` se pessoa jurídica)
- `EmailAddress` (se existir)

**SalesOrderHeader**
- `SalesOrderID`
- `OrderDate`
- `CustomerID`
- `TotalDue` (ou `SubTotal`)
- `Status` (se existir)

**SalesOrderDetail**
- `SalesOrderID`
- `ProductID`
- `OrderQty`
- `UnitPrice`
- `LineTotal` (se não existir: criar depois no DAX ou no Power Query = `OrderQty * UnitPrice`)

**Product**
- `ProductID`
- `Name`
- `ProductCategoryID` (se houver)
- `ListPrice` / `StandardCost` (opcional)

### 1.3 Coluna auxiliar de cliente (Power Query ou DAX depois)
No Power Query em `Customer`, adicione coluna personalizada:

```powerquery
[FirstName] & " " & [LastName]
```

Nome: `CustomerName`.  
(Se preferir, faça no DAX depois — tanto faz.)

**Aplicar e fechar.**

---

## Bloco 2 — Modelo e medidas (50 min)

### 2.1 Relacionamentos (visão Modelo)
Confirme / arraste:

```
Customer[CustomerID] 1 ── * SalesOrderHeader[CustomerID]
SalesOrderHeader[SalesOrderID] 1 ── * SalesOrderDetail[SalesOrderID]
Product[ProductID] 1 ── * SalesOrderDetail[ProductID]
```

- Cardinalidade: um-para-muitos  
- Direção do filtro: única (do 1 para o *)  
- Evite relacionamentos bidirecionais por enquanto

### 2.2 Tabela de medidas
1. **Modelagem → Nova tabela**  
2. Nome: `Medidas`  
3. Fórmula: `Medidas = {BLANK()}` (ou só criar medida em qualquer tabela e mover depois)

### 2.3 Medidas DAX (copie e adapte nomes de coluna se diferirem)

```dax
Qtd Pedidos = DISTINCTCOUNT( SalesOrderHeader[SalesOrderID] )
```

```dax
Qtd Clientes = DISTINCTCOUNT( SalesOrderHeader[CustomerID] )
```

```dax
Receita = SUM( SalesOrderHeader[TotalDue] )
```

```dax
Ticket Medio =
DIVIDE( [Receita], [Qtd Pedidos] )
```

```dax
Qtd Itens = SUM( SalesOrderDetail[OrderQty] )
```

**Retenção / recorrência (proxy de CRM — ótimo para falar na entrevista):**

```dax
Pedidos por Cliente =
DIVIDE( [Qtd Pedidos], [Qtd Clientes] )
```

```dax
Clientes Recorrentes =
CALCULATE(
    DISTINCTCOUNT( SalesOrderHeader[CustomerID] ),
    FILTER(
        VALUES( SalesOrderHeader[CustomerID] ),
        CALCULATE( DISTINCTCOUNT( SalesOrderHeader[SalesOrderID] ) ) >= 2
    )
)
```

```dax
% Clientes Recorrentes =
DIVIDE( [Clientes Recorrentes], [Qtd Clientes] )
```

Se `Clientes Recorrentes` der erro ou ficar lento, use só `Pedidos por Cliente` — já basta para a narrativa.

### 2.4 Coluna de período (opcional, 5 min)
Em `SalesOrderHeader`, nova coluna:

```dax
AnoMes = FORMAT( SalesOrderHeader[OrderDate], "YYYY-MM" )
```

Ou use hierarquia de data automática do Power BI em `OrderDate`.

---

## Bloco 3 — Dashboard de 1 página (55 min) — passo a passo

Use os nomes **exatos** do seu painel Dados. Se a tabela do pedido se chama `SalesLT SalesOrderHeader`, use esse nome. Medidas ficam com o nome que você criou (`Receita`, `Qtd Pedidos`, etc.).

### 3.0 Preparar a página (2 min)

1. Clique no ícone **Relatório** (barra esquerda — gráfico de barras).
2. Embaixo, clique com o botão direito na aba **Página 1** → **Renomear** → `Performance Comercial`.
3. No menu **Exibição**, deixe **Grade** ligada (ajuda a alinhar).

### 3.1 Medida extra para produtos (3 min) — se ainda não tiver

1. Clique na tabela de detalhe do pedido (ex.: `SalesLT SalesOrderDetail`).
2. **Modelagem → Nova medida**:

```dax
Receita Itens = SUMX( 'SalesLT SalesOrderDetail', 'SalesLT SalesOrderDetail'[OrderQty] * 'SalesLT SalesOrderDetail'[UnitPrice] )
```

(Se sua tabela se chama só `SalesOrderDetail`, troque o nome. Se existir coluna `LineTotal`, use: `Receita Itens = SUM( 'SalesLT SalesOrderDetail'[LineTotal] )`.)

### 3.2 Quatro cartões no topo (10 min)

Repita 4 vezes:

1. Clique numa área vazia da página (para não editar outro visual).
2. No painel **Visualizações**, clique no ícone **Cartão** (número grande).
3. Arraste o cartão para o **topo** e deixe estreito (¼ da largura).
4. Com o cartão selecionado, no painel **Dados** marque **só uma** medida:
   - Cartão 1 → `Receita`
   - Cartão 2 → `Qtd Pedidos`
   - Cartão 3 → `Ticket Medio` (ou `Ticket Médio`)
   - Cartão 4 → `% Clientes Recorrentes` **ou** `Pedidos por Cliente`
5. Formatar % (só no cartão de %): visual selecionado → **Formato** (pinceleiro) → **Rótulo** / **Valor** → Formato de porcentagem, 1 casa decimal.
6. Título do cartão: **Formato → Geral → Título** → ligue e escreva o nome da métrica.

Alinhe os 4 cartões na mesma linha, lado a lado.

### 3.3 Gráfico de linha — evolução no tempo (10 min)

1. Clique numa área vazia.
2. Em **Visualizações**, escolha **Gráfico de linhas**.
3. Posicione no **meio-esquerda** (metade da largura).
4. Campos:
   - **Eixo X:** `OrderDate` da tabela de pedido  
     - Se aparecer hierarquia, use **Mês** ou **Ano/mês**.  
     - Se tiver coluna `AnoMes`, use `AnoMes` no eixo X.
   - **Eixo Y:** medida `Receita` (pode adicionar também `Qtd Pedidos` como segunda linha).
5. **Formato → Geral → Título** → `Receita ao longo do tempo`.

### 3.4 Gráfico de barras — Top 10 produtos (12 min)

1. Área vazia → **Gráfico de barras agrupadas** (ou colunas).
2. Posicione no **meio-direita**.
3. Campos:
   - **Eixo Y** (categorias): `Name` da tabela de produto  
     (ex.: `SalesLT Product` → `Name`)
   - **Eixo X** (valores): medida `Receita Itens`
4. Filtrar Top 10:
   - Com o gráfico selecionado, abra o painel **Filtros**.
   - Em **Filtros neste visual**, ache `Name` (produto).
   - Tipo de filtro → **Principais N** (Top N).
   - Mostrar itens: **Principais** → `10`.
   - Por valor: arraste `Receita Itens` para o campo “Por valor”.
   - **Aplicar filtro**.
5. Título: `Top 10 produtos por receita`.

### 3.5 Tabela de clientes (10 min)

1. Área vazia → visual **Tabela**.
2. Posicione na **parte de baixo** (largura maior).
3. Marque nesta ordem (no painel Dados):
   - Nome do cliente (`CustomerName`, ou `FirstName`/`LastName`/`CompanyName`)
   - medida `Qtd Pedidos`
   - medida `Receita`
4. Clique no cabeçalho **Receita** na tabela para ordenar do maior para o menor.
5. Título: `Clientes por receita`.

### 3.6 Slicer (filtro) de período (5 min)

1. Área vazia → visual **Segmentação de dados** (slicer).
2. Coloque no **canto superior direito** ou acima da tabela.
3. Campo: `AnoMes` **ou** `OrderDate` (hierarquia Ano).
4. **Formato → Configurações de segmentação** → estilo **Lista** ou **Lista suspensa** (dropdown economiza espaço).

Teste: clique num ano/mês e veja cartões e gráficos mudarem juntos. Se não mudarem, revise os **relacionamentos** no Bloco 2.

### 3.7 Caixa de insight (3 min)

1. Menu **Inserir → Caixa de texto**.
2. Escreva algo assim (troque X pelo valor do cartão de %):

> Clientes recorrentes: veja o cartão “% Clientes Recorrentes”.  
> Ação sugerida: olhar Top 10 produtos e clientes com mais receita para priorizar relacionamento.

3. Fonte legível, sem enfeite.

### 3.8 Acabamento rápido (5 min)

- **Exibição → Ajustar à página** (ou zoom 100%).
- Evite fundos coloridos demais; um cinza claro ou branco basta.
- Salve: `Ctrl+S` → `AW_Sicredi_Treino.pbix`.

### Checklist do Bloco 3

- [ ] 4 cartões no topo  
- [ ] Linha de receita no tempo  
- [ ] Barras Top 10 produtos  
- [ ] Tabela de clientes  
- [ ] Slicer de período  
- [ ] Texto de insight  
- [ ] Arquivo salvo  

### Se algo não aparecer

| Problema | O que fazer |
|----------|-------------|
| Cartão em branco | Solte a **medida**, não a coluna bruta |
| Produto não filtra | Confira relação Product 1→* SalesOrderDetail |
| Cliente sem nome | Use `CompanyName` ou concatene First+Last |
| Nomes com `SalesLT ...` | No DAX e nos campos, use o nome **completo** que está no painel Dados |

---

## Bloco 4 — Contar na entrevista (20 min)

Ensaie em voz alta:

> Retomei Power BI na prática com AdventureWorks no SQL Server: conectei as tabelas de cliente, pedido, item e produto, modelei relacionamentos, criei medidas de receita, ticket médio e um proxy de recorrência (clientes com 2+ pedidos). Montei um dashboard de uma página focado em decisão — não em enfeite. A lógica é a mesma que uso em análise de campanha/retenção: pergunta de negócio → métrica → visual → recomendação. A ferramenta eu retomo rápido; o raciocínio analítico e o SQL já são meu chão.

### Se perguntarem detalhes técnicos
- **Power Query:** tipos, limpeza leve, coluna de nome  
- **Modelo estrela simples:** Cliente e Produto (dimensões) + Pedido/Item (fatos)  
- **DAX:** `DISTINCTCOUNT`, `DIVIDE`, `CALCULATE`/`FILTER` para recorrentes  
- **Próximo passo:** PL-300 e aplicar o mesmo padrão a funil de CRM (entrega → abertura → clique → conversão)

### O que **não** dizer
- Que AdventureWorks é CRM da Sicredi  
- Que você está “enferrujada”  
- Lista enorme de recursos que não usou  

---

## Cronômetro (resumo)

| Tempo | O quê | Feito? |
|------:|--------|--------|
| 0:00–0:10 | Conectar SQL (servidor e banco separados) | [ ] |
| 0:10–0:55 | Power Query + 4 tabelas | [ ] |
| 0:55–1:45 | Relacionamentos + medidas | [ ] |
| 1:45–2:40 | 1 página de dashboard + insight | [ ] |
| 2:40–3:00 | Ensaio do script da entrevista | [ ] |

**Salvar como:** `AW_Sicredi_Treino.pbix` (no seu PC)

---

## Se a conexão falhar de novo

1. Servidor = só `.` / `localhost` / nome do SSMS — **sem** `;AdventureWorks...`  
2. Autenticação = **idêntica** à do SSMS  
3. Power BI → **Arquivo → Opções → Configurações da fonte de dados** → limpar permissões e tentar de novo  
4. Se SSMS usa Windows, **não** use `sa` no Power BI  

---

## Extra (só se sobrar tempo)

- Segunda página: só “Clientes” (recorrentes vs 1 compra)  
- Medida YoY ou variação mês a mês  
- Publicar no Power BI Service **só se** já tiver conta gratuita Microsoft e tempo — **não é obrigatório** para a entrevista  

Boa prática. Uma página boa vale mais que cinco pela metade.
