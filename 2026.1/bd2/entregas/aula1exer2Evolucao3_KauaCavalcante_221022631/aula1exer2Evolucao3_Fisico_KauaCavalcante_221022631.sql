-- =====  aula1exer2Evolucao3  =====
-- 
--         SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 30/03/2026
-- Autor(es) ..............: Kaua Richard de Souza Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
--Alteracoes:
--   12/04/2026 -> Ajuste para 3FN: remocao de atributos calculados.
--              -> Correcao de FKs para referenciar PKs da especializacao.
--              -> Nome da base de dados alterado para Evolucao3.
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula1exer2Evolucao3;
USE aula1exer2Evolucao3;

CREATE TABLE PESSOA (
    cpf VARCHAR(11) NOT NULL,
    senha VARCHAR(64) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    CONSTRAINT PESSOA_PK PRIMARY KEY (cpf)
) ENGINE=InnoDB;

CREATE TABLE GERENTE (
    cpf VARCHAR(11) NOT NULL,
    email VARCHAR(100) NOT NULL,
    formacaoEscolar VARCHAR(50) NOT NULL,
    CONSTRAINT GERENTE_PK PRIMARY KEY (cpf),
    CONSTRAINT GERENTE_PESSOA_FK FOREIGN KEY (cpf) REFERENCES PESSOA(cpf) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE EMPREGADO (
    cpf VARCHAR(11) NOT NULL,
    matricula VARCHAR(11) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    cep VARCHAR(8) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    complemento VARCHAR(100),
    CONSTRAINT EMPREGADO_PK PRIMARY KEY (cpf),
    CONSTRAINT EMPREGADO_PESSOA_FK FOREIGN KEY (cpf) REFERENCES PESSOA(cpf) ON DELETE CASCADE,
    CONSTRAINT EMPREGADO_UK UNIQUE (matricula)
) ENGINE=InnoDB;

CREATE TABLE telefone (
    cpf VARCHAR(11) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    CONSTRAINT telefone_PK PRIMARY KEY (cpf, telefone),
    CONSTRAINT telefone_EMPREGADO_FK FOREIGN KEY (cpf) REFERENCES EMPREGADO(cpf) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE AREA (
    idArea INT NOT NULL AUTO_INCREMENT,
    nomeArea VARCHAR(50) NOT NULL,
    cpfGerente VARCHAR(11) NOT NULL,
    CONSTRAINT AREA_PK PRIMARY KEY (idArea),
    CONSTRAINT AREA_GERENTE_FK FOREIGN KEY (cpfGerente) REFERENCES GERENTE(cpf)
) ENGINE=InnoDB;

CREATE TABLE PRODUTO (
    codigoProduto INT NOT NULL AUTO_INCREMENT,
    idArea INT NOT NULL,
    nomeProduto VARCHAR(100) NOT NULL,
    precoBase DECIMAL(10,2) NOT NULL,
    CONSTRAINT PRODUTO_PK PRIMARY KEY (codigoProduto),
    CONSTRAINT PRODUTO_AREA_FK FOREIGN KEY (idArea) REFERENCES AREA(idArea)
) ENGINE=InnoDB;

CREATE TABLE VENDA (
    idVenda INT NOT NULL AUTO_INCREMENT,
    cpfEmpregado VARCHAR(11) NOT NULL,
    dataVenda DATETIME NOT NULL,
    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),
    CONSTRAINT VENDA_EMPREGADO_FK FOREIGN KEY (cpfEmpregado) REFERENCES EMPREGADO(cpf)
) ENGINE=InnoDB;

CREATE TABLE contem (
    codigoProduto INT NOT NULL,
    idVenda INT NOT NULL,
    precoUnitarioVenda DECIMAL(10,2) NOT NULL,
    quantidadeProduto INT NOT NULL,
    CONSTRAINT contem_PK PRIMARY KEY (codigoProduto, idVenda),
    CONSTRAINT contem_PRODUTO_FK FOREIGN KEY (codigoProduto) REFERENCES PRODUTO(codigoProduto),
    CONSTRAINT contem_VENDA_FK FOREIGN KEY (idVenda) REFERENCES VENDA(idVenda)
) ENGINE=InnoDB;

CREATE TABLE supervisiona (
    cpfGerente VARCHAR(11) NOT NULL,
    cpfEmpregado VARCHAR(11) NOT NULL,
    CONSTRAINT supervisiona_PK PRIMARY KEY (cpfGerente, cpfEmpregado),
    CONSTRAINT supervisiona_GERENTE_FK FOREIGN KEY (cpfGerente) REFERENCES GERENTE(cpf),
    CONSTRAINT supervisiona_EMPREGADO_FK FOREIGN KEY (cpfEmpregado) REFERENCES EMPREGADO(cpf)
) ENGINE=InnoDB;
