-- Cria o banco de dados se ele não existir
CREATE DATABASE IF NOT EXISTS clinica_medica;

-- Seleciona o banco de dados para uso
USE clinica_medica;

-- Tabela para armazenar informações dos pacientes
CREATE TABLE Pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    sexo CHAR(1),
    cpf VARCHAR(14) UNIQUE NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela para armazenar informações dos médicos
CREATE TABLE Medicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    especialidade VARCHAR(100),
    crm VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela para armazenar informações dos funcionários
CREATE TABLE Funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10, 2),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela para armazenar informações dos agendamentos
CREATE TABLE Agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    data_hora DATETIME NOT NULL,
    tipo_consulta VARCHAR(100),
    status VARCHAR(50),
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(id)
);

-- Tabela para armazenar o histórico médico dos pacientes
CREATE TABLE HistoricoMedico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    data_consulta DATE NOT NULL,
    diagnostico VARCHAR(255),
    tratamento VARCHAR(255),
    observacoes TEXT,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(id)
);

-- Tabela para armazenar informações sobre os medicamentos
CREATE TABLE Medicamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),
    fabricante VARCHAR(100),
    preco DECIMAL(10, 2)
);

-- Tabela para armazenar as prescrições de medicamentos
CREATE TABLE Prescricoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    historico_medico_id INT,
    medicamento_id INT,
    dosagem VARCHAR(100),
    frequencia VARCHAR(100),
    duracao VARCHAR(100),
    FOREIGN KEY (historico_medico_id) REFERENCES HistoricoMedico(id),
    FOREIGN KEY (medicamento_id) REFERENCES Medicamentos(id)
);

-- Tabela para armazenar informações sobre os exames
CREATE TABLE Exames (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),
    tipo VARCHAR(100),
    preco DECIMAL(10, 2)
);

-- Tabela para armazenar os resultados dos exames
CREATE TABLE ResultadosExames (
    id INT AUTO_INCREMENT PRIMARY KEY,
    historico_medico_id INT,
    exame_id INT,
    data_realizacao DATE NOT NULL,
    resultado TEXT,
    FOREIGN KEY (historico_medico_id) REFERENCES HistoricoMedico(id),
    FOREIGN KEY (exame_id) REFERENCES Exames(id)
);

-- Inserir dados na tabela Pacientes
INSERT INTO Pacientes (nome, data_nascimento, sexo, cpf, endereco, telefone, email) VALUES
('João Silva', '1985-05-10', 'M', '123.456.789-00', 'Rua Principal, 123, Centro', '(11) 98765-4321', 'joao.silva@email.com'),
('Maria Souza', '1992-08-15', 'F', '987.654.321-00', 'Avenida Secundária, 456, Bairro Alto', '(21) 99876-5432', 'maria.souza@email.com'),
('Carlos Oliveira', '1978-03-22', 'M', '456.789.123-00', 'Rua da Saudade, 789, Jardim Feliz', '(15) 98888-7777', 'carlos.oliveira@email.com'),
('Ana Pereira', '2001-11-05', 'F', '789.123.456-00', 'Travessa da Paz, 24, Bairro Novo', '(13) 97777-8888', 'ana.pereira@email.com'),
('Pedro Rocha', '1963-07-01', 'M', '234.567.890-00', 'Largo da Alegria, 1010, Centro', '(19) 96666-9999', 'pedro.rocha@email.com'),
('Mariana Mendes', '1989-02-28', 'F', '567.890.123-44', 'Rua das Flores, 333, Primavera', '(22) 95555-4444', 'mariana.mendes@email.com'),
('Lucas Santos', '1995-06-12', 'M', '678.901.234-55', 'Avenida dos Ipês, 444, Verão', '(24) 94444-3333', 'lucas.santos@email.com'),
('Fernanda Rocha', '1982-10-08', 'F', '789.012.345-66', 'Rua dos Lírios, 555, Outono', '(27) 93333-2222', 'fernanda.rocha@email.com'),
('Gabriel Pereira', '2004-01-18', 'M', '890.123.456-77', 'Travessa das Rosas, 666, Inverno', '(28) 92222-1111', 'gabriel.pereira@email.com'),
('Isabela Oliveira', '1998-09-25', 'F', '901.234.567-88', 'Largo do Sol, 777, Estrela', '(31) 91111-0000', 'isabela.oliveira@email.com');


-- Inserir dados na tabela Medicos
INSERT INTO Medicos (nome, especialidade, crm, telefone, email) VALUES
('Roberto Santos', 'Cardiologia', 'CRM 12345', '(11) 3333-4444', 'roberto.santos@email.com'),
('Carla Ribeiro', 'Dermatologia', 'CRM 67890', '(21) 2222-5555', 'carla.ribeiro@email.com'),
('Fernando Almeida', 'Ortopedia', 'CRM 24680', '(15) 4444-6666', 'fernando.almeida@email.com'),
('Juliana Moraes', 'Pediatria', 'CRM 13579', '(13) 5555-7777', 'juliana.moraes@email.com'),
('Gustavo Lima', 'Ginecologia', 'CRM 98765', '(19) 6666-8888', 'gustavo.lima@email.com');

-- Inserir dados na tabela Funcionarios
INSERT INTO Funcionarios (nome, cargo, salario, telefone, email) VALUES
('Mariana Oliveira', 'Recepcionista', 1200.00, '(11) 5678-9012', 'mariana.oliveira@email.com'),
('Paulo Souza', 'Enfermeiro', 1800.00, '(21) 6789-0123', 'paulo.souza@email.com'),
('Rafaela Pereira', 'Administrador', 2500.00, '(15) 7890-1234', 'rafaela.pereira@email.com'),
('Tiago Santos', 'Técnico de Radiologia', 2000.00, '(13) 8901-2345', 'tiago.santos@email.com'),
('Camila Rocha', 'Auxiliar de Limpeza', 1000.00, '(19) 9012-3456', 'camila.rocha@email.com');

-- Inserir dados na tabela Agendamentos
INSERT INTO Agendamentos (paciente_id, medico_id, data_hora, tipo_consulta, status) VALUES
(1, 1, '2024-03-10 10:00:00', 'Consulta de rotina', 'Agendado'),
(2, 2, '2024-03-12 14:30:00', 'Exame dermatológico', 'Agendado'),
(3, 3, '2024-03-15 09:00:00', 'Consulta ortopédica', 'Agendado'),
(4, 4, '2024-03-11 11:00:00', 'Consulta pediátrica', 'Agendado'),
(5, 5, '2024-03-13 16:00:00', 'Consulta ginecológica', 'Agendado');

-- Inserir dados na tabela HistoricoMedico
INSERT INTO HistoricoMedico (paciente_id, medico_id, data_consulta, diagnostico, tratamento, observacoes) VALUES
(1, 1, '2024-01-15', 'Checkup anual', 'Recomendação de exercícios e dieta balanceada', 'Paciente sem queixas'),
(2, 2, '2024-02-20', 'Dermatite leve', 'Uso de pomada hidratante', 'Retornar em 1 mês para avaliação'),
(3, 3, '2024-03-01', 'Entorse no tornozelo', 'Imobilização e fisioterapia', 'Paciente em recuperação'),
(4, 4, '2024-02-10', 'Resfriado comum', 'Repouso e medicação para sintomas', 'Paciente com febre baixa'),
(5, 5, '2024-03-05', 'Exame de rotina', 'Resultados normais', 'Próxima consulta em 6 meses');

-- Inserir dados na tabela Medicamentos
INSERT INTO Medicamentos (nome, descricao, fabricante, preco) VALUES
('Ibuprofeno', 'Analgésico e anti-inflamatório', 'Genérico', 10.50),
('Amoxicilina', 'Antibiótico', 'EMS', 15.75),
('Dipirona', 'Analgésico e antitérmico', 'Medley', 8.20),
('Loratadina', 'Antialérgico', 'Eurofarma', 12.90),
('Omeprazol', 'Protetor gástrico', 'Aché', 20.00);

-- Inserir dados na tabela Prescricoes
INSERT INTO Prescricoes (historico_medico_id, medicamento_id, dosagem, frequencia, duracao) VALUES
(1, 1, '200mg', 'A cada 6 horas', '5 dias'),
(2, 3, '1g', 'A cada 8 horas', '7 dias'),
(3, 1, '400mg', 'A cada 12 horas', '10 dias'),
(4, 2, '500mg', 'A cada 8 horas', '7 dias'),
(5, 5, '20mg', 'Uma vez ao dia', '30 dias');

-- Inserir dados na tabela Exames
INSERT INTO Exames (nome, descricao, tipo, preco) VALUES
('Hemograma completo', 'Exame de sangue geral', 'Laboratorial', 50.00),
('Raio-X do tórax', 'Radiografia do peito', 'Imagem', 80.00),
('Ecocardiograma', 'Exame do coração por ultrassom', 'Imagem', 150.00),
('Teste de alergia', 'Identificação de alergias', 'Laboratorial', 100.00),
('Papanicolau', 'Exame preventivo ginecológico', 'Laboratorial', 70.00);

-- Inserir dados na tabela ResultadosExames
INSERT INTO ResultadosExames (historico_medico_id, exame_id, data_realizacao, resultado) VALUES
(1, 1, '2024-01-15', 'Hemograma normal'),
(2, 4, '2024-02-20', 'Alergia a ácaros'),
(3, 2, '2024-03-01', 'Sem fraturas'),
(4, 1, '2024-02-10', 'Leucócitos elevados'),
(5, 5, '2024-03-05', 'Citologia normal');
