use clinica_medica;
show tables;
desc pacientes;
select * from pacientes;
select * from medicos;
select * from agendamentos;
select nome,data_nascimento,telefone from pacientes 
where data_nascimento > "1990-01-01";

-- LISTAR PARA CADA CONSULTA, O NOME DO PACIENTE E TIPO.
SELECT pacientes.nome, agendamentos.data_hora,agendamentos.tipo_consulta
from pacientes left join agendamentos 
on pacientes.id  = agendamentos.paciente_id;

-- LISTAR PARA CADA CONSULTA, O NOME DO MÉDICO E TIPO.
SELECT medicos.nome, agendamentos.data_hora,agendamentos.tipo_consulta
from medicos left join agendamentos 
on medicos.id  = agendamentos.medico_id;

-- DESAFIO: LISTAR AS CONSULTAS INCLUINDO O NOME DO PACIENTE E DO MÉDICO.
select pacientes.nome, medicos.nome, agendamentos.data_hora,
agendamentos.tipo_consulta from pacientes join agendamentos
on pacientes.id = agendamentos.paciente_id join medicos
on medicos.id = agendamentos.medico_id;