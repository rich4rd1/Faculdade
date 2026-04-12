-- =====  PROJETO FINAL AULA 1 EXER 2  =====
-- 
--         SCRIPT PARA APAGAR TABELAS (DDL)
--
-- Data Criacao ...........: 23/03/2026
-- Autor(es) ..............: Kaua Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2
--
-- ---------------------------------------------------------

USE aula1exer2;

-- Ordem correta para evitar erros de Foreign Key
DROP TABLE IF EXISTS ITEM_VENDA;
DROP TABLE IF EXISTS NOTA_FISCAL;
DROP TABLE IF EXISTS PRODUTO;
DROP TABLE IF EXISTS EMPREGADO;
DROP TABLE IF EXISTS GERENTE;
DROP TABLE IF EXISTS AREA;
DROP TABLE IF EXISTS PESSOA;
DROP TABLE IF EXISTS TELEFONE;
