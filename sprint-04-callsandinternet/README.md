# Sprint 4 — Receita dos planos da Megaline

Eu desenvolvi uma análise exploratória e estatística dos planos Surf e Ultimate no programa de Ciência de Dados da TripleTen. Meu objetivo foi comparar consumo e receita para orientar decisões comerciais.

## Resultados

| Indicador | Surf | Ultimate |
|---|---:|---:|
| Registros cliente-mês | 1.573 | 720 |
| Receita mensal média estimada (arredondada) | US$ 60,71 | US$ 72,31 |
| Receita total dos meses observados | US$ 95.491,18 | US$ 52.066,00 |
| Meses acima da franquia de internet (arredondado) | 57,91% | 5,69% |

Eu encontrei diferença entre planos no teste t de Welch mensal e na verificação com uma média por cliente. Para NY-NJ versus outras regiões, o teste mensal apresentou p = 0,03353, enquanto a verificação por cliente apresentou p = 0,44105 (valores arredondados). Eu considerei a evidência regional sensível à unidade de análise.

## Metodologia

Eu examinei cinco tabelas de 2018, converti datas, arredondei cada chamada e arredondei internet apenas após somar os MB mensais e converter para GB. Eu consolidei serviços com junções externas, apliquei tarifas de excedente, comparei distribuições e usei alfa de 5% nos testes bilaterais.

## Arquivos

- `analise_megaline.ipynb`: notebook com código comentado, textos, tabelas, gráficos e resultados.
- `analise_megaline.py`: o mesmo conteúdo em células Python para o VS Code; o notebook é a versão principal.
- `requirements.txt`: dependências.
- `data/README.md`: dados necessários.

## Execução no Windows / VS Code

1. Abra esta pasta no VS Code e coloque os cinco CSVs em `data/`.
2. Instale as extensões Python e Jupyter da Microsoft, se necessário.
3. No terminal da pasta, execute `python -m venv .venv`.
4. Execute `.\.venv\Scripts\python.exe -m pip install -r requirements.txt`.
5. Abra o notebook e selecione o kernel `.venv` desta Sprint 4.
6. Execute Run All e salve com Ctrl+S.

## Limitações

Eu analisei 2.293 meses com atividade de 490 clientes; dez clientes sem atividade ficam fora. Os totais não representam toda a receita contratual dos 500 clientes. Eu preservei registros de uso posteriores ao cancelamento informado e documentei essa inconsistência. Eu considerei mensalidade integral por mês observado.

A repetição de clientes limita os testes mensais. A verificação por cliente muda a ponderação e não elimina todos os vieses. Receita não equivale a lucro; eu não tenho custos nem evidência causal sobre o efeito do plano.

## Tecnologias

Python · pandas · NumPy · Matplotlib · SciPy
