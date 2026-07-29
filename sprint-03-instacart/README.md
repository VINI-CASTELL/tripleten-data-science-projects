# Instacart Customer Behavior Analysis

Análise exploratória dos hábitos de compra de clientes da Instacart, desenvolvida em Python com `pandas`, `NumPy` e `Matplotlib`.

## Objetivo

O projeto investiga:

- horários e dias com maior volume de pedidos;
- intervalo entre compras;
- frequência de pedidos por cliente;
- produtos mais comprados e recomprados;
- quantidade de itens por pedido;
- comportamento de recompra por produto e cliente;
- produtos adicionados primeiro ao carrinho.

## Principais resultados

- O pico de pedidos ocorre por volta das 10h.
- Domingo é o dia com maior volume de compras.
- A mediana do intervalo entre pedidos é de 7 dias.
- Um pedido típico possui 8 itens.
- Banana é o produto mais comprado, mais recomprado e mais adicionado primeiro ao carrinho.
- Para o cliente mediano, cerca de metade dos itens corresponde a recompras.

## Estrutura do projeto

```text
instacart-customer-behavior-analysis/
├── data/
│   └── arquivos CSV locais
├── reports/
│   ├── figures/
│   └── tables/
├── instacart_analysis.ipynb
├── requirements.txt
├── .gitignore
└── README.md
```

## Dados

Os arquivos utilizados são:

- `instacart_orders.csv`
- `products.csv`
- `order_products.csv`
- `aisles.csv`
- `departments.csv`

Os dados não são versionados pelo Git por padrão. Eles devem permanecer localmente dentro da pasta `data/`.

O conjunto original da Instacart foi disponibilizado publicamente em 2017. A versão utilizada neste projeto foi reduzida e modificada para fins educacionais.

## Como executar no VS Code

1. Instale Python 3 e o VS Code.
2. Instale as extensões **Python** e **Jupyter** no VS Code.
3. Abra esta pasta no VS Code.
4. Crie um ambiente virtual:

```bash
python -m venv .venv
```

5. Ative o ambiente.

No Windows PowerShell:

```powershell
.\.venv\Scripts\Activate.ps1
```

No Linux ou macOS:

```bash
source .venv/bin/activate
```

6. Instale as dependências:

```bash
pip install -r requirements.txt
```

7. Abra `instacart_analysis.ipynb`.
8. Selecione o interpretador Python da pasta `.venv`.
9. Execute as células em ordem ou use **Run All**.

## Como publicar no GitHub

Crie um repositório vazio no GitHub e execute no terminal integrado do VS Code:

```bash
git init
git add .
git commit -m "Add Instacart exploratory data analysis"
git branch -M main
git remote add origin ENDERECO_DO_SEU_REPOSITORIO
git push -u origin main
```

Substitua `ENDERECO_DO_SEU_REPOSITORIO` pelo endereço informado pelo GitHub.

## Tecnologias

- Python
- pandas
- NumPy
- Matplotlib
- Jupyter Notebook
- Git e GitHub
