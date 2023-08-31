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