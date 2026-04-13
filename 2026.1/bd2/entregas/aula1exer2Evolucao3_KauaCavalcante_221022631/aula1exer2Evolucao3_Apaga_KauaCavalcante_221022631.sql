-- =====  aula1exer2Evolucao3  =====
-- 
--         SCRIPT DE EXCLUSÃO (DDL)
--
-- Data Criacao ...........: 30/03/2026
-- Autor(es) ..............: Kaua Richard de Souza Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- ULTIMAS ATUALIZACOES
--   12/04/2026 => Atualizacao da ordem de exclusao para novas tabelas da Evolucao 3.
--              => Remocao das tabelas de especializacao e associativas N:M.
-- ---------------------------------------------------------

USE aula1exer2Evolucao3;

-- Tabelas de Relacionamento N:M e Atributos Multivalorados (Primeiras a sair)
DROP TABLE contem;
DROP TABLE supervisiona;
DROP TABLE telefone;

-- Tabelas com chaves estrangeiras para Entidades Base
DROP TABLE VENDA;
DROP TABLE PRODUTO;
DROP TABLE AREA;

-- Tabelas de Especializacao (Dependem de PESSOA)
DROP TABLE GERENTE;
DROP TABLE EMPREGADO;

-- Entidade Base (Ultima a sair)
DROP TABLE PESSOA;
