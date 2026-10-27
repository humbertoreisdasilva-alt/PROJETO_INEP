# Projeto Impacta — Censo da Educação Superior

Projeto de análise dos microdados do Censo da Educação Superior, com recorte em instituições privadas do estado de São Paulo. Os notebooks organizam o trabalho pela metodologia CRISP-DM e exploram o entendimento do negócio e modelos analíticos ampliados.

## Estrutura

```text
.
├── .venv/
├── .env
├── .gitignore
├── README.md
├── requirements.txt
├── dados/
│   ├── cep.csv
│   ├── raw/
│   │   └── microdados_censo_da_educacao_superior_*/
│   └── processed/
├── artefatos_inep/
│   ├── inep_historico_2015_2024.csv
│   ├── inep_historico_previsoes_bi.csv
│   ├── inep_historico_previsoes_bi.parquet
│   ├── inep_previsoes_avaliacao_e_projecao.csv
│   ├── previsoes_inep_2025.csv
│   ├── previsoes_inep_2025_cenario_referencia.csv
│   └── metadados.json
├── modelos/
├── scripts/
│   ├── INEP_TABELA_UNICA_SNOWFLAKE/
│   ├── publicar_snowflake.py
│   └── requirements_inep_snowflake.txt
├── app/
├── notebooks/
│   ├── crisp_dm.ipynb
│   ├── CRISP_DM_INEP_BI_Streamlit.ipynb
│   └── arquivo/
└── arquivo/
    └── kit_inep_snowflake.zip
```

As pastas `app/`, `modelos/` e `notebooks/arquivo/` estão reservadas para os arquivos correspondentes quando estiverem disponíveis. Os microdados do INEP ficam em `dados/raw/` e não são versionados; juntos, ocupam aproximadamente 2 GB. Baixe-os diretamente na página de [Microdados do Censo da Educação Superior do INEP](https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/censo-da-educacao-superior) se forem necessários para seu uso. Os notebooks também consultam uma visão no Snowflake; para executá-los, sua conta precisa ter acesso a `PROJETO_INEP.ANALYTICS.VW_CURSOS_SP_PRIVADA_2015_2024_ML`.

## Requisitos

- Python 3.10 ou superior
- Acesso ao Snowflake com permissões para a visão usada nos notebooks

## Instalação no Windows (PowerShell)

Na pasta do projeto, crie e ative um ambiente virtual e instale as dependências:

```powershell
py -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

Se ainda não houver um `.env` na raiz, copie `scripts/.env.inep.example` para `.env` e configure suas credenciais. Esse arquivo é ignorado pelo Git; nunca publique senhas, tokens ou outros segredos.

## Executar os notebooks

Com o ambiente virtual ativo, a partir da raiz do projeto:

```powershell
jupyter lab .
```

Abra o notebook desejado no navegador e selecione o kernel Python do ambiente `.venv`.

## Publicar no GitHub

Crie um repositório vazio no GitHub e, nesta pasta, configure o remoto e envie a branch principal:

```powershell
git remote add origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
git add .
git status
git commit -m "Estrutura inicial do projeto"
git push -u origin main
```

Antes do commit, confira `git status` e certifique-se de que `.env`, `.venv/`, os dados locais e os CSVs/Parquet gerados não aparecem entre os arquivos a enviar.

## Fonte dos dados

Os microdados e a documentação do Censo da Educação Superior são disponibilizados pelo [INEP](https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/censo-da-educacao-superior). Consulte os termos de uso e a documentação publicados pelo órgão ao reutilizar esses dados.
