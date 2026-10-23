# Sprint 8 — Megaline: recomendação de planos com machine learning

Projeto de aprendizado de máquina desenvolvido no programa de Ciência de Dados da TripleTen. A operadora Megaline quer identificar, a partir do comportamento mensal de cada cliente, qual dos planos atuais — **Smart** ou **Ultra** — é mais compatível com seu padrão de uso.

O problema foi tratado como uma classificação binária. A meta do projeto era alcançar acurácia mínima de **0,75** no conjunto de teste, mantendo esse conjunto isolado durante a escolha dos modelos e hiperparâmetros.

> **Escopo:** a variável-alvo registra o plano atual de clientes que já migraram para Smart ou Ultra. O modelo aprende essa associação histórica; ele não mede rentabilidade, satisfação, causalidade ou resposta comercial a uma recomendação.

## Arquivos

- [`Projeto_Megaline.ipynb`](Projeto_Megaline.ipynb) — notebook completo, com inspeção dos dados, divisão estratificada, ajuste de hiperparâmetros, avaliação final e verificação de sanidade.
- [`users_behavior.csv`](data/users_behavior.csv) — conjunto de dados utilizado na análise.
- [`requirements.txt`](requirements.txt) — bibliotecas Python necessárias.

## Dados

O conjunto contém **3.214 observações mensais** e cinco colunas:

| Coluna | Descrição |
|---|---|
| `calls` | Número de chamadas |
| `minutes` | Duração total das chamadas em minutos |
| `messages` | Número de mensagens de texto |
| `mb_used` | Tráfego de internet utilizado em MB |
| `is_ultra` | Plano atual: Ultra = 1; Smart = 0 |

Não foram encontrados valores ausentes nem linhas inteiramente duplicadas. A variável-alvo é desbalanceada: aproximadamente **69,35%** dos registros pertencem ao plano Smart e **30,65%** ao Ultra. Por isso, além da acurácia, o modelo final foi comparado a um classificador que sempre prevê a classe majoritária.

## Estratégia de modelagem

Os dados foram divididos de forma estratificada em:

- **60% para treinamento:** 1.928 registros;
- **20% para validação:** 643 registros;
- **20% para teste:** 643 registros.

Foram comparados três algoritmos:

| Modelo | Melhor configuração | Acurácia de validação |
|---|---|---:|
| Árvore de decisão | `max_depth=8` | 0,8025 |
| Floresta aleatória | `n_estimators=50`, `max_depth=9` | **0,8180** |
| Regressão logística | `C=0.01` | 0,7434 |

A árvore de decisão foi avaliada em profundidades de 1 a 10. Na floresta aleatória, foram testadas **45 combinações** entre quantidade de árvores e profundidade máxima. A regressão logística recebeu padronização ajustada apenas no treinamento e foi avaliada com seis valores de regularização.

## Resultado final

A floresta aleatória apresentou o melhor desempenho de validação. Depois da escolha dos hiperparâmetros, ela foi treinada novamente com os conjuntos de treinamento e validação reunidos, totalizando 80% dos dados.

No conjunto de teste, o modelo final alcançou:

- **Acurácia:** 0,8305, ou **83,05%**;
- **Previsões corretas:** 534 de 643;
- **Baseline da classe majoritária:** 0,6936;
- **Ganho sobre o baseline:** 0,1369, ou **13,69 pontos percentuais**.

O resultado supera o limite mínimo de 0,75 e mostra que as variáveis de comportamento contêm informação útil além da simples frequência dos planos.

## Interpretação e limitações

Os melhores resultados da floresta apresentaram acurácia de treinamento em torno de 0,88–0,89 e aproximadamente 0,82 na validação, indicando sobreajuste moderado. As melhores configurações ficaram muito próximas: em 643 observações, uma previsão correta representa cerca de 0,0016 de acurácia.

Algumas configurações com profundidade 10, limite superior investigado, também ficaram entre as melhores. Um estudo futuro pode explorar um intervalo maior e métricas específicas para cada classe, como precisão, recall e F1. Em uma aplicação real, o modelo também precisaria de validação temporal, monitoramento e critérios comerciais antes de orientar contatos com clientes.

## Métodos e ferramentas

- **Python e pandas:** leitura, inspeção e organização dos dados.
- **scikit-learn:** divisão estratificada, padronização, árvore de decisão, floresta aleatória, regressão logística, acurácia e baseline.
- **Reprodutibilidade:** `random_state=12345` em todas as etapas aleatórias.

## Estrutura do projeto

```text
sprint-08-megaline/
├── README.md
├── Projeto_Megaline.ipynb
├── requirements.txt
├── .gitignore
└── data/
    └── users_behavior.csv
```

## Como executar

1. Crie um ambiente Python e instale as dependências:

   ```bash
   pip install -r requirements.txt
   ```

2. Abra `Projeto_Megaline.ipynb` no Jupyter Notebook ou JupyterLab.
3. Execute as células em ordem.

O notebook procura o CSV primeiro em `data/users_behavior.csv`, depois em `/datasets/users_behavior.csv` e, por último, na pasta atual. Assim, ele funciona tanto nesta estrutura local quanto no ambiente do curso.

## Fonte dos dados

Conjunto disponibilizado pela TripleTen para o projeto do Sprint 8: [`users_behavior.csv`](https://practicum-content.s3.us-west-1.amazonaws.com/datasets/users_behavior.csv).
