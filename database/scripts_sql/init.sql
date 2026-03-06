
-- Script inicial de banco de dados

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    senha_hash TEXT,
    perfil VARCHAR(50)
);

CREATE TABLE empresas (
    id SERIAL PRIMARY KEY,
    razao_social VARCHAR(200),
    cnpj VARCHAR(20),
    segmento VARCHAR(100)
);

CREATE TABLE documentos (
    id SERIAL PRIMARY KEY,
    empresa_id INTEGER REFERENCES empresas(id),
    nome_arquivo VARCHAR(200),
    periodo VARCHAR(20),
    data_upload TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
