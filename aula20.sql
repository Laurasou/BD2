--  EXERCÍCIOS 
-- Crie uma view que liste todos os produtos, incluindo o nome da categoria e o nome da marca. A view deve ter as seguintes colunas: produto_id, produto_nome, categoria_nome, marca_nome.
-- Dica: Use JOINs entre as tabelas produto, categoria e marca.

USE loja;
CREATE VIEW vw_produtos_completo AS 
SELECT produto.id "Id do Produto", produto.nome "Produto",
categoria.nome "Categoria", marca.nome "Marca"
FROM produto JOIN categoria ON produto.id_categoria = categoria.id
JOIN marca ON produto.id_marca = marca.id
ORDER BY produto.id;

SELECT vw_produtos_completo;

-- exercício 2
CREATE VIEW vw_estoque_baixo AS
SELECT produto.nome, estoque.tamanho, estoque.cor, estoque.quantidade
FROM produto JOIN estoque ON produto.id = estoque.id_produto
WHERE estoque.quantidade<=5;

SELECT * FROM vw_estoque_baixo;


-- exercício 3 


