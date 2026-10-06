-- =====  tibd- APAGA  =====
-- 
--         SCRIPT DE INCLUSÃO (DCL)
--
-- Data Criacao ...........: 29/04/2026
-- Autor(es) ..............: Kaua Richard de Souza Cavalcante
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: ti-bd
-- ---------------------------------------------------------

CREATE DATABASE olist_db;

USE olist_db;

CREATE TABLE GEOLOCALIZACAO (
    geolocalization_zip_code_prefix INT (5) NOT NULL,
    geolocalization_lat DECIMAL (10, 8) NOT NULL,
    geolocalization_lng DECIMAL (10, 8) NOT NULL,
    geolocalization_city VARCHAR (50) NOT NULL,
    geolocalization_state CHAR (2) NOT NULL,
    
    CONSTRAINT GEOLOCALIZACAO_PK PRIMARY KEY (geolocalization_zip_code_prefix)
);

CREATE TABLE CLIENTE (
    customer_id VARCHAR (32) NOT NULL,
    customer_unique_id VARCHAR (32) NOT NULL,
    customer_zip_code_prefix INT (5) NOT NULL,
    customer_city VARCHAR (50) NOT NULL,
    customer_state CHAR (2) NOT NULL,
    
    CONSTRAINT CLIENTE_PK PRIMARY KEY (customer_id),
    CONSTRAINT CLIENTE_ID_UNIQUE UNIQUE (customer_unique_id),
    CONSTRAINT CLIENTE_GEOLOCALIZACAO_FK FOREIGN KEY (customer_zip_code_prefix) REFERENCES GEOLOCALIZACAO(geolocalization_zip_code_prefix)
) ENGINE = InnoDB;

CREATE TABLE PEDIDO(
    order_id VARCHAR (32) NOT NULL,
    customer_id VARCHAR (32) NOT NULL,
    order_status VARCHAR (20) NOT NULL,
    order_purchase_timestamp DATETIME NOT NULL,
    
    CONSTRAINT PEDIDO_PK PRIMARY KEY (order_id),
    CONSTRAINT PEDIDO_CLIENTE_FK FOREIGN KEY (customer_id) REFERENCES CLIENTE(customer_id)
)ENGINE = InnoDB;

CREATE TABLE PRODUTO (
    product_id VARCHAR (32) NOT NULL, 
    product_category_name VARCHAR (50), 
    product_weight_g INT (10), 
    product_length_cm INT (10),
    CONSTRAINT PRODUTO_PK PRIMARY KEY(product_id)
)ENGINE = InnoDB;

CREATE TABLE ITEM_PEDIDO (
    order_item_id INT (11) NOT NULL,
    order_id VARCHAR (32) NOT NULL, 
    product_id VARCHAR (32) NOT NULL, 
    price DECIMAL (10,2) NOT NULL,
    freight_value DECIMAL (10,2) NOT NULL,

    CONSTRAINT ITEM_PEDIDO_PK PRIMARY KEY (order_item_id, order_id),
    CONSTRAINT ITEM_PEDIDO_PEDIDO_FK FOREIGN KEY (order_id) REFERENCES PEDIDO(order_id),
    CONSTRAINT ITEM_PEDIDO_PRODUTO_FK FOREIGN KEY (product_id) REFERENCES PRODUTO(product_id)
)ENGINE = InnoDB;
