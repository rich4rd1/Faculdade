-- =====  aula1exer2Evolucao2  =====
-- 
--         SCRIPT DE INSERÇÃO (DML)
--
-- Data Criacao ...........: 30/03/2026
-- Autor(es) ..............: Kaua Richard de Souza Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao2
-- ---------------------------------------------------------

USE aula1exer2Evolucao2;

 
INSERT INTO PESSOA (cpf, senha, nome) VALUES 
('22102263100', 'senhaKaua123', 'Kaua Cavalcante'),     
('11122233344', 'admin123', 'Carlos Alberto Ademir'),
('33344455566', 'ana789', 'Ana Beatriz Silveira'),     
('44455566677', 'ricardo10', 'Ricardo Silva Santos'),
('55566677788', 'mari202', 'Mariana Lopes Duarte'),
('66677788899', 'fer777', 'Fernanda Lima Oliveira'),
('77788899900', 'marcos33', 'Marcos Pontes Junior'),
('88899900011', 'joao00', 'Joao Doria Silva');

 
INSERT INTO GERENTE (cpf, idGerente, email, formacaoEscolar) VALUES 
('22102263100', 10, 'kaua@vendas.com', 'Superior Cursando'), -- Kaua Gerente
('33344455566', 20, 'anabeatriz@vendas.com', 'Mestrado'),     -- Ana Gerente
('55566677788', 30, 'mariana@vendas.com', 'Superior Completo'),
('66677788899', 40, 'fernanda@vendas.com', 'Especialização'),
('77788899900', 50, 'marcos@vendas.com', 'Ensino Médio'),
('11122233344', 60, 'carlos@vendas.com', 'Doutorado'),
('88899900011', 70, 'joao@vendas.com', 'Superior Completo');


INSERT INTO EMPREGADO (cpf, matricula, estado, complemento, logradouro, cep, numero, bairro, cidade) VALUES 
('22102263100', 'MAT202601', 'DF', 'Apto 302', 'Rua das Palmeiras', '72000100', '10', 'Asa Sul', 'Brasilia'),
('44455566677', 'MAT202602', 'DF', NULL, 'Quadra 102 Conjunto A', '72110500', '45', 'Taguatinga', 'Brasilia'),
('11122233344', 'MAT202603', 'DF', 'Casa Fundos', 'Avenida Central', '72220300', '120', 'Ceilandia', 'Brasilia'),
('55566677788', 'MAT202604', 'DF', NULL, 'Rua do Comercio', '71000000', '5', 'Guara', 'Brasilia'),
('66677788899', 'MAT202605', 'DF', 'Bloco B', 'SQN 202', '70700100', '202', 'Asa Norte', 'Brasilia'),
('77788899900', 'MAT202606', 'DF', NULL, 'Rua das Flores', '73000000', '88', 'Sobradinho', 'Brasilia'),
('88899900011', 'MAT202607', 'DF', 'Sala 4', 'Setor Comercial Sul', '70300000', '500', 'Asa Sul', 'Brasilia');

-- 4. INSERINDO TELEFONES (Multivalorado) [cite: 5, 13]
INSERT INTO telefone (matriculaEmpregado, telefone) VALUES 
('MAT202601', '61988887777'), ('MAT202601', '6133332222'), -- Kaua com 2 telefones
('MAT202602', '61977776666'), ('MAT202603', '61966665555'),
('MAT202604', '61955554444'), ('MAT202605', '61944443333'),
('MAT202606', '61933332222'), ('MAT202607', '61922221111');


INSERT INTO AREA (cpfGerente, nomeArea) VALUES 
('33344455566', 'Eletronicos'), -- Ana Beatriz cuida dessa
('33344455566', 'Informatica'),  -- Ana Beatriz cuida dessa também (Regra: 2 areas) 
('22102263100', 'Moveis'),       -- Kaua cuida dessa
('55566677788', 'Eletrodomesticos'),
('66677788899', 'Papelaria'),
('77788899900', 'Limpeza'),
('88899900011', 'Brinquedos');


INSERT INTO supervisao (idGerente, matriculaEmpregado) VALUES 
(10, 'MAT202602'), (20, 'MAT202601'), (30, 'MAT202603'), 
(40, 'MAT202604'), (50, 'MAT202605'), (60, 'MAT202606'), 
(70, 'MAT202607');


INSERT INTO PRODUTO (idArea, nomeProduto, precoBase, unidadeProduto) VALUES 
(1, 'Smartphone Samsung S24', 5500.00, 'UN'),
(2, 'Notebook Dell Latitude', 4200.00, 'UN'),
(3, 'Cadeira Gamer DT3', 1500.00, 'UN'),
(4, 'Geladeira Frost Free', 3800.00, 'UN'),
(5, 'Resma Papel A4', 25.00, 'CX'),
(6, 'Detergente Neutro 5L', 15.00, 'GL'),
(7, 'Lego Star Wars', 450.00, 'UN');


INSERT INTO VENDA (matriculaEmpregado, dataVenda) VALUES 
('MAT202601', '2026-03-25 10:30:00'), -- Venda do Kaua com 2 itens 
('MAT202602', '2026-03-25 11:00:00'),
('MAT202603', '2026-03-26 14:20:00'),
('MAT202601', '2026-03-26 15:00:00'),
('MAT202604', '2026-03-27 09:15:00'),
('MAT202605', '2026-03-28 16:45:00'),
('MAT202606', '2026-03-29 10:00:00');


INSERT INTO contem (codigoProduto, idVenda, precoUnitarioVenda, quantidadeProduto, valorTotalVenda) VALUES 
(1, 1, 5400.00, 1, 5400.00), -- Venda 1, Item 1
(2, 1, 4100.00, 1, 4100.00), -- Venda 1, Item 2 (Regra: 2 produtos na mesma nota) 
(3, 2, 1500.00, 2, 3000.00),
(4, 3, 3800.00, 1, 3800.00),
(5, 4, 25.00, 10, 250.00),
(6, 5, 15.00, 5, 75.00),
(7, 6, 450.00, 1, 450.00),
(1, 7, 5500.00, 1, 5500.00);
