CREATE DATABASE financial_control;

USE financial_control;

CREATE TABLE user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE account(
    id INT PRIMARY KEY AUTO_INCREMENT,
    balance DECIMAL(8,2) NOT NULL,
    name VARCHAR(50) NOT NULL,
);

CREATE TABLE model(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    value DECIMAL(8,2),
    flow ENUM("credit", "debit"),
    installments INT,
    signature_day INT,
    signature_month INT
);

CREATE TABLE expense(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_account INT,
    id_model INT,
    description VARCHAR(50) NOT NULL,
    value DECIMAL(8,2) NOT NULL,
    flow ENUM("credit", "debit") NOT NULL,
    installments INT NOT NULL,
    is_signature BOOLEAN NOT NULL,
    FOREIGN KEY (id_account) REFERENCES account(id),
    FOREIGN KEY (id_model) REFERENCES model(id),
);

CREATE TABLE method(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE signature(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_expense INT,
    signature_day INT,
    signature_month INT,
    FOREIGN KEY (id_expense) REFERENCES expense(id)
);

CREATE TABLE modelmapping(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_account INT,
    id_model INT,
    FOREIGN KEY (id_account) REFERENCES account(id),
    FOREIGN KEY (id_model) REFERENCES model(id)
);

CREATE TABLE methodmapping(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_method INT,
    id_account INT,
    id_model INT,
    id_expense INT,
    FOREIGN KEY (id_method) REFERENCES method(id),
    FOREIGN KEY (id_account) REFERENCES account(id),
    FOREIGN KEY (id_model) REFERENCES model(id),
    FOREIGN KEY (id_expense) REFERENCES id_expense(id)
);
