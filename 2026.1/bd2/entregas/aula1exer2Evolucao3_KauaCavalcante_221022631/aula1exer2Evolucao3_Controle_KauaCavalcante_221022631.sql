-- =====  aula1exer2Evolucao3  =====
-- 
--         SCRIPT DE CONTROLE DE ACESSO (DCL)
--
-- Data Criacao ...........: 30/03/2026
-- Autor(es) ..............: Kaua Richard de Souza Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- ---------------------------------------------------------

USE aula1exer2Evolucao3;

-- 1. CRIACAO DOS PERFIS (ROLES)
CREATE ROLE IF NOT EXISTS 'superior', 'gerente', 'empregado';

-- 2. ATRIBUICAO DE PRIVILEGIOS POR PERFIL

-- EMPREGADO: Consulta em tudo + Inserção em VENDA e CONTEM
GRANT SELECT ON aula1exer2Evolucao3.* TO 'empregado';
GRANT INSERT ON aula1exer2Evolucao3.VENDA TO 'empregado';
GRANT INSERT ON aula1exer2Evolucao3.contem TO 'empregado';

-- GERENTE: Tudo em quase tudo, exceto PESSOA, EMPREGADO e GERENTE (apenas consulta)
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.AREA TO 'gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.PRODUTO TO 'gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.VENDA TO 'gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.contem TO 'gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.telefone TO 'gerente';
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.supervisiona TO 'gerente';
GRANT SELECT ON aula1exer2Evolucao3.PESSOA TO 'gerente';
GRANT SELECT ON aula1exer2Evolucao3.EMPREGADO TO 'gerente';
GRANT SELECT ON aula1exer2Evolucao3.GERENTE TO 'gerente';

-- SUPERIOR: Administrador da base (DBA da aula1exer2Evolucao3)
GRANT ALL PRIVILEGES ON aula1exer2Evolucao3.* TO 'superior';

-- 3. CRIACAO DE USUARIOS E ASSOCIACAO AOS PERFIS

-- Perfil SUPERIOR (1 usuário)
CREATE USER IF NOT EXISTS 'admins' IDENTIFIED BY '1admin';
GRANT 'superior' TO 'admins';

-- Perfil GERENTE (2 usuários)
CREATE USER IF NOT EXISTS 'anamaria' IDENTIFIED BY '2anam';
CREATE USER IF NOT EXISTS 'ruicarlos' IDENTIFIED BY '3ruic';
GRANT 'gerente' TO 'anamaria', 'ruicarlos';

-- Perfil EMPREGADO (5 usuários)
CREATE USER IF NOT EXISTS 'maria' IDENTIFIED BY '4maria';
CREATE USER IF NOT EXISTS 'paulo' IDENTIFIED BY '5paulo';
CREATE USER IF NOT EXISTS 'jose' IDENTIFIED BY '6jose';
CREATE USER IF NOT EXISTS 'giovana' IDENTIFIED BY '7giovana';
CREATE USER IF NOT EXISTS 'pedro' IDENTIFIED BY '8pedro';
GRANT 'empregado' TO 'maria', 'paulo', 'jose', 'giovana', 'pedro';

-- 4. CONFIGURACOES FINAIS
FLUSH PRIVILEGES;

-- Define que os perfis sejam ativados automaticamente ao logar (MySQL 8+)
SET DEFAULT ROLE ALL TO 
    'admins', 
    'anamaria', 'ruicarlos',
    'maria', 'paulo', 'jose', 'giovana', 'pedro';
