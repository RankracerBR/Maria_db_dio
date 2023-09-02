-- Active: 1693418059586@@127.0.0.1@3306@viagens
USE viagens;

SELECT * FROM usuarios

SELECT * FROM reservas

SELECT * FROM destinos

SELECT * FROM usuarios
WHERE id = 1 OR nome LIKE "%Maria%"

SELECT * FROM destinos

DELETE FROM destinos
WHERE nome = "Praia do Rosa"

SELECT * FROM usuarios_nova

SELECT * FROM reservas

SELECT COUNT (*) AS total_usuarios FROM usuarios us
INNER JOIN reservas rs ON us.id = rs.id_usuario

SELECT MAX(TIMESTAMPDIFF(YEAR, data_nascimento, CURRENT_DATE())) AS maior_idade
FROM usuarios

SELECT COUNT (*) AS qtd_reservas, id_destino FROM reservas
GROUP BY id_destino
ORDER BY qtd_reservas DESC, id_destino DESC

EXPLAIN
    SELECT * FROM usuarios WHERE nome = "João Silva"

CREATE INDEX idx_nome ON usuarios (nome)