-- =====  << aula3exer1_Concentrado >>  =====
-- 
--        SCRIPT DE POPULACAO (DML)
--
-- Data Criacao ...........: 30/06/2026
-- Autor(es) ..............: Kaua Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados...........: hospital_escalas
--
-- PROJETO => 01 Base de dados
--         => 06 Tabelas
-- 
-- ULTIMAS ATUALIZACOES:
-- ---------------------------------------------------------

INSERT INTO SETOR (nomeSetor) VALUES 
('Pronto Socorro'),
('UTI'), 
('Pediatria'),
('Ortopedia'),
('Cardiologia');


INSERT INTO PLANTONISTA (matricula, nomeCompleto, sexo) VALUES
(1936857458, 'MARIA JULIA', 'F'),
(1936834458, 'JULIA FONSECA', 'F'),
(1936876458, 'MARCOS AURELIO', 'M'),
(1936816458, 'EDGAR FLUER', 'M'),
(1936878458, 'MARIA JULIA FARIA', 'F');

INSERT INTO ESPECIALIDADE (idEspecialidade, nomeEspecialidade) VALUES 
(1,'Pediatria'),
(2,'Ortopedia'),
(3,'Cardiologia'),
(4,'Neurologia'),
(5'Dermatologia');

INSERT INTO ALA (idSetor, qtdQuarto, qtdSalaCirurgia, qtdEnfermaria, qtdProfissionais) VALUES 
(1, 1, 5, 7, 10, 1), -- ALA 1 PRONTO SOCORRO
(3, 1, 7, 4, 2, 1), -- ALA 3 PRONTO SOCORRO
(1, 3, 6, 10, 10, 1), -- ALA 1 PEDIATRIA
(3, 4, 2, 3, 6, 1), -- ALA 3 ORTOPEDIA
(5, 5, 2, 4, 3, 1), -- ALA 5 CARDIOLOGIA


