-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS intuitive_db_teste;
USE intuitive_db_teste;

-- Criar a tabela operadora_ans
CREATE TABLE IF NOT EXISTS operadora_ans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reg_ans INT NOT NULL UNIQUE,
    cnpj VARCHAR(20) NOT NULL,
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(50),
    logradouro VARCHAR(255),
    numero VARCHAR(20),
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf VARCHAR(2),
    cep VARCHAR(10),
    ddd VARCHAR(3),
    telefone VARCHAR(15),
    fax VARCHAR(15),
    endereco_eletronico VARCHAR(100),
    representante VARCHAR(255),
    cargo_representante VARCHAR(100),
    regiao_comercializacao INT,
    data_registro_ans DATE
);

-- Criar a tabela demonstracao_contabil
CREATE TABLE IF NOT EXISTS demonstracao_contabil (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    reg_ans INT NOT NULL,
    cd_conta_contabil VARCHAR(20),
    descricao TEXT,
    vl_saldo_inicial DECIMAL(15,2) DEFAULT 0,
    vl_saldo_final DECIMAL(15,2) DEFAULT 0,
    FOREIGN KEY (reg_ans) REFERENCES operadora_ans(reg_ans) ON DELETE CASCADE
);

-- Importar os dados de Relatorio_cadop.csv
LOAD DATA LOCAL INFILE 'cadastro_operadora/Relatorio_cadop.csv' 
INTO TABLE intuitive_db_teste.operadora_ans
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'   
ENCLOSED BY '"'            
LINES TERMINATED BY '\n'
IGNORE 1 ROWS 
(@reg_ans, @cnpj, @razao_social, @nome_fantasia, @modalidade, @logradouro, @numero, @complemento, 
@bairro, @cidade, @uf, @cep, @ddd, @telefone, @fax, @endereco_eletronico, 
@representante, @cargo_representante, @regiao_comercializacao, @data_registro_ans)
SET 
    reg_ans = @reg_ans, 
    cnpj = @cnpj, 
    razao_social = @razao_social, 
    nome_fantasia = @nome_fantasia, 
    modalidade = @modalidade, 
    logradouro = @logradouro, 
    numero = @numero, 
    complemento = @complemento, 
    bairro = @bairro, 
    cidade = @cidade, 
    uf = @uf, 
    cep = @cep, 
    ddd = @ddd, 
    telefone = @telefone, 
    fax = @fax, 
    endereco_eletronico = @endereco_eletronico, 
    representante = @representante, 
    cargo_representante = @cargo_representante, 
    regiao_comercializacao = @regiao_comercializacao, 
    data_registro_ans = STR_TO_DATE(@data_registro_ans, '%Y-%m-%d');

-- Importar os dados do arquivo CSV 1T2023.csv
LOAD DATA LOCAL INFILE 'demonstracao_contabil/1T2023.csv' 
INTO TABLE intuitive_db_teste.demonstracao_contabil
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'   
ENCLOSED BY '"'            
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, @descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'), 
    descricao = CONVERT(@descricao USING utf8mb4);

-- Importar os dados do arquivo CSV 2T2023.csv
LOAD DATA LOCAL INFILE 'demonstracao_contabil/2T2023.csv' 
INTO TABLE intuitive_db_teste.demonstracao_contabil
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'   
ENCLOSED BY '"'            
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, @descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'), 
    descricao = CONVERT(@descricao USING utf8mb4);

-- Importar os dados do arquivo CSV 3T2023.csv
LOAD DATA LOCAL INFILE 'demonstracao_contabil/3T2023.csv' 
INTO TABLE intuitive_db_teste.demonstracao_contabil
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'   
ENCLOSED BY '"'            
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, @descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'), 
    descricao = CONVERT(@descricao USING utf8mb4);

-- Importar os dados do arquivo CSV 4T2023.csv
LOAD DATA LOCAL INFILE 'demonstracao_contabil/4T2023.csv' 
INTO TABLE intuitive_db_teste.demonstracao_contabil
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'   
ENCLOSED BY '"'            
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, @descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'), 
    descricao = CONVERT(@descricao USING utf8mb4);

-- Importar os dados do arquivo CSV 1T2024.csv
LOAD DATA LOCAL INFILE 'demonstracao_contabil/1T2024.csv' 
INTO TABLE intuitive_db_teste.demonstracao_contabil
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'   
ENCLOSED BY '"'            
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, @descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'), 
    descricao = CONVERT(@descricao USING utf8mb4);

-- Importar os dados do arquivo CSV 2T2024.csv
LOAD DATA LOCAL INFILE 'demonstracao_contabil/2T2024.csv' 
INTO TABLE intuitive_db_teste.demonstracao_contabil
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'   
ENCLOSED BY '"'            
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, @descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'), 
    descricao = CONVERT(@descricao USING utf8mb4);

-- Importar os dados do arquivo CSV 3T2024.csv
LOAD DATA LOCAL INFILE 'demonstracao_contabil/3T2024.csv' 
INTO TABLE intuitive_db_teste.demonstracao_contabil
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'   
ENCLOSED BY '"'            
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, @descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'), 
    descricao = CONVERT(@descricao USING utf8mb4);

-- Importar os dados do arquivo CSV 4T2024.csv
LOAD DATA LOCAL INFILE 'demonstracao_contabil/4T2024.csv' 
INTO TABLE intuitive_db_teste.demonstracao_contabil
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'   
ENCLOSED BY '"'            
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@data, reg_ans, cd_conta_contabil, @descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'), 
    descricao = CONVERT(@descricao USING utf8mb4);
