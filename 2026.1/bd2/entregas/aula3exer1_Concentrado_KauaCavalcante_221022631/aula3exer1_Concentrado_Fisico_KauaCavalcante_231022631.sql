-- =====  << aula3exer1_Concentrado >>  =====
-- 
--        SCRIPT DE CRIACAO (DDL)
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


CREATE DATABASE IF NOT EXISTS hospital_escalas;
USE hospital_escalas;

CREATE TABLE SETOR (
    idSetor INT AUTO_INCREMENT PRIMARY KEY,
    nomeSetor VARCHAR(100) NOT NULL
);

CREATE TABLE PLANTONISTA (
    matricula INT (10) PRIMARY KEY,
    nomeCompleto VARCHAR(150) NOT NULL,
    sexo CHAR(1) NOT NULL CHECK (sexo IN ('M','F'))
);

CREATE TABLE ESPECIALIDADE (
    idEspecialidade INT AUTO_INCREMENT PRIMARY KEY,
    nomeEspecialidade VARCHAR(100) NOT NULL
);

CREATE TABLE ALA (
    idAla INT PRIMARY KEY,
    idSetor INT NOT NULL,
    qtdQuarto INT NOT NULL CHECK (qtdQuarto >= 1),
    qtdSalaCirurgia INT NOT NULL DEFAULT 0 CHECK (qtdSalaCirurgia >= 0),
    qtdEnfermaria INT NOT NULL CHECK (qtdEnfermaria >= 1),
    qtdProfissionais INT NOT NULL CHECK (qtdProfissionais >= 1),
    CONSTRAINT ALA_SETOR_FK FOREIGN KEY (idSetor) REFERENCES SETOR(idSetor)
);

CREATE TABLE ESCALA (
    matriculaPlantonista INT NOT NULL,
    dataHorario DATETIME NOT NULL,
    idSetor INT NOT NULL,
    PRIMARY KEY (matriculaPlantonista, dataHorario),
    CONSTRAINT ESCALA_PLANTONISTA_FK FOREIGN KEY (matriculaPlantonista) REFERENCES PLANTONISTA(matricula),
    CONSTRAINT ESCALA_SETOR_FK FOREIGN KEY (idSetor) REFERENCES SETOR(idSetor)
);

CREATE TABLE POSSUI_ESPECIALIDADE (
    matriculaPlantonista INT NOT NULL,
    idEspecialidade INT NOT NULL,
    PRIMARY KEY (matriculaPlantonista, idEspecialidade),
    CONSTRAINT POSESP_PLANTONISTA_FK FOREIGN KEY (matriculaPlantonista) REFERENCES PLANTONISTA(matricula),
    CONSTRAINT POSESP_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade) REFERENCES ESPECIALIDADE(idEspecialidade)
);