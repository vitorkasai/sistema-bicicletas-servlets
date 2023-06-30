/* ADMINISTRADORES */
INSERT INTO usuario (email, senha, nome, administrador, tipo_usuario) VALUES ('admin1@gmail.com', 'admin', 'Leonardo Lopes', "1", 'C');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO cliente (id_usuario, CPF, telefone, sexo, data_nascimento) VALUES (@id_usuario, '00000000001', '00000000001', 'M', '2000-04-10');

INSERT INTO usuario (email, senha, nome, administrador, tipo_usuario) VALUES ('admin2@gmail.com', 'admin', 'Locadora ADM', "1", 'L');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO locadora (id_usuario, CNPJ, cidade) VALUES (@id_usuario, '00000000000001', 'São Carlos');

INSERT INTO usuario (email, senha, nome, administrador, tipo_usuario) VALUES ('admin3@gmail.com', 'admin', 'Vitor Kasai', "1", 'C');
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

INSERT INTO usuario (email, senha, nome, tipo_usuario) VALUES ('locadora4@gmail.com', 'user', 'Locadora4', 'L');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO locadora (id_usuario, CNPJ, cidade) VALUES (@id_usuario, '00000000000005', 'Lins');

INSERT INTO usuario (email, senha, nome, tipo_usuario) VALUES ('locadora5@gmail.com', 'user', 'Locadora5', 'L');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO locadora (id_usuario, CNPJ, cidade) VALUES (@id_usuario, '00000000000006', 'Sorocaba');

INSERT INTO usuario (email, senha, nome, tipo_usuario) VALUES ('locadora6@gmail.com', 'user', 'Locadora6', 'L');
SET @id_usuario = LAST_INSERT_ID();
INSERT INTO locadora (id_usuario, CNPJ, cidade) VALUES (@id_usuario, '00000000000007', 'Sorocaba');



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