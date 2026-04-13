-- =====  aula1exer2Evolucao3  =====
-- 
--         SCRIPT DE INSERÇÃO (DML)
--
-- Data Criacao ...........: 30/03/2026
-- Autor(es) ..............: Kaua Richard de Souza Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- ULTIMAS ATUALIZACOES
--   12/04/2026 => Ajuste para 10 tuplas por tabela (minimo exigido).
--              => Inclusao de caso Gerente/Empregado simultaneo (Sobreposicao).
--              => Remocao de atributos calculados conforme 3FN.
-- ---------------------------------------------------------

USE aula1exer2Evolucao3;

-- 1. PESSOA (Minimo 10)
INSERT INTO PESSOA (cpf, senha, nome) VALUES 
('22102263100', 'senhaKaua123', 'Kaua Cavalcante'),     
('11122233344', 'admin123', 'Carlos Alberto Ademir'),
('33344455566', 'ana789', 'Ana Beatriz Silveira'),     
('44455566677', 'ricardo10', 'Ricardo Silva Santos'),
('55566677788', 'mari202', 'Mariana Lopes Duarte'),
('66677788899', 'fer777', 'Fernanda Lima Oliveira'),
('77788899900', 'marcos33', 'Marcos Pontes Junior'),
('88899900011', 'joao00', 'Joao Doria Silva'),
('99900011122', 'beatriz99', 'Beatriz Souza'),
('12121212121', 'sobreposta', 'Funcionario Hibrido'); -- Caso de sobreposicao

-- 2. GERENTE (Minimo 10)
INSERT INTO GERENTE (cpf, email, formacaoEscolar) VALUES 
('22102263100', 'kaua@vendas.com', 'Superior Completo'),
('11122233344', 'carlos@vendas.com', 'Mestrado'),
('33344455566', 'ana@vendas.com', 'Superior Incompleto'),
('44455566677', 'ricardo@vendas.com', 'Superior Completo'),
('55566677788', 'mariana@vendas.com', 'Pos-Graduacao'),
('66677788899', 'fernanda@vendas.com', 'Superior Completo'),
('77788899900', 'marcos@vendas.com', 'Doutorado'),
('88899900011', 'joao@vendas.com', 'Superior Completo'),
('99900011122', 'beatriz@vendas.com', 'Mestrado'),
('12121212121', 'hibrido@vendas.com', 'Especializacao'); -- Gerente que tambem sera empregado

-- 3. EMPREGADO (Minimo 10)
INSERT INTO EMPREGADO (cpf, matricula, logradouro, numero, cep, bairro, cidade, estado) VALUES 
('22102263100', 'MAT001', 'Rua das Flores', 10, '70000001', 'Centro', 'Brasilia', 'DF'),
('11122233344', 'MAT002', 'Av Central', 200, '70000002', 'Asa Sul', 'Brasilia', 'DF'),
('33344455566', 'MAT003', 'Rua B', 30, '70000003', 'Taguatinga', 'Brasilia', 'DF'),
('44455566677', 'MAT004', 'Rua C', 40, '70000004', 'Ceilandia', 'Brasilia', 'DF'),
('55566677788', 'MAT005', 'Rua D', 50, '70000005', 'Guara', 'Brasilia', 'DF'),
('66677788899', 'MAT006', 'Rua E', 60, '70000006', 'Sobradinho', 'Brasilia', 'DF'),
('77788899900', 'MAT007', 'Rua F', 70, '70000007', 'Gama', 'Brasilia', 'DF'),
('88899900011', 'MAT008', 'Rua G', 80, '70000008', 'Planaltina', 'Brasilia', 'DF'),
('99900011122', 'MAT009', 'Rua H', 90, '70000009', 'Samambaia', 'Brasilia', 'DF'),
('12121212121', 'MAT010', 'Rua I', 100, '70000010', 'Sudoeste', 'Brasilia', 'DF'); -- Empregado que tambem e gerente

-- 4. TELEFONE (Minimo 10)
INSERT INTO telefone (cpf, telefone) VALUES 
('22102263100', '61999990001'), ('22102263100', '61999990002'),
('11122233344', '61999990003'), ('33344455566', '61999990004'),
('44455566677', '61999990005'), ('55566677788', '61999990006'),
('66677788899', '61999990007'), ('77788899900', '61999990008'),
('88899900011', '61999990009'), ('99900011122', '61999990010');

-- 5. AREA (Minimo 10)
INSERT INTO AREA (nomeArea, cpfGerente) VALUES 
('Eletronicos', '22102263100'), ('Moveis', '11122233344'), 
('Informatica', '33344455566'), ('Eletrodomesticos', '44455566677'),
('Telefonia', '55566677788'), ('Games', '22102263100'),
('Papelaria', '77788899900'), ('Limpeza', '88899900011'),
('Brinquedos', '99900011122'), ('Decoracao', '12121212121');

-- 6. PRODUTO (Minimo 10)
INSERT INTO PRODUTO (idArea, nomeProduto, precoBase) VALUES 
(1, 'Smartphone S24', 5000.00), (2, 'Sofa Retratil', 2500.00),
(3, 'Notebook Dell', 4500.00), (4, 'Geladeira Frost', 3500.00),
(5, 'iPhone 15', 6000.00), (6, 'PS5', 4000.00),
(7, 'Resma A4', 25.00), (8, 'Detergente 5L', 12.00),
(9, 'Lego Star Wars', 500.00), (10, 'Quadro Decorativo', 150.00);

-- 7. VENDA (Minimo 10)
INSERT INTO VENDA (cpfEmpregado, dataVenda) VALUES 
('22102263100', NOW()), ('11122233344', NOW()), ('33344455566', NOW()),
('44455566677', NOW()), ('55566677788', NOW()), ('66677788899', NOW()),
('77788899900', NOW()), ('88899900011', NOW()), ('99900011122', NOW()),
('12121212121', NOW());

-- 8. CONTEM (Minimo 10 + Venda com 2 itens)
INSERT INTO contem (codigoProduto, idVenda, precoUnitarioVenda, quantidadeProduto) VALUES 
(1, 1, 4900.00, 1), (2, 1, 2400.00, 1), -- Venda 1 com 2 itens
(3, 2, 4400.00, 1), (4, 3, 3400.00, 1), (5, 4, 5900.00, 1),
(6, 5, 3900.00, 1), (7, 6, 24.00, 10), (8, 7, 11.00, 5),
(9, 8, 480.00, 1), (10, 9, 140.00, 2);

-- 9. SUPERVISIONA (Minimo 10)
INSERT INTO supervisiona (cpfGerente, cpfEmpregado) VALUES 
('22102263100', '11122233344'), ('11122233344', '22102263100'), -- Supervisao mutua permitida
('33344455566', '44455566677'), ('44455566677', '33344455566'),
('55566677788', '66677788899'), ('66677788899', '55566677788'),
('77788899900', '88899900011'), ('88899900011', '77788899900'),
('99900011122', '12121212121'), ('12121212121', '99900011122');
