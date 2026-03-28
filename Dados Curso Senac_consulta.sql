USE banco_relacional_filmes;

SELECT * FROM usuarios;

SELECT * FROM filmes;

SELECT * FROM avaliacoes;

## Consulta 1
SELECT usuarios.nome, filmes.titulo, avaliacoes.nota
FROM avaliacoes
INNER JOIN usuarios ON usuarios.usuario_id = avaliacoes.usuario_id
INNER JOIN filmes ON filmes.filme_id = avaliacoes.filme_id
ORDER BY usuarios.nome;

## Consulta 2
SELECT filmes.titulo, avaliacoes.nota, usuarios.nome
FROM avaliacoes
INNER JOIN filmes ON filmes.filme_id = avaliacoes.filme_id
INNER JOIN usuarios ON usuarios.usuario_id = avaliacoes.usuario_id
ORDER BY filmes.titulo;

## Consulta 3
SELECT filmes.titulo, avaliacoes.nota, usuarios.nome
FROM avaliacoes
INNER JOIN filmes ON filmes.filme_id = avaliacoes.filme_id
INNER JOIN usuarios ON usuarios.usuario_id = avaliacoes.usuario_id
WHERE avaliacoes.nota = 5;

## Consulta 4
SELECT avaliacoes.usuario_id, usuarios.nome, COUNT(avaliacoes.avaliacao_id) AS total_avaliacoes
FROM avaliacoes
INNER JOIN usuarios ON usuarios.usuario_id = avaliacoes.usuario_id
GROUP BY avaliacoes.usuario_id, usuarios.nome
ORDER BY total_avaliacoes DESC;

## Consulta 5
SELECT filmes.titulo, AVG(avaliacoes.nota) as Nota_Média
FROM filmes
JOIN avaliacoes ON filmes.filme_id = avaliacoes.filme_id
GROUP BY filmes.titulo;