-- =====  aula1exer2Evolucao3  =====
-- 
--         SCRIPT DE CONSULTAS (DML)
--
-- Data Criacao ...........: 30/03/2026
-- Autor(es) ..............: Kaua Richard de Souza Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- ULTIMAS ATUALIZACOES
--   12/04/2026 => Implementacao das consultas A, B, C, D e E.
--              => Criacao de VIEW para relatorio de vendas por produto.
-- ---------------------------------------------------------

USE aula1exer2Evolucao3;

-- A) Consultar todas as vendas feitas por um ÚNICO empregado específico (CPF: 22102263100)
SELECT 
    V.idVenda, 
    V.dataVenda, 
    P.nome AS nomeEmpregado
FROM VENDA V
JOIN PESSOA P ON V.cpfEmpregado = P.cpf
WHERE V.cpfEmpregado = '22102263100';


-- B) Relacionar dados de uma venda específica (ID: 1) com produtos e preço total por item
-- (Atende a 3FN calculando o total em tempo real)
SELECT 
    V.idVenda,
    PR.nomeProduto,
    C.quantidadeProduto,
    C.precoUnitarioVenda,
    (C.quantidadeProduto * C.precoUnitarioVenda) AS precoTotalItem
FROM VENDA V
JOIN contem C ON V.idVenda = C.idVenda
JOIN PRODUTO PR ON C.codigoProduto = PR.codigoProduto
WHERE V.idVenda = 1;


-- C) Mostrar empregados que NÃO sejam gerentes em ordem alfabética crescente
-- (Usa LEFT JOIN e filtra onde o CPF nao existe na tabela GERENTE)
SELECT 
    P.nome, 
    E.matricula
FROM EMPREGADO E
JOIN PESSOA P ON E.cpf = P.cpf
LEFT JOIN GERENTE G ON E.cpf = G.cpf
WHERE G.cpf IS NULL
ORDER BY P.nome ASC;


-- D) VIEW: Quantidade de CADA produto vendido pela empresa
CREATE OR REPLACE VIEW v_total_vendas_produto AS
SELECT 
    P.codigoProduto,
    P.nomeProduto,
    SUM(C.quantidadeProduto) AS quantidadeTotalVendida
FROM PRODUTO P
LEFT JOIN contem C ON P.codigoProduto = C.codigoProduto
GROUP BY P.codigoProduto, P.nomeProduto
ORDER BY P.nomeProduto ASC;

-- Acionamento da VIEW
SELECT * FROM v_total_vendas_produto;


-- E) Pesquisa por parte do nome (ex: 'Smart') com código, nome e total de vendas em ordem decrescente
SELECT 
    P.codigoProduto,
    P.nomeProduto,
    COUNT(C.idVenda) AS quantidadeDeVendasRealizadas
FROM PRODUTO P
LEFT JOIN contem C ON P.codigoProduto = C.codigoProduto
WHERE P.nomeProduto LIKE '%Smart%'
GROUP BY P.codigoProduto, P.nomeProduto
ORDER BY P.nomeProduto DESC;
