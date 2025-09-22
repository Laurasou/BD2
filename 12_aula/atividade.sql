USE clinica_medica;
-- RESOLVER O EXERCICIO 1
-- ULTILIZAR A FUNÇAO SUM() PARA OMAR OS MEDICAMENTOS (PRECO).
SELECT pacientes.nome, SUM(medicamentos.preco) as "Gastos com Medicamentos"
FROM pacientes JOIN historicamedico
ON pacientes.id = historicomedico.paciente_id JOIN prescricoes
ON historicomedico.id = prescricoes.historico_medico_id JOIN medicamentos
ON medicamentos.id = precricoes.medicamento_id
GROUP BY pacientes.nome;

-- MOSTRAR O TOTAL DE PRECRIÇÕES POR PACIENTE
SELECT prescricoes.id "ID_Prescrição", medicamentos.nome "Medicamento"
FROM pacientes JOIN medicamentos
ON prescricoes.medicamento_id = medicamentos.id;

