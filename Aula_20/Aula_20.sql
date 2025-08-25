use loja;

DELIMITER $$
CREATE PROCEDURE produtoPorQuantidade(IN qtde int)
BEGIN
	SELECT produto.nome, estoque.tamanho,
    estoque.cor, estoque.preco, estoque.quantidade
   FROM produto JOIN estoque
   ON produto.id = estoque.id_produto
   WHERE estoque.quantidade <= qtde
   ORDER BY produto.nome;
END $$
DELIMITER ;
call produtoPorQuantidade(6);

DELIMITER $$

CREATE PROCEDURE GetProdutosPorMarca(IN marca_id INT)
BEGIN
    SELECT p.nome, p.descricao
    FROM produto p
    JOIN marca m ON p.id_marca = m.id
    WHERE m.id = marca_id;
END$$

DELIMITER ;
CALL GetProdutosPorMarca(1);
