-- ==============================================================================
-- SCRIPT DE CRIAÇÃO DO BANCO DE DADOS - PROPÓSITO PARTNERS (POSTGRESQL)
-- Versão: 2.0 (Final - Incluindo Views, Triggers e Procedures)
-- Responsável: Gabriel Rodrigo Marques Duglokinski
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. CRIAÇÃO DAS TABELAS E RELACIONAMENTOS (DDL)
-- ------------------------------------------------------------------------------

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    perfil_acesso VARCHAR(50) NOT NULL 
);

CREATE TABLE termo_aceite_lgpd (
    id_termo SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    data_aceite TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_usuario VARCHAR(45) NOT NULL,
    status_consentimento BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_termo_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE empresa (
    id_empresa SERIAL PRIMARY KEY,
    razao_social VARCHAR(200) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    representante_legal VARCHAR(150) NOT NULL,
    segmento VARCHAR(100),
    status VARCHAR(20) DEFAULT 'Ativa',
    data_cadastro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE usuario_empresa (
    id_usuario INT NOT NULL,
    id_empresa INT NOT NULL,
    PRIMARY KEY (id_usuario, id_empresa),
    CONSTRAINT fk_ue_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT fk_ue_empresa FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

CREATE TABLE documento (
    id_documento SERIAL PRIMARY KEY,
    id_empresa INT NOT NULL,
    tipo VARCHAR(50) NOT NULL, 
    periodo_contabil VARCHAR(20) NOT NULL, 
    data_upload TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Adicionado para a Trigger
    status_extracao VARCHAR(50) DEFAULT 'Pendente',
    CONSTRAINT fk_doc_empresa FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

CREATE TABLE dado_financeiro (
    id_dado SERIAL PRIMARY KEY,
    id_documento INT NOT NULL,
    id_usuario_validador INT, 
    tipo_dado VARCHAR(50) NOT NULL, 
    categoria VARCHAR(100) NOT NULL, 
    valor_extraido DECIMAL(15, 2) NOT NULL,
    score_confianca_ia DECIMAL(5, 2), 
    classificacao_faixa VARCHAR(50), 
    CONSTRAINT fk_dado_doc FOREIGN KEY (id_documento) REFERENCES documento(id_documento),
    CONSTRAINT fk_dado_validador FOREIGN KEY (id_usuario_validador) REFERENCES usuario(id_usuario)
);

CREATE TABLE relatorio (
    id_relatorio SERIAL PRIMARY KEY,
    id_empresa INT NOT NULL,
    data_geracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    link_pdf VARCHAR(255) NOT NULL,
    CONSTRAINT fk_relatorio_empresa FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

-- ------------------------------------------------------------------------------
-- 2. VIEWS (Consultas Otimizadas)
-- ------------------------------------------------------------------------------

-- View para o Dashboard: Resumo de documentos processados por empresa
CREATE VIEW vw_resumo_documentos_empresa AS
SELECT 
    e.razao_social,
    e.cnpj,
    d.tipo AS tipo_documento,
    d.periodo_contabil,
    d.status_extracao,
    COUNT(df.id_dado) AS total_dados_extraidos
FROM empresa e
JOIN documento d ON e.id_empresa = d.id_empresa
LEFT JOIN dado_financeiro df ON d.id_documento = df.id_documento
GROUP BY e.razao_social, e.cnpj, d.tipo, d.periodo_contabil, d.status_extracao;

-- ------------------------------------------------------------------------------
-- 3. FUNCTIONS E TRIGGERS (Automatização de Processos)
-- ------------------------------------------------------------------------------

-- Função para atualizar a data de modificação automaticamente
CREATE OR REPLACE FUNCTION fn_atualiza_data_modificacao()
RETURNS TRIGGER AS $$
BEGIN
    NEW.data_atualizacao = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger atrelada à tabela de documentos
CREATE TRIGGER trg_atualiza_documento
BEFORE UPDATE ON documento
FOR EACH ROW
EXECUTE FUNCTION fn_atualiza_data_modificacao();

-- ------------------------------------------------------------------------------
-- 4. STORED PROCEDURES (Rotinas de Negócio)
-- ------------------------------------------------------------------------------

-- Procedure para o Analista validar todos os dados de um documento de uma vez
CREATE OR REPLACE PROCEDURE sp_validar_documento_lote(
    p_id_documento INT,
    p_id_usuario_validador INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Atualiza os dados financeiros marcando o usuário que os validou
    UPDATE dado_financeiro
    SET id_usuario_validador = p_id_usuario_validador
    WHERE id_documento = p_id_documento
      AND id_usuario_validador IS NULL;

    -- Atualiza o status do documento para concluído/validado
    UPDATE documento
    SET status_extracao = 'Validado'
    WHERE id_documento = p_id_documento;

    COMMIT;
END;
$$;