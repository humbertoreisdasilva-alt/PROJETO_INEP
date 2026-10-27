# Organização do Projeto Impacta

Proposta para o projeto de análise do Censo da Educação Superior do INEP,
com notebooks organizados por CRISP-DM e publicação de resultados no Snowflake.
A árvore abaixo é a estrutura alvo; algumas pastas ainda não existem.

```text
Projeto Impacta/
├── README.md                   # Objetivo, instalação e execução
├── requirements.txt            # Dependências para executar o projeto
├── .env.example                # Variáveis de configuração, sem credenciais
├── .gitignore
├── docs/                       # Metodologia, dicionário e decisões
├── notebooks/                  # Exploração e etapas do CRISP-DM
│   └── arquivo/                # Versões antigas de notebooks
├── src/
│   └── impacta/                # Código reutilizável extraído dos notebooks
│       ├── dados/              # Leitura, limpeza e transformação
│       ├── modelos/            # Treinamento, avaliação e previsão
│       └── integracoes/        # Conexões e publicação no Snowflake
├── scripts/                    # Comandos de execução e publicação
├── sql/                        # Consultas e definições de views
├── app/                        # Aplicação de apresentação dos resultados
├── dados/
│   ├── raw/                    # Microdados originais, sem alterações
│   └── processed/              # Bases limpas e consolidadas
├── artefatos_inep/              # Exportações, previsões e metadados
├── modelos/                    # Modelos treinados, fora do versionamento
├── tests/                      # Testes de regras de dados e código extraído
└── arquivo/                    # Kits e materiais históricos
```

## Responsabilidades

Os notebooks explicam o raciocínio e apresentam os resultados. Funções usadas
em mais de um notebook devem passar para `src/impacta/` quando forem extraídas.
Os scripts coordenam a execução dessas funções. A pasta `modelos/` na raiz
guarda arquivos de modelos treinados; `src/impacta/modelos/` guarda código.

Execute os comandos a partir da raiz do projeto. Resolva caminhos a partir da
raiz em vez de depender da pasta onde um notebook foi aberto. Preserve os
microdados em `dados/raw/`; grave transformações em `dados/processed/` e
resultados finais em `artefatos_inep/`.

## Sequência de organização

1. Padronizar `Notebooks/` para `notebooks/`, verificando também o nome no índice
   do Git. No Windows, uma mudança apenas de maiúsculas exige atenção: usar um
   nome intermediário evita que a renomeação passe despercebida.
2. Conferir as exclusões e renomeações que já estão pendentes no Git antes de
   consolidar a reorganização.
3. Mover `scripts/CRISP_DM.ipynb` para `notebooks/`, depois de conferir se ele é
   a versão que deve continuar ativa. Atualizar os caminhos e o README.
4. Centralizar consultas em `sql/` e documentação em `docs/`, ajustando qualquer
   referência aos caminhos antigos.
5. Recuperar ou recriar `.env.example` apenas com nomes de variáveis e valores
   fictícios, conforme a configuração efetivamente usada pelo código.
6. Levantar os imports dos notebooks ativos e dos scripts para completar as
   dependências. Consolidar dependências comuns; manter requisitos opcionais
   separados quando houver uma finalidade clara.
7. Extrair código reutilizável aos poucos e testar regras relevantes, como
   chaves de dados, tratamento de valores ausentes e separação temporal entre
   treinamento e avaliação.
8. Implementar a aplicação em `app/` quando o fluxo de dados e os resultados
   estiverem definidos.

## Convenções

- Usar nomes de arquivos em minúsculas com palavras separadas por `_`.
- Numerar notebooks pela ordem do trabalho, por exemplo
  `01_entendimento_negocio.ipynb` e `02_entendimento_dados.ipynb`.
- Manter `.env`, ambientes virtuais, dados locais, logs e modelos treinados
  fora do Git. Versionar exemplos de configuração sem segredos.
- Arquivar versões antigas explicitamente para distinguir o fluxo ativo.

## Situação observada

`app/` e `modelos/` estão reservadas com `.gitkeep`. Há notebooks tanto em
`Notebooks/` quanto em `scripts/`. O README menciona caminhos de notebooks
que diferem dos arquivos atuais. O Git registra mudanças locais e a exclusão
de `.env.example`. Esta proposta não move arquivos nem altera essas mudanças.
