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