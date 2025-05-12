USE clinica_medica;
SELECT pacientes.nome, SUM(medicamentos.preco) as "Gastos com medicamentos"
FROM pacientes JOIN historicomedico
ON pacientes.id = historicomedico.paciente_id JOIN prescricoes
ON historicomedico.id = prescricoes.historico_medico_id JOIN medicamentos
ON medicamentos.id = prescricoes.medicamento_id
GROUP BY pacientes.nome;
-- MOSTRAR O TOTAL DE PRESCRICOES POR PACIENTES --
SELECT pacientes.nome, COUNT(prescricoes.id)
FROM pacientes JOIN historicomedico
ON pacientes.id = historicomedico.paciente_id JOIN prescricoes
ON historicomedico.id = prescricoes.historico_medico_id JOIN medicamentos
GROUP BY pacientes.nome;
-- MOSTRAR OS MEDICAMENTOS DE CADA PRESCRIÇÃO --
SELECT prescricoes.id "Prescrição", medicamentos.nome "Medicamento"
FROM prescricoes JOIN medicamentos
ON prescricoes.medicamento_id = medicamentos.id;