# Sprint 6 — Análise de vendas de jogos | Ice

Eu desenvolvi este projeto integrado do programa de Ciência de Dados da TripleTen para identificar padrões associados às vendas de videogames e orientar campanhas para 2017, usando o cenário de dezembro de 2016.

## Conteúdo

- `analise_vendas_jogos.ipynb`: análise completa, comentários didáticos, gráficos e resultados.
- `requirements.txt`: bibliotecas necessárias.
- `data/README.md`: origem e organização dos dados.

## Dados e preparação

Eu usei o dataset games.csv fornecido pelo curso, com 16.715 registros originais sobre jogos, plataformas, ano de lançamento, gênero, vendas regionais, avaliações e ESRB. Eu padronizei colunas, converti tipos, tratei tbd como ausência, preservei classificações desconhecidas e calculei vendas globais.

## Análises

Eu examinei lançamentos anuais, ciclos observados das plataformas, distribuições de vendas, correlações, títulos compartilhados, gêneros e participações regionais. Depois do histórico, eu selecionei 2013–2016. Eu apliquei testes t de Welch bilaterais com alfa de 5%.

## Principais resultados

Eu identifiquei PS4 e Xbox One como prioridades comerciais; Action como líder total e Shooter como destaque por registro. Eu observei diferenças regionais, com maior presença de 3DS e Role-Playing no Japão. Eu não rejeitei a igualdade de médias entre Xbox One e PC; rejeitei entre Action e Sports, com média maior em Action.

## Como executar no VS Code

1. Abra esta pasta no VS Code.
2. Coloque o CSV em `data/games.csv`.
3. Instale as extensões Python e Jupyter da Microsoft.
4. No terminal desta pasta, execute `py -m venv .venv`.
5. Execute `.\.venv\Scripts\python.exe -m pip install -r requirements.txt`.
6. Abra o notebook e selecione o kernel Python da pasta `.venv`.
7. Execute Run All e salve com Ctrl+S.

## Limitações

Eu considerei que 2016 pode estar incompleto. O ano é de lançamento, e as vendas são acumuladas para os registros, não transações por ano. Eu segui a unidade de milhões de USD do enunciado. Correlação não demonstra causalidade, dados ausentes podem introduzir viés, e títulos repetidos limitam a independência dos testes. Eu não calculei lucro sem custos e margens.

## Tecnologias

Python, pandas, Matplotlib e SciPy.
