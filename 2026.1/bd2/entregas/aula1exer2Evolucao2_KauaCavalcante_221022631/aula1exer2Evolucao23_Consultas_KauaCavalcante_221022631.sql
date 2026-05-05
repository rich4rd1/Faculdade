-- =====  aula1exer2Evolucao2  =====
-- 
--         SCRIPT DE BUSCA (DQL)
--
-- Data Criacao ...........: 30/03/2026
-- Autor(es) ..............: Kaua Richard de Souza Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao2
-- ---------------------------------------------------------

USE aula1exer2Evolucao2;

-- A) Vendas por empregado (Ex: MAT01)
SELECT * FROM VENDA WHERE matriculaEmpregado = 'MAT202601';

-- B) Itens de uma venda (Ex: ID 1) e preço total por item
SELECT V.idVenda, P.nomeProduto, C.quantidadeProduto, C.precoUnitarioVenda, 
       (C.quantidadeProduto * C.precoUnitarioVenda) AS total_calculado
FROM VENDA V
JOIN contem C ON V.idVenda = C.idVenda
JOIN PRODUTO P ON C.codigoProduto = P.codigoProduto
WHERE V.idVenda = 1;

-- C) Empregados que NÃO são gerentes
SELECT P.nome FROM EMPREGADO E
JOIN PESSOA P ON E.cpf = P.cpf
LEFT JOIN GERENTE G ON E.cpf = G.cpf
WHERE G.cpf IS NULL
ORDER BY P.nome ASC;

-- D) VIEW de quantidade vendida por produto
CREATE OR REPLACE VIEW vw_estoque_vendido AS
SELECT P.codigoProduto, P.nomeProduto, SUM(C.quantidadeProduto) as total_saida
FROM PRODUTO P
JOIN contem C ON P.codigoProduto = C.codigoProduto
GROUP BY P.codigoProduto, P.nomeProduto;

-- E) Busca por parte do nome
SELECT codigoProduto, nomeProduto, 
       (SELECT COUNT(*) FROM contem WHERE codigoProduto = PRODUTO.codigoProduto) as vendas_realizadas
FROM PRODUTO
WHERE nomeProduto LIKE '%Cadeira%'
ORDER BY nomeProduto DESC;
