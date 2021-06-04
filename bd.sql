Create database form_med;

Use form_med;

CREATE TABLE Cliente (
    id                      INT NOT NULL AUTO_INCREMENT,
    nome		            varchar(50) NOT NULL,
    sexo                    varchar(20),
    nascimento              DATETIME,
    raca                    varchar(20),
    telefone                BIGINT,
    endereco                varchar(50),
    bairro                  varchar(20),
    municipio               varchar(20),
    PRIMARY KEY(id)
);

CREATE TABLE Atendimento (
    id                      INT NOT NULL AUTO_INCREMENT,
    id_cliente              INT NOT NULL,
    entrada                 DATETIME,
    motivo                  varchar(200),
    fila                    varchar(50),
    queixa                  varchar(200),
    PRIMARY KEY(id),
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id)
);
