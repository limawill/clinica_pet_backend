CREATE TABLE Agenda (
  id SERIAL PRIMARY KEY,
  data DATE NOT NULL,
  horario VARCHAR(50) NOT NULL,
  disponibilidade BOOLEAN NOT NULL
);

CREATE TABLE Atendimento (
  id SERIAL PRIMARY KEY,
  tipo_de_atendimento VARCHAR(100) NOT NULL,
  valor NUMERIC(10, 2) NOT NULL,  -- Usando NUMERIC para valores monetários
  data_atendimento DATE NOT NULL,
  agenda_data DATE,
  funcionario_id INT NOT NULL,
  agenda_id INT NOT NULL,
  paciente_id INT NOT NULL
);

CREATE TABLE Cliente (
  cpf TEXT PRIMARY KEY,  -- CPF como chave primária
  nome TEXT NOT NULL,
  endereco TEXT NOT NULL,
  telefone TEXT NOT NULL,
  email TEXT NOT NULL
);

CREATE TABLE Funcionario (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  especialidade VARCHAR(100) NOT NULL,
  crmv INT,
  telefone VARCHAR(20) NOT NULL,
  atendimento BOOLEAN NOT NULL
);

CREATE TABLE Paciente (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  especie VARCHAR(50) NOT NULL,
  raca VARCHAR(100) NOT NULL,
  peso FLOAT,
  cliente_cpf TEXT NOT NULL,
  CONSTRAINT fk_paciente_cliente FOREIGN KEY (cliente_cpf) REFERENCES Cliente (cpf)
);

-- Definindo as chaves estrangeiras
ALTER TABLE Atendimento
  ADD CONSTRAINT fk_atendimento_agenda
    FOREIGN KEY (agenda_id) REFERENCES Agenda (id);

ALTER TABLE Atendimento
  ADD CONSTRAINT fk_atendimento_funcionario
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario (id);

ALTER TABLE Atendimento
  ADD CONSTRAINT fk_atendimento_paciente
    FOREIGN KEY (paciente_id) REFERENCES Paciente (id);
