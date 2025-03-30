-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS intuitive_db;
USE intuitive_db;

-- Criar a tabela
CREATE TABLE IF NOT EXISTS demonstracoes_contabeis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    reg_ans INT NOT NULL,
    cd_conta_contabil VARCHAR(20),
    descricao TEXT,
    vl_saldo_inicial DECIMAL(15,2) DEFAULT 0,
    vl_saldo_final DECIMAL(15,2) DEFAULT 0
);

-- Importar os dados do arquivo CSV 1T2023.csv
LOAD DATA LOCAL INFILE 'dados_repo_publico/1T2023/1T2023.csv'
INTO TABLE demonstracoes_contabeis
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
LOAD DATA LOCAL INFILE 'dados_repo_publico/1T2024/1T2024.csv'
INTO TABLE demonstracoes_contabeis
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
LOAD DATA LOCAL INFILE 'dados_repo_publico/2T2023/2T2023.csv'
INTO TABLE demonstracoes_contabeis
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
LOAD DATA LOCAL INFILE 'dados_repo_publico/2T2024/2T2024.csv'
INTO TABLE demonstracoes_contabeis
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
LOAD DATA LOCAL INFILE 'dados_repo_publico/3T2023/3T2023.csv'
INTO TABLE demonstracoes_contabeis
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
LOAD DATA LOCAL INFILE 'dados_repo_publico/3T2024/3T2024.csv'
INTO TABLE demonstracoes_contabeis
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
LOAD DATA LOCAL INFILE 'dados_repo_publico/4T2023/4T2023.csv'
INTO TABLE demonstracoes_contabeis
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
LOAD DATA LOCAL INFILE 'dados_repo_publico/4T2024/4T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'   
ENCLOSED BY '"'            
LINES TERMINATED BY '\n'
IGNORE 1 ROWS            
(@data, reg_ans, cd_conta_contabil, @descricao, vl_saldo_inicial, vl_saldo_final)
SET 
    data = STR_TO_DATE(@data, '%Y-%m-%d'), 
    descricao = CONVERT(@descricao USING utf8mb4);  
