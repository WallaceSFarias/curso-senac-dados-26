CREATE DATABASE bancosenac2;

USE bancosenac2;

CREATE TABLE vendas (
data           DATE,
produto        VARCHAR(100),
categoria      VARCHAR(100),
valor_unitario DECIMAL(10,2),
quantidade     INT,
cliente        VARCHAR(100),
cidade         VARCHAR(100),
estado         VARCHAR(2)
);

SET GLOBAL local_infile = 1;

LOAD DATA INFILE "C:/Users/wallace.farias/Documents/curso-senac-dados-26/vendas.csv"
INTO TABLE vendas
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(data, produto, categoria, valor_unitario,
quantidade, cliente, cidade, estado);

SELECT * FROM vendas;

SELECT produto, valor_unitario, quantidade, categoria FROM vendas
WHERE categoria = "Informática";

SELECT produto, valor_unitario, quantidade, cidade FROM vendas
WHERE cidade = "Rio de Janeiro";

SELECT produto, valor_unitario FROM vendas
WHERE valor_unitario > 500;

SELECT * FROM vendas
WHERE cliente = "Ana Souza";

SELECT * FROM vendas
WHERE categoria = "Vestuário" and estado = "PR"; 

SELECT produto, categoria, valor_unitario, estado FROM vendas
WHERE estado = "SP";

SELECT *, (valor_unitario*quantidade) AS valor_total_da_venda
FROM vendas;

SELECT produto, cliente , quantidade, (valor_unitario*quantidade) AS valor_total_da_venda FROM vendas
WHERE quantidade > 1;

SELECT *, (valor_unitario * quantidade) AS valor_total_da_venda
FROM vendas
WHERE (valor_unitario * quantidade) > 1000;

SELECT *, (valor_unitario * quantidade) AS valor_total_da_venda FROM vendas
WHERE categoria = "Eletrônicos";

SELECT *, (valor_unitario * quantidade) AS valor_total_da_venda FROM vendas
WHERE (valor_unitario * quantidade) > 2000;

SELECT categoria , sum(valor_unitario * quantidade) AS valor_total_agrupado 
FROM vendas
GROUP BY categoria
ORDER BY valor_total_agrupado
DESC;