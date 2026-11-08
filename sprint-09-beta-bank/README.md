# Sprint 9 — Beta Bank: previsão de churn

Projeto de aprendizado de máquina desenvolvido no programa de Ciência de Dados da TripleTen. O objetivo é prever se um cliente deixará o banco e ajudar a priorizar contatos de retenção.

## Objetivo

Construir um classificador com F1 de pelo menos **0,59 no conjunto de teste** e medir também a AUC-ROC.

## Arquivos

- [`Projeto_Churn_Beta_Bank.ipynb`](Projeto_Churn_Beta_Bank.ipynb) — notebook com preparação, análise, comparação de modelos e avaliação final.
- [`data/Churn.csv`](data/Churn.csv) — base usada no projeto.
- [`requirements.txt`](requirements.txt) — dependências.
- [`linkedin_post.md`](linkedin_post.md) — rascunho de divulgação do projeto.

## Dados e preparação

A base tem **10.000 clientes**. Desses, **2.037 (20,37%)** saíram e **7.963 (79,63%)** permaneceram. A coluna `Tenure` tem **909 valores ausentes**; eles foram preenchidos com a mediana do conjunto de treino (**5 anos**).

Removi `RowNumber`, `CustomerId` e `Surname`, que identificam registros ou pessoas. Transformei `Geography` e `Gender` em colunas numéricas. As colunas numéricas foram padronizadas para ajudar a regressão logística.

A divisão estratificada ficou em 60% treino, 20% validação e 20% teste. As decisões de estratégia, parâmetros e limiar foram tomadas usando treino e validação. O teste ficou reservado para a avaliação final.

## Modelo inicial

A floresta aleatória sem correção teve, na validação, acurácia de **0,866**, recall de **0,473**, F1 de **0,589** e AUC-ROC de **0,875**, usando limiar 0,50. Embora a acurácia pareça alta, o recall mostra que o modelo encontrou menos da metade dos clientes que saíram. O F1 ficou logo abaixo do critério de 0,59.

Como referência simples, um modelo que prevê que todos permaneceram alcança acurácia de **0,796**, mas F1 e recall iguais a zero. Isso mostra por que acurácia não é suficiente para avaliar este problema.

## Comparação das estratégias

Para cada estratégia, comparei florestas aleatórias com diferentes profundidades e tamanhos mínimos de folha. O limiar foi escolhido na validação.

| Estratégia | F1 de validação | Precisão | Recall | AUC-ROC | Limiar |
|---|---:|---:|---:|---:|---:|
| Undersampling | **0,656** | 0,576 | **0,762** | 0,867 | 0,55 |
| Sem correção | 0,654 | **0,715** | 0,603 | **0,875** | 0,37 |
| `class_weight='balanced'` | 0,653 | 0,581 | 0,745 | 0,874 | 0,46 |
| Oversampling | 0,651 | 0,614 | 0,691 | 0,869 | 0,51 |

O undersampling teve o maior F1 na validação, mas a diferença para o modelo sem correção foi de apenas **0,002**. O modelo sem correção teve a maior AUC-ROC e maior precisão; o undersampling teve maior recall. Portanto, os resultados não mostram que uma estratégia de balanceamento seja sempre melhor.

A floresta aleatória sem correção teve F1 de **0,589** com limiar 0,50. Mantendo a mesma configuração e ajustando o limiar para 0,37 na validação, o F1 subiu para **0,654**. Neste experimento, o ajuste do limiar contribuiu mais do que a diferença entre as estratégias de balanceamento.

## Resultado final no teste

A configuração selecionada foi floresta aleatória com undersampling, `max_depth=10`, `min_samples_leaf=5` e limiar **0,55**. O mesmo modelo treinado para a validação foi avaliado no teste, sem retreinamento; assim, o limiar foi aplicado ao modelo que o definiu.

| Métrica | Resultado |
|---|---:|
| F1 | **0,600** |
| AUC-ROC | **0,853** |
| Precisão | 0,529 |
| Recall | 0,693 |
| Acurácia | 0,812 |

O F1 supera a meta de 0,59 por **0,010**. A matriz de confusão mostra 282 clientes que saíram identificados, 125 que saíram e não foram identificados, 251 clientes que permaneceram sinalizados como risco e 1.342 clientes que permaneceram corretamente identificados.

A AUC-ROC mede a capacidade de ordenar os clientes por risco em diferentes limiares. Já o F1 resume o equilíbrio entre precisão e recall no limiar escolhido. Uma AUC-ROC alta não garante, sozinha, um F1 alto em um limiar específico.

## Limitações e aplicação

A diferença de F1 entre as melhores estratégias na validação é pequena, e foi usada uma única divisão treino/validação/teste. O desempenho pode variar em outra amostra; por isso, não concluo que undersampling seja sempre superior. A base também não tem datas, então não foi possível fazer validação temporal.

Em uma operação real, o banco precisaria definir quantos clientes consegue contatar e avaliar o custo dos falsos alarmes e das saídas não identificadas. O modelo encontra padrões nos dados históricos, mas não prova que uma ação de retenção fará o cliente permanecer.

## Como executar

1. Instale as bibliotecas:

   ```bash
   pip install -r requirements.txt
   ```

2. Abra `Projeto_Churn_Beta_Bank.ipynb` no Jupyter Notebook ou JupyterLab.
3. Execute as células em ordem.

O notebook procura `data/Churn.csv`, `/datasets/Churn.csv` e `Churn.csv`.

## Tecnologias

Python, pandas, NumPy, scikit-learn, Matplotlib, Seaborn e JupyterLab.

## Fonte dos dados

[Churn.csv — TripleTen](https://practicum-content.s3.us-west-1.amazonaws.com/datasets/Churn.csv).
