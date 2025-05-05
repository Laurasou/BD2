USE clinica_medica;
SELECT * FROM agendamentos;
SELECT count(id) as "Total de Pacientes" from pacientes;

DESC medicos;
 SELECT * from medicos;
INSERT INTO medicos(nome,especialidade,crm,email)
VALUES ("Crispiano orispildo","pediatria","CRM 55667","crispildo@gmail.com");
SELECT especialidade,count(id) from medicos
where especialidade = "pediatria";
SELECT especialidade,count(id) as "Quantidade" from medicos
group by especialidade;

desc agendamentos;
SELECT nome, YEAR(CURDATE()) - YEAR(data_nascimento) as "idades"
from pacientes;
SELECT AVG(YEAR(CURDATE()) - YEAR(data_nascimento)) "idade média"
from pacientes;

SELECT medicos.nome, count(agendamentos.id) from
medicos left join agendamentos on medicos.id = agendamentos.medico_id
group by medicos.nome;
-- CADASTRANDO NOVA CONSULTA (AGENDAMENTOS) PARA UM MEDICO
INSERT INTO agendamentos(pacientes_id, medicos_id, data_hora, tipo_consulta, status)
VALUES (1,1, "2025-05-05 10:00", "consulta de rotina","realizada");

SELECT medicos.nomes, COUNT(agendamentos.id) as tot_consultas from 
medicos join agendamentos on medicos.id = agendamentos.medico_id
and count(agendamentos.id) = MAX(count(agendamentos.id));