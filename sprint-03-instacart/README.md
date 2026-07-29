# Sprint 3 — Análise dos hábitos de compra da Instacart

Projeto de análise exploratória de dados desenvolvido durante o programa de Ciência de Dados da TripleTen.

## Contexto do projeto

A Instacart é uma plataforma de entrega de supermercado na qual os clientes realizam pedidos pelo aplicativo e recebem suas compras em casa.

O conjunto de dados utilizado neste projeto é baseado em dados públicos disponibilizados pela Instacart em 2017. Para fins educacionais, a TripleTen reduziu o tamanho dos arquivos e adicionou valores ausentes e registros duplicados.

## Objetivo

O objetivo do projeto é limpar, preparar e analisar os dados para identificar padrões relacionados aos hábitos de compra dos clientes.

A análise busca responder perguntas sobre:

- horários com maior volume de pedidos;
- dias da semana com mais compras;
- intervalo entre pedidos;
- frequência de pedidos por cliente;
- produtos mais comprados;
- produtos mais recomprados;
- quantidade de itens por pedido;
- proporção de recompras por produto e cliente;
- produtos adicionados primeiro ao carrinho.

## Conjuntos de dados

O projeto utiliza cinco tabelas:

- `instacart_orders.csv`: informações sobre os pedidos;
- `products.csv`: catálogo de produtos;
- `order_products.csv`: itens incluídos em cada pedido;
- `aisles.csv`: categorias de corredores;
- `departments.csv`: categorias de departamentos.

Os arquivos originais permanecem apenas no ambiente local e não são versionados pelo Git.

## Etapas realizadas

### 1. Visão geral dos dados

- leitura dos arquivos com o separador correto;
- análise das dimensões e tipos de dados;
- identificação inicial de valores ausentes.

### 2. Preparação dos dados

- identificação e remoção de pedidos duplicados;
- investigação de nomes de produtos ausentes;
- tratamento da posição ausente dos itens no carrinho;
- manutenção dos valores ausentes que representam o primeiro pedido;
- verificação dos tipos de dados e identificadores.

### 3. Análise exploratória

#### Parte A

- validação dos valores de hora e dia da semana;
- quantidade de pedidos por hora;
- quantidade de pedidos por dia da semana;
- distribuição do intervalo entre pedidos.

#### Parte B

- comparação entre os horários de pedidos de quarta-feira e sábado;
- distribuição do número de pedidos por cliente;
- identificação dos 20 produtos mais comprados.

#### Parte C

- distribuição da quantidade de itens por pedido;
- identificação dos 20 produtos mais recomprados;
- proporção de recompras por produto;
- proporção de recompras por cliente;
- produtos adicionados primeiro ao carrinho.

## Principais resultados

- O maior volume de pedidos ocorre por volta das 10h.
- Domingo é o dia com mais pedidos.
- A mediana do intervalo entre compras é de 7 dias.
- Um pedido típico contém aproximadamente 8 itens.
- Banana é o produto mais comprado, mais recomprado e mais adicionado primeiro ao carrinho.
- Para o cliente mediano, cerca de metade dos itens comprados corresponde a recompras.

## Estrutura do projeto

```text
sprint-03-instacart/
├── data/
│   └── arquivos locais ignorados pelo Git
├── reports/
│   ├── figures/
│   └── tables/
├── instacart_analysis.ipynb
├── requirements.txt
├── .gitignore
├── LICENSE
└── README.md