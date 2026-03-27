DROP DATABASE IF EXISTS finances;

CREATE DATABASE finances;

USE finances;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id UUID DEFAULT UUID_v4(),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    type VARCHAR(30) DEFAULT 'regular',
    PRIMARY KEY (id)
);

INSERT INTO users (name, email, password, type)
VALUES ('admin_user', 'admin@ad.com', 'admin', 'admin');

DROP TABLE IF EXISTS expenses;

CREATE TABLE expenses (
    id UUID DEFAULT UUID_v4(),
    date DATE NOT NULL,
    month VARCHAR(20),
    year INT,
    item VARCHAR(50),
    type VARCHAR(50) NOT NULL,
    store VARCHAR(80),
    comment TEXT,
    amount DECIMAL(10, 2),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS income (
    id UUID DEFAULT UUID_v4(),
    date DATE NOT NULL,
    month VARCHAR(20),
    year INT,
    source VARCHAR(100),
    type VARCHAR(50) NOT NULL,
    comment TEXT,
    amount DECIMAL(10, 2),
    PRIMARY KEY (id)
);
