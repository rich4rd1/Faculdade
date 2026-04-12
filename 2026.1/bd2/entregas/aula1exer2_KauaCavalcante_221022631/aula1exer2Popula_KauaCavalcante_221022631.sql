-- =====  PROJETO FINAL AULA 1 EXER 2  =====
-- 
--         SCRIPT DE INSERCAO (DML)
--
-- Data Criacao ...........: 23/03/2026
-- Autor(es) ..............: Kaua Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2
--
-- ---------------------------------------------------------

USE aula1exer2;

INSERT INTO PESSOA (cpf, nome, senha) VALUES 
('11122233344', 'Ricardo Oliveira', 'pass123'),
('55566677788', 'Fernanda Souza', 'fe2024'),
('99900011122', 'Carlos Alberto', 'admin789');

INSERT INTO AREA (idArea, nomeArea) VALUES 
(1, 'Eletrônicos'),
(2, 'Vestuário'),
(3, 'Alimentos');


INSERT INTO GERENTE (email, formacaoEscolar, cpf) VALUES 
('ricardo.gerencia@loja.com', 'Administração', '11122233344');

INSERT INTO EMPREGADO (matricula, logradouro, cep, numero, bairro, cidade, estado, cpf) VALUES 
('EMP001', 'Rua das Flores', '70000123', 10, 'Centro', 'Brasília', 'DF', '55566677788'),
('EMP002', 'Av. Central', '71000456', 205, 'Asa Sul', 'Brasília', 'DF', '99900011122'),
('EMP003', 'Rua 10', '72000789', 5, 'Taguatinga', 'Brasília', 'DF', '11122233344');

INSERT INTO PRODUTO (codigoProduto, precoBase, idArea) VALUES 
(101, 1500.00, 1),
(102, 89.90, 2),
(103, 15.50, 3);

INSERT INTO NOTA_FISCAL (numeroNota, dataVenda, cpf_empregado) VALUES 
(1001, '2026-03-20', '55566677788'),
(1002, '2026-03-21', '99900011122'),
(1003, '2026-03-22', '55566677788');

INSERT INTO TELEFONE (cpf, telefone) VALUES 
('55566677788', '61988887777'),
('99900011122', '61999990000'),
('11122233344', '6133332222');

INSERT INTO ITEM_VENDA (codigoProduto, numeroNota, quantidade, precoUnidade) VALUES 
(101, 1001, 1, 1450.00),
(102, 1002, 2, 85.00),
(103, 1003, 5, 15.50);
