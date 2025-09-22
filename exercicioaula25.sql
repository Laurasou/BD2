exercicio 1

DELIMITER $$

CREATE PROCEDURE listarArtistasSertanejo()
BEGIN
    SELECT nome
    FROM artista
    WHERE genero = 'Sertanejo';
END $$

DELIMITER ;

exercicio 2 
DELIMITER $$

CREATE PROCEDURE apresentacoesPorGenero(IN genero_input VARCHAR(50))
BEGIN
    SELECT a.nome AS artista_nome, p.nome AS palco_nome
    FROM apresentacao ap
    JOIN artista a ON ap.artista_id = a.id
    JOIN palco p ON ap.palco_id = p.id
    WHERE a.genero = genero_input;
END $$

DELIMITER ;

exercicio 3
DELIMITER $$

CREATE PROCEDURE adicionarNovoPalco(IN nome_palco VARCHAR(100), IN capacidade_palco INT)
BEGIN
    INSERT INTO palco (nome, capacidade)
    VALUES (nome_palco, capacidade_palco);
END $$

DELIMITER ;


exercicio 4 

DELIMITER $$

CREATE PROCEDURE totalApresentacoesPorDia(IN data_especifica DATE, OUT total_apresentacoes INT)
BEGIN
    SELECT COUNT(*) INTO total_apresentacoes
    FROM apresentacao
    WHERE DATE(horario_inicio) = data_especifica;
END $$

DELIMITER ;
