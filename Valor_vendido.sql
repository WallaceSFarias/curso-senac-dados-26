CREATE DATABASE bancosenac;
USE bancosenac;

CREATE TABLE vendas (
data DATE,
produto VARCHAR(100),
categoria VARCHAR(100),
valor_unitario DECIMAL(10,2),
quantidade INT,
cliente VARCHAR(100),
cidade VARCHAR(100),
estado VARCHAR(2)
);

SET GLOBAL local_infile = 1;

LOAD DATA INFILE 'C:/Users/wallace.farias/Documents/curso-senac-dados-26/vendas.csv'
INTO TABLE vendas
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, produto, categoria, valor_unitario,
quantidade, cliente, cidade, estado);

SELECT * FROM vendas
LIMIT 10;

SELECT produto, valor_unitario FROM vendas;

SELECT data, produto, valor_unitario, cidade FROM vendas
WHERE cidade = "Rio de Janeiro";

SELECT produto, sum(valor_unitario*quantidade) AS Valor_Vendido 
FROM vendas
WHERE categoria = "Eletrônicos"
GROUP BY produto
HAVING Valor_Vendido > 2000
ORDER BY Valor_Vendido 
DESC;