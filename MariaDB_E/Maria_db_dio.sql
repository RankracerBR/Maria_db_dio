-- Active: 1693418059586@@127.0.0.1@3306@viagens
USE viagens;

CREATE TABLE usuarios(
        id INT, 
        nome VARCHAR(255) NOT NULL COMMENT 'Nome do usuario',
        email VARCHAR(100) NOT NULL UNIQUE COMMENT 'E-mail do usuario',
        endereco VARCHAR(50) NOT NULL COMMENT 'Endereco do usuario',
        data_nascimento DATE NOT NULL COMMENT 'Data de nascimento')

CREATE TABLE viagens.destinos(
        id INT,
        nome VARCHAR(255) NOT NULL UNIQUE COMMENT 'Nome do destino',
        descricao VARCHAR(255) NOT NULL COMMENT 'Descrição do destino')

CREATE TABLE viagens.reservas(
        id INT COMMENT 'Identificador único da reserva',
        id_usuario INT COMMENT 'Referência ao ID do usuário que fez a reserva',
        id_destino INT COMMENT 'Referência ao ID do destino da reserva',
        data DATE COMMENT 'Data da reserva',
        status VARCHAR(255) DEFAULT 'Pendente' COMMENT 'Status da reserva(confirmada, pendente, cancelada, etc.)')

INSERT INTO usuarios (id, nome, email, data_nascimento, endereco) VALUES (1, "Augusto", "teste@teste.com", "2003-08-25", "Rua josefa taveiro")

INSERT INTO usuarios (id, nome, email, data_nascimento, endereco) VALUES (2, "Julia mon amour", "jujuba@jujuba.com", "2003-02-18", "Rua dantas")

INSERT INTO destinoS(id, nome, descricao) VALUES (1,'Cabo Branco','Linda Praia :3')

INSERT INTO reservas (id, id_usuario, id_destino, status, data) VALUES (1, 1,1, 'pendente', '2023-11-11')

INSERT INTO viagens.reservas(id, id_usuario)

UPDATE usuarios
SET id = 4 
WHERE email = "teste@teste.com"

CREATE TABLE usuarios_nova(
        id INT,
        nome VARCHAR(255) NOT NULL COMMENT 'Nome do usuário',
        email VARCHAR(255) NOT NULL COMMENT 'Endereço de e-mail do usuário',
        data_nascimento DATE NOT NULL COMMENT 'Data de nascimento do usuário',
        endereco VARCHAR(100) NOT NULL COMMENT 'Endereço do Cliente'
)

INSERT INTO usuarios_nova (id, nome, email, endereco, data_nascimento)
SELECT id, nome, email, endereco, data_nascimento
FROM usuarios

DROP TABLE usuarios

ALTER TABLE usuarios_nova RENAME usuarios

ALTER TABLE usuarios MODIFY COLUMN endereco VARCHAR(150)

ALTER TABLE usuarios
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id)

ALTER TABLE destinos
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (ID)

ALTER TABLE reservas
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id)

ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_destinos
FOREIGN KEY (id_destino) REFERENCES destinos (id);

INSERT INTO reservas (id_usuario, id_destino, data) VALUES(1, 1, "2023-11-11")

ALTER TABLE reservas
ADD CONSTRAINT fk_destinos
FOREIGN KEY (id_destino) REFERENCES destinos (id)
ON DELETE CASCADE

DELETE FROM destinos WHERE id = 1

ALTER TABLE usuarios
ADD rua VARCHAR(100),
ADD numero VARCHAR(10),
ADD cidade VARCHAR(50),
ADD estado VARCHAR(20)

ALTER TABLE usuarios MODIFY COLUMN numero VARCHAR(255); -- Change the length as needed


UPDATE usuarios
SET rua = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 1), ',', -1),
    numero = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 2), ',', -1), -- Truncate to 255 characters
    cidade = SUBSTRING_INDEX(SUBSTRING_INDEX(endereco, ',', 3), ',', -1),
    estado = SUBSTRING_INDEX(endereco, ',', -1);

ALTER TABLE usuarios
DROP COLUMN endereco;

SELECT * FROM usuarios us
INNER JOIN reservas rs ON us.id = rs.id_usuario

SELECT * FROM usuarios us 
INNER JOIN reservas rs ON us.id = rs.id_usuario
INNER JOIN destinos ds ON rs.id_destino = ds.id;

INSERT INTO usuarios(nome, email, data_nascimento, rua, numero, cidade, estado) VALUES ("Sem reservas", "dio@teste.com", "1992-05-05", "rua", "12", "cidade", "estado")

SELECT * FROM usuarios us
INNER JOIN reservas rs ON us.id = rs.id_usuario

INSERT INTO destinos (nome, descricao) VALUES ("Destino sem reservas","Descricao")

SELECT * FROM reservas rs
RIGHT JOIN destinos ds 
ON rs.id_destino = ds.id

SELECT * FROM destinos 
WHERE id NOT IN (SELECT id_destino FROM reservas)

SELECT * FROM usuarios
WHERE id NOT IN (SELECT id_usuario FROM reservas)

SELECT nome, (SELECT COUNT (*) FROM reservas WHERE id_usuario = usuarios.id) AS total_reservas FROM usuarios


INSERT INTO reservas (id_usuario, id_destino) VALUES (1,3)

INSERT INTO usuarios (nome, email, data_nascimento, rua) VALUES
('João Silva', 'joao.silva@example.com', '1990-01-01', 'Rua A'),
('Maria Santos', 'maria.santos@example.com', '1992-03-15', 'Rua B'),
('Pedro Almeida', 'pedro.almeida@example.com', '1985-07-10', 'Rua C'),
('Ana Oliveira', 'ana.oliveira@example.com', '1998-12-25', 'Rua D'),
('Carlos Pereira', 'carlos.pereira@example.com', '1991-06-05', 'Rua E'),
('Laura Mendes', 'laura.mendes@example.com', '1994-09-12', 'Rua F'),
('Fernando Santos', 'fernando.santos@example.com', '1988-02-20', 'Rua G'),
('Mariana Costa', 'mariana.costa@example.com', '1997-11-30', 'Rua H'),
('Ricardo Rodrigues', 'ricardo.rodrigues@example.com', '1993-04-18', 'Rua I'),
('Camila Alves', 'camila.alves@example.com', '1989-08-08', 'Rua J'),
('Bruno Carvalho', 'bruno.carvalho@example.com', '1995-03-25', 'Rua K'),
('Amanda Silva', 'amanda.silva@example.com', '1996-12-02', 'Rua L'),
('Paulo Mendonça', 'paulo.mendonca@example.com', '1999-07-20', 'Rua M'),
('Larissa Oliveira', 'larissa.oliveira@example.com', '1987-10-15', 'Rua N'),
('Fernanda Sousa', 'fernanda.sousa@example.com', '1992-05-08', 'Rua O'),
('Gustavo Santos', 'gustavo.santos@example.com', '1993-09-18', 'Rua P'),
('Helena Costa', 'helena.costa@example.com', '1998-02-22', 'Rua Q'),
('Diego Almeida', 'diego.almeida@example.com', '1991-11-27', 'Rua R'),
('Juliana Lima', 'juliana.lima@example.com', '1997-04-05', 'Rua S'),
('Rafaela Silva', 'rafaela.silva@example.com', '1996-01-10', 'Rua T'),
('Lucas Pereira', 'lucas.pereira@example.com', '1986-08-30', 'Rua U'),
('Fábio Rodrigues', 'fabio.rodrigues@example.com', '1989-03-12', 'Rua V'),
('Isabela Santos', 'isabela.santos@example.com', '1994-12-07', 'Rua W'),
('André Alves', 'andre.alves@example.com', '1995-09-28', 'Rua X'),
('Clara Carvalho', 'clara.carvalho@example.com', '1990-02-15', 'Rua Y'),
('Roberto Mendes', 'roberto.mendes@example.com', '1992-07-21', 'Rua Z'),
('Mariana Oliveira', 'mariana.oliveira@example.com', '1997-05-03', 'Av. A'),
('Gustavo Costa', 'gustavo.costa@example.com', '1998-11-16', 'Av. B'),
('Lara Sousa', 'lara.sousa@example.com', '1993-06-09', 'Av. C'),
('Pedro Lima', 'pedro.lima@example.com', '1996-09-27', 'Av. D');