/*
Quais as 10 operadoras com maiores despesas nessa categoria no último ano?
*/

SELECT reg_ans AS operadora, 
       SUM(vl_saldo_inicial - vl_saldo_final) AS total_despesa
FROM intuitive_db.demonstracoes_contabeis
WHERE descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
  AND data BETWEEN '2024-01-01' AND '2024-12-31' 
GROUP BY operadora
ORDER BY total_despesa DESC
LIMIT 10;