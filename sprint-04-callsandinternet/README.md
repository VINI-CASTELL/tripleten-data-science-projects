# Sprint 4 — Análise do comportamento de clientes de telecomunicações (Megaline)

Projeto de análise exploratória de dados e análise estatística desenvolvido durante o programa de Ciência de Dados da TripleTen.

## Contexto do projeto

A Megaline é uma empresa de telecomunicações que oferece aos seus clientes dois planos pré-pagos: o plano **Surf** e o plano **Ultimate**. 

Para ajustar o orçamento comercial e entender qual dos planos gera mais receita, o departamento comercial precisa de uma análise focada no comportamento dos clientes para descobrir qual plano é mais lucrativo.

## Objetivo

O objetivo do projeto é analisar uma amostra de 500 clientes da Megaline para compreender quem são eles, de onde são, qual plano usam e o volume de chamadas, mensagens e dados que consomem.

A análise busca:

- limpar e preparar os dados de chamadas, mensagens, navegação na internet e perfil de usuários;
- calcular a receita mensal gerada por cada cliente com base nas tarifas fixas e excedentes;
- comparar os padrões de consumo dos usuários do plano Surf e do plano Ultimate;
- testar hipóteses estatísticas sobre a receita média entre os planos e entre regiões geográficas.

## Conjuntos de dados

O projeto utiliza quatro tabelas:

- `megaline_calls.csv`: dados sobre as chamadas realizadas (duração e data);
- `megaline_internet.csv`: dados sobre o tráfego de dados utilizado em MB;
- `megaline_messages.csv`: dados sobre as mensagens de texto enviadas;
- `megaline_plans.csv`: regras, franquias e custos dos planos (Surf e Ultimate);
- `megaline_users.csv`: informações cadastrais dos clientes (nome, cidade, plano e data de adesão).

Os arquivos originais permanecem na pasta `data/` local e não são versionados pelo Git.

## Etapas realizadas

### 1. Visão geral e preparação dos dados

- leitura das cinco tabelas e inspeção dos tipos de dados;
- conversão de colunas de datas para o formato adequado (`datetime`);
- arredondamento das durações das chamadas e uso de internet para cima, conforme a política de cobrança da empresa;
- agregação dos dados por usuário e por mês (duração total das chamadas, número de mensagens e volume de dados em GB).

### 2. Cálculo da receita mensal

- cálculo da receita gerada por cada cliente a partir do valor base da mensalidade;
- aplicação das tarifas de excedente para minutos, SMS e pacotes de gigabytes adicionais consumidos por mês.

### 3. Análise exploratória de dados (EDA)

- análise do consumo mensal dos clientes (minutos, mensagens e dados) em cada plano;
- cálculo de métricas descritivas (média, variância e desvio padrão);
- construção de histogramas e boxplots para comparar os comportamentos de consumo entre os planos Surf e Ultimate.

### 4. Teste de hipóteses estatísticas

- **Hipótese 1:** A receita média dos usuários dos planos Surf e Ultimate é diferente.
- **Hipótese 2:** A receita média dos usuários da região de NY-NJ é diferente da receita dos usuários das demais regiões.
- aplicação de testes t de Student para duas amostras independentes com definição do nível de significância ($\alpha = 0.05$).

## Principais resultados

- Os clientes do plano Surf ultrapassam os limites do plano com mais frequência, gerando uma parcela significativa da receita por meio de tarifas de excedente.
- Embora o plano Ultimate tenha uma mensalidade base superior, os pagamentos excedentes do plano Surf tornam a receita de ambos os planos relevante para a empresa.
- O teste estatístico confirmou que a receita média dos usuários do plano Surf difere significativamente da receita média do plano Ultimate.
- Não foram encontradas evidências estatísticas suficientes para afirmar que os clientes da região NY-NJ geram uma receita média diferente do restante do país.

## Estrutura do projeto

```text
sprint-04-callsandinternet/
├── data/
│   └── arquivos locais ignorados pelo Git
├── reports/
│   ├── figures/
│   └── tables/
├── analise_megaline.ipynb
├── requirements.txt
├── .gitignore
├── LICENSE
└── README.md