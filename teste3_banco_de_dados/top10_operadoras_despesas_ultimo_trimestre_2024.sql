/*
Quais as 10 operadoras com maiores despesas em "EVENTOS/ SINISTROS CONHECIDOS OU
AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre?
*/

SELECT 
    o.reg_ans AS operadora,
    o.razao_social AS razao_social,
    SUM(d.vl_saldo_inicial - d.vl_saldo_final) AS total_despesa
FROM 
    intuitive_db_teste.demonstracao_contabil d
JOIN 
    intuitive_db_teste.operadora_ans o ON d.reg_ans = o.reg_ans
WHERE 
    d.descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
    AND d.data BETWEEN '2024-10-01' AND '2024-12-31'
GROUP BY 
    operadora, razao_social
ORDER BY 
    total_despesa DESC
LIMIT 10;
