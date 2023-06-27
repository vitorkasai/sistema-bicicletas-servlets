CREATE DATABASE IF NOT EXISTS Locacao_Bicicletas CHARACTER SET utf8 collate utf8_bin;
USE Locacao_Bicicletas;

CREATE TABLE IF NOT EXISTS usuario (
  id BIGINT AUTO_INCREMENT NOT NULL,
  email VARCHAR(256) UNIQUE NOT NULL,
  senha VARCHAR(256) NOT NULL,
  nome VARCHAR(110) NOT NULL,
  administrador TINYINT(1) DEFAULT 0,
  tipo_usuario CHAR(1) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS cliente (
  id_usuario BIGINT NOT NULL,
  CPF CHAR(11) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  sexo CHAR(1) NOT NULL,
  data_nascimento DATE NOT NULL,
  PRIMARY KEY (CPF),
  FOREIGN KEY (id_usuario) REFERENCES usuario (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS locadora (
  id_usuario BIGINT NOT NULL,
  CNPJ CHAR(14) NOT NULL,
  cidade VARCHAR(110) NOT NULL,
  PRIMARY KEY (CNPJ),
  FOREIGN KEY (id_usuario) REFERENCES usuario (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS locacao (
  CPF CHAR(11) NOT NULL,
  CNPJ CHAR(14) NOT NULL,
  dia DATE NOT NULL,
  horario TIME NOT NULL,
  PRIMARY KEY (CNPJ, dia, horario),
  FOREIGN KEY (CPF) REFERENCES cliente (CPF),
  FOREIGN KEY (CNPJ) REFERENCES locadora (CNPJ)
);

/* ADMINISTRADORES */
INSERT INTO usuario (email, senha, nome, administrador, tipo_usuario) VALUES ('admin1@gmail.com', 'admin', 'Leonardo Lopes', 1, 'C');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO cliente (id_usuario, CPF, telefone, sexo, data_nascimento) VALUES (@id_usuario, '00000000001', '00000000001', 'M', '2000-04-10');

INSERT INTO usuario (email, senha, nome, administrador, tipo_usuario) VALUES ('admin2@gmail.com', 'admin', 'Locadora ADM', 1, 'L');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO locadora (id_usuario, CNPJ, cidade) VALUES (@id_usuario, '00000000000001', 'São Carlos');

INSERT INTO usuario (email, senha, nome, administrador, tipo_usuario) VALUES ('admin3@gmail.com', 'admin', 'Vitor Kasai', 1, 'C');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO cliente (id_usuario, CPF, telefone, sexo, data_nascimento) VALUES (@id_usuario, '00000000003', '00000000003', 'M', '2003-10-10');

/* CLIENTES */
INSERT INTO usuario (email, senha, nome, tipo_usuario) VALUES ('cliente1@gmail.com', 'user', 'Gabriel Ripper', 'C');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO cliente (id_usuario, CPF, telefone, sexo, data_nascimento) VALUES (@id_usuario, '00000000004', '00000000004', 'M', '2003-11-22');

INSERT INTO usuario (email, senha, nome, tipo_usuario) VALUES ('cliente2@gmail.com', 'user', 'Karen Ketlyn', 'C');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO cliente (id_usuario, CPF, telefone, sexo, data_nascimento) VALUES (@id_usuario, '00000000005', '00000000005', 'F', '2002-06-07');

INSERT INTO usuario (email, senha, nome, tipo_usuario) VALUES ('cliente3@gmail.com', 'user', 'Malu Edwards', 'C');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO cliente (id_usuario, CPF, telefone, sexo, data_nascimento) VALUES (@id_usuario, '00000000006', '00000000006', 'F', '1999-04-24');

/* LOCADORAS */
INSERT INTO usuario (email, senha, nome, tipo_usuario) VALUES ('locadora1@gmail.com', 'user', 'Locadora1', 'L');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO locadora (id_usuario, CNPJ, cidade) VALUES (@id_usuario, '00000000000002', 'São Carlos');

INSERT INTO usuario (email, senha, nome, tipo_usuario) VALUES ('locadora2@gmail.com', 'user', 'Locadora2', 'L');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO locadora (id_usuario, CNPJ, cidade) VALUES (@id_usuario, '00000000000003', 'Araras');

INSERT INTO usuario (email, senha, nome, tipo_usuario) VALUES ('locadora3@gmail.com', 'user', 'Locadora3', 'L');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO locadora (id_usuario, CNPJ, cidade) VALUES (@id_usuario, '00000000000004', 'Sorocaba');

/* LOCAÇÕES */
INSERT INTO locacao (CPF, CNPJ, dia, horario) VALUES ('00000000004', '00000000000002', '2023-10-07', '11:00:00');
INSERT INTO locacao (CPF, CNPJ, dia, horario) VALUES ('00000000005', '00000000000002', '2023-10-07', '12:00:00');
INSERT INTO locacao (CPF, CNPJ, dia, horario) VALUES ('00000000006', '00000000000002', '2023-10-07', '13:00:00');

INSERT INTO locacao (CPF, CNPJ, dia, horario) VALUES ('00000000004', '00000000000003', '2023-09-16', '18:00:00');
INSERT INTO locacao (CPF, CNPJ, dia, horario) VALUES ('00000000005', '00000000000003', '2023-09-16', '09:00:00');
INSERT INTO locacao (CPF, CNPJ, dia, horario) VALUES ('00000000006', '00000000000003', '2023-09-16', '07:00:00');

INSERT INTO locacao (CPF, CNPJ, dia, horario) VALUES ('00000000004', '00000000000004', '2023-04-19', '19:00:00');
INSERT INTO locacao (CPF, CNPJ, dia, horario) VALUES ('00000000005', '00000000000004', '2023-04-19', '20:00:00');
INSERT INTO locacao (CPF, CNPJ, dia, horario) VALUES ('00000000006', '00000000000004', '2023-04-19', '21:00:00');