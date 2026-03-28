CREATE DATABASE banco_relacional_filmes;

USE banco_relacional_filmes;

CREATE TABLE usuarios (
usuario_id INT PRIMARY KEY,
nome VARCHAR(100),
email VARCHAR(100),
pais VARCHAR(100),
plano VARCHAR(100),
data_cadastro DATE);

CREATE TABLE filmes(
filme_id INT PRIMARY KEY,
titulo VARCHAR(100),
genero VARCHAR(100),
ano_lancamento INT,
duracao_min INT,
classificacao VARCHAR(100),
nota_imdb DECIMAL(10,1));

CREATE TABLE avaliacoes (
avaliacao_id INT PRIMARY KEY,
usuario_id INT,
filme_id INT,
nota INT,
data_avaliacao DATE,
assistiu_completo VARCHAR(1),
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (filme_id) REFERENCES filmes(filme_id)
);

SET GLOBAL local_infile = 1;

LOAD DATA INFILE "C:/Users/wallace.farias/Documents/curso-senac-dados-26/usuarios.csv"
INTO TABLE usuarios
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(usuario_id, nome, email, pais, plano, data_cadastro);

LOAD DATA INFILE "C:/Users/wallace.farias/Documents/curso-senac-dados-26/filmes.csv"
INTO TABLE filmes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(filme_id, titulo, genero ,ano_lancamento, duracao_min, classificacao, nota_imdb);

SELECT * FROM filmes;

LOAD DATA INFILE "C:/Users/wallace.farias/Documents/curso-senac-dados-26/avaliacoes.csv"
INTO TABLE avaliacoes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(avaliacao_id, usuario_id, filme_id ,nota, data_avaliacao, assistiu_completo);

