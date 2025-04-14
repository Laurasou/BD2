use cadastro;
-- Sublinguagem DDL
show tables;


desc curso;
desc estudante;
desc estudantecursa;
-- DQL - comandos de consulta
select * from curso;
select nome, descricao from curso;
select nome, descricao from curso where nome like "$%";