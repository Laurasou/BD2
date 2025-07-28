CREATE DATABASE if not exists loja;

use loja;
-- Tabela de categorias
CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de marcas
CREATE TABLE marca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de produtos
CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_categoria INT,
    id_marca INT,
    descricao TEXT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    FOREIGN KEY (id_marca) REFERENCES marca(id)
);

-- Tabela de estoque (relacionada a produto)
CREATE TABLE estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    tamanho VARCHAR(5),
    cor VARCHAR(30),
    preco DECIMAL(10,2),
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);

-- Tabela para armazenar o cabeçalho dos pedido
CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    cliente_nome VARCHAR(100),
    valor_total DECIMAL(10, 2) NOT NULL
);

-- Tabela para armazenar os itens de cada pedido
-- Ela conecta a tabela 'pedido' com a tabela 'estoque'
CREATE TABLE pedido_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_estoque INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id),
    FOREIGN KEY (id_estoque) REFERENCES estoque(id)
);
-- INSERINDO DADOS

-- Inserir categorias
INSERT INTO categoria (nome) VALUES 
('Tênis'), ('Sandália'), ('Bota'), ('Chinelo');

-- Inserir marcas
INSERT INTO marca (nome) VALUES 
('Nike'), ('Adidas'), ('Puma'), ('Havaianas'), ('Timberland');

-- Inserir produtos (10 produtos variados)
INSERT INTO produto (nome, id_categoria, id_marca, descricao) VALUES
('Tênis Nike Air Max', 1, 1, 'Confortável e esportivo'),
('Chinelo Havaianas Slim', 4, 4, 'Modelo feminino com tiras finas'),
('Sandália Adidas Comfort', 2, 2, 'Palmilha anatômica'),
('Bota Timberland Couro', 3, 5, 'Ideal para trilhas e frio'),
('Tênis Puma Runner', 1, 3, 'Modelo leve para corrida'),
('Sandália Nike Solarsoft', 2, 1, 'Para uso casual'),
('Tênis Adidas Street', 1, 2, 'Design urbano'),
('Bota Nike Adventure', 3, 1, 'Robusta e resistente'),
('Chinelo Puma Relax', 4, 3, 'Confortável para o dia a dia'),
('Sandália Havaianas Flat', 2, 4, 'Moderna e colorida');

-- Inserir estoque (amostra com tamanhos, cores, preços e quantidades)
INSERT INTO estoque (id_produto, tamanho, cor, preco, quantidade) VALUES
(1, '42', 'Preto', 399.90, 10),
(2, '38', 'Rosa', 49.90, 25),
(3, '40', 'Azul', 129.90, 15),
(4, '43', 'Marrom', 499.90, 5),
(5, '41', 'Cinza', 199.90, 8),
(6, '39', 'Preto', 99.90, 12),
(7, '42', 'Branco', 299.90, 6),
(8, '44', 'Preto', 449.90, 4),
(9, '40', 'Azul', 59.90, 18),
(10, '37', 'Vermelho', 69.90, 20);


-- Venda 1: 1x Tênis Nike Air Max (estoque.id = 1)
INSERT INTO pedido (id, data_pedido, cliente_nome, valor_total) VALUES (1, '2024-07-20', 'Carlos Silva', 399.90);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (1, 1, 1, 399.90);

-- Venda 2: 2x Chinelo Havaianas Slim (estoque.id = 2)
INSERT INTO pedido (id, data_pedido, cliente_nome, valor_total) VALUES (2, '2024-07-21', 'Ana Pereira', 99.80);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (2, 2, 2, 49.90);

-- Venda 3: 1x Sandália Adidas Comfort (estoque.id = 3) e 1x Chinelo Puma Relax (estoque.id = 9)
INSERT INTO pedido (id, data_pedido, cliente_nome, valor_total) VALUES (3, '2024-07-22', 'Beatriz Costa', 189.80);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (3, 3, 1, 129.90);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (3, 9, 1, 59.90);

-- Venda 4: 1x Bota Timberland Couro (estoque.id = 4)
INSERT INTO pedido (id, data_pedido, cliente_nome, valor_total) VALUES (4, '2024-08-01', 'João Mendes', 499.90);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (4, 4, 1, 499.90);

-- Venda 5: 1x Tênis Puma Runner (estoque.id = 5)
INSERT INTO pedido (id, data_pedido, cliente_nome, valor_total) VALUES (5, '2024-08-05', 'Fernanda Lima', 199.90);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (5, 5, 1, 199.90);

-- Venda 6: 1x Tênis Adidas Street (estoque.id = 7)
INSERT INTO pedido (id, data_pedido, cliente_nome, valor_total) VALUES (6, '2024-08-10', 'Lucas Martins', 299.90);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (6, 7, 1, 299.90);

-- Venda 7: 3x Sandália Havaianas Flat (estoque.id = 10)
INSERT INTO pedido (id, data_pedido, cliente_nome, valor_total) VALUES (7, '2024-08-11', 'Juliana Almeida', 209.70);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (7, 10, 3, 69.90);

-- Venda 8: 1x Sandália Nike Solarsoft (estoque.id = 6)
INSERT INTO pedido (id, data_pedido, cliente_nome, valor_total) VALUES (8, '2024-08-15', 'Ricardo Souza', 99.90);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (8, 6, 1, 99.90);

-- Venda 9: 1x Bota Nike Adventure (estoque.id = 8)
INSERT INTO pedido (id, data_pedido, cliente_nome, valor_total) VALUES (9, '2024-08-20', 'Daniela Rocha', 449.90);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (9, 8, 1, 449.90);

-- Venda 10: 1x Tênis Nike Air Max (estoque.id = 1) e 1x Chinelo Havaianas Slim (estoque.id = 2)
INSERT INTO pedido (id, data_pedido, cliente_nome, valor_total) VALUES (10, '2024-08-22', 'Carlos Silva', 449.80);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (10, 1, 1, 399.90);
INSERT INTO pedido_item (id_pedido, id_estoque, quantidade, preco_unitario) VALUES (10, 2, 1, 49.90);


