
desc categoria;
insert into categoria(nome) values ("sapatênis");

select * from categoria;

select * from marca;

desc produto;

 insert into produto(nome, id_categoria, id_marca, descricao)
 VALUES ("Sapatênis Casual Puma",5,3, "Sapatênis Casual Puma");
 select * from produto;
 
 desc estoque;
 SELECT produto.nome, estoque.quantidade from produto join estoque
 on produto.id = estoque.id_produto;
 

UPDATE produto
SET descricao = "Tênis confortável com design moderno e amortecimento Air"
WHERE id = 123;


 
 SELECT * FROM estoque order by id_produto;
 
 SELECT * FROM estoque
where quantidade<10;
-- ATIVIDADE 4
SELECT produto.nome, categoria.nome, marca.nome, estoque.preco
FROM produto 
JOIN categoria ON produto.id_categoria = categoria.id
JOIN marca ON produto.id_marca = marca.id
JOIN estoque ON produto.id = estoque.id_produto;


SELECT p.nome, p.cor, p.tamanho, e.quantidade
FROM produto p
JOIN estoque e ON p.id = e.id_produto;

SELECT SUM(e.quantidade) AS total_pares
FROM estoque e
JOIN produto p ON e.id_produto = p.id
WHERE p.nome LIKE '%sapatênis%';







