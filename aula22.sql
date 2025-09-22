use loja;

DELIMITER $$
CREATE PROCEDURE estoque()
BEGIN
	SELECT produto.nome, estoque.tamanho,
    estoque.cor, estoque.preco, estoque.quantidade
    FROM produto JOIN estoque
    ON produto.id = estoque.id_produto
    ORDER BY produto.nome;

END $$
DELIMITER ;

call estoque;
DELIMITER $$
CREATE PROCEDURE produtoPorQuantidade(IN qtde int)
BEGIN
	SELECT produto.nome as produto, estoque.tamanho,
    estoque.cor, estoque.preco, estoque.quantidade
    FROM produto JOIN estoque
    ON produto.id = estoque.id_produto
    WHERE estoque.quantidade <= qtde
    ORDER BY produto.nome;

END $$
DELIMITER ;

call ProdutoPorQuantidade(6);

-- CRIAR UM SP PARA MOSTRAR O NOME E A DESCRIÇAO DOS PRODUTOS
-- da marca informada como parametro pelo usuario.



