# Observações sobre a importação de dados csv

Este repositório contém um script SQL (**importar_dados_csv.sql**) para criar o banco, a tabela com seus referidos campos e então importar os dados dos arquivos csv para o MySQL.

## Download dos Arquivos CSV

Os arquivos CSV **não estão no repositório** devido ao tamanho (cerca de 500MB). Para utilizá-los, baixe-os do seguinte link:

🔗 **[Link para download dos arquivos CSV](https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/)**

Após o download, organize os arquivos no diretório `teste3_banco_de_dados/`, seguindo esta estrutura:

```
teste3_banco_de_dados/
│── dados_repo_publico/
│   ├── 1T2023/
│   │   ├── 1T2023.csv
│   ├── 2T2023/
│   │   ├── 2T2023.csv
│   ├── 1T2024/
│   │   ├── 1T2024.csv
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

Para executar a importação, abra o terminal na pasta do repositório e rode:

```sh
mysql -u root -p --local-infile < importar_dados_csv.sql
```

Isso garantirá que todos os arquivos sejam carregados corretamente no banco de dados.
