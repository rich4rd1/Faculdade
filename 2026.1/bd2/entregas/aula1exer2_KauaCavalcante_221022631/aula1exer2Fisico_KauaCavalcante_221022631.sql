-- =====  PROJETO FINAL AULA 1 EXER 2  =====
-- 
--         SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 23/03/2026
-- Autor(es) ..............: Kaua Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2
--
-- PROJETO => 01 Base de Dados
--         => 07 Tabelas
-- 
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula1exer2;
USE aula1exer2;

CREATE TABLE PESSOA (
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    CONSTRAINT PESSOA_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;

CREATE TABLE AREA (
    idArea INT NOT NULL,
    nomeArea VARCHAR(50) NOT NULL,
    CONSTRAINT AREA_PK PRIMARY KEY (idArea)
) ENGINE = InnoDB;

CREATE TABLE GERENTE (
    email VARCHAR(50) NOT NULL,
    formacaoEscolar VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    CONSTRAINT GERENTE_PK PRIMARY KEY (cpf),
    CONSTRAINT GERENTE_PESSOA_FK FOREIGN KEY (cpf) REFERENCES PESSOA(cpf)
) ENGINE = InnoDB;

CREATE TABLE EMPREGADO (
    matricula VARCHAR(10) NOT NULL,
    logradouro VARCHAR(50),
    cep VARCHAR(8),
    numero INT,
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado CHAR(2),
    complemento VARCHAR(50),
    cpf VARCHAR(11) NOT NULL,
    CONSTRAINT EMPREGADO_PK PRIMARY KEY (cpf),
    CONSTRAINT EMPREGADO_PESSOA_FK FOREIGN KEY (cpf) REFERENCES PESSOA(cpf)
) ENGINE = InnoDB;

CREATE TABLE PRODUTO (
    codigoProduto INT NOT NULL,
    precoBase DECIMAL(10,2) NOT NULL,
    idArea INT,
    CONSTRAINT PRODUTO_PK PRIMARY KEY (codigoProduto),
    CONSTRAINT PRODUTO_AREA_FK FOREIGN KEY (idArea) REFERENCES AREA(idArea)
) ENGINE = InnoDB;

CREATE TABLE TELEFONE (
    cpf VARCHAR(11) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    CONSTRAINT TELEFONE_PK PRIMARY KEY (cpf, telefone),
    CONSTRAINT TELEFONE_EMPREGADO_FK FOREIGN KEY (cpf) REFERENCES EMPREGADO(cpf)
) ENGINE = InnoDB;

CREATE TABLE NOTA_FISCAL (
    numeroNota INT NOT NULL,
    dataVenda DATE NOT NULL,
    cpf_empregado VARCHAR(11) NOT NULL,
    CONSTRAINT NOTA_FISCAL_PK PRIMARY KEY (numeroNota),
    CONSTRAINT NOTA_FISCAL_EMPREGADO_FK FOREIGN KEY (cpf_empregado) REFERENCES EMPREGADO(cpf)
) ENGINE = InnoDB;

CREATE TABLE ITEM_VENDA (
    codigoProduto INT NOT NULL,
    numeroNota INT NOT NULL,
    quantidade INT NOT NULL,
    precoUnidade DECIMAL(10,2) NOT NULL,
    CONSTRAINT ITEM_VENDA_PRODUTO_FK FOREIGN KEY (codigoProduto) REFERENCES PRODUTO(codigoProduto),
    CONSTRAINT ITEM_VENDA_NOTA_FK FOREIGN KEY (numeroNota) REFERENCES NOTA_FISCAL(numeroNota)
) ENGINE = InnoDB;
