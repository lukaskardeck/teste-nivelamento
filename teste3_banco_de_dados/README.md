# Observações sobre a importação de dados csv

Este repositório contém um script SQL (**importar_dados_csv.sql**) para criar o banco, as devidas tabelas estruturadas e então importar os dados dos arquivos csv para o MySQL.

## Download dos Arquivos CSV

Os arquivos CSV **não estão no repositório** devido ao tamanho (mais de 500MB). Para utilizá-los, baixe-os nos seguintes links:

**[Link 1 - repo publico demonstracoes contabeis](https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/)**

**[Link 2 - dados das operadoras ativas](https://dadosabertos.ans.gov.br/FTP/PDA/operadoras_de_plano_de_saude_ativas/)**

Após o download, organize os arquivos no diretório `teste3_banco_de_dados/`, seguindo esta estrutura:

```
teste3_banco_de_dados/
│── cadastro_operadora/
│   ├── Relatorio_cadop.csv
│── demonstracao_contabil/
│   ├── 1T2023.csv
│   ├── 2T2023.csv
│   ├── 3T2023.csv
|   ├── ...
|   ├── 4T2024.csv
```

## Habilitar Importação no MySQL

Antes de importar os dados, é necessário verificar se o **local-infile** está ativado no MySQL.

1. Acesse o MySQL e verifique o status:

```sql
SHOW GLOBAL VARIABLES LIKE 'local_infile';
```

2. Se `Value = OFF`, habilite-o com:

```sql
SET GLOBAL local_infile = TRUE;
```

## Importando os Dados

Para realizar a importação, acesse o diretório `teste3_banco_de_dados/` através do cmd e execute:

```sh
mysql -u [seu-usuario] -p --local-infile < importar_dados_csv.sql
```

Isso garantirá que todos os arquivos sejam carregados corretamente no banco de dados.
