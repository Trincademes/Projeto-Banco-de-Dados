CREATE TABLE CURSO (
  id_curso SERIAL PRIMARY KEY,
  nome_curso VARCHAR(100) NOT NULL,
  duracao INTEGER
);

CREATE TABLE DISCIPLINA (
  id_disciplina SERIAL PRIMARY KEY,
  nome_disciplina VARCHAR(100) NOT NULL,
  carga_horaria INTEGER,
  id_curso INTEGER REFERENCES CURSO(id_curso)
);

CREATE TABLE PROFESSOR (
  id_professor SERIAL PRIMARY KEY,
  nome_professor VARCHAR(100) NOT NULL,
  email VARCHAR(100),
  titulacao VARCHAR(50)
);

CREATE TABLE SALA (
  id_sala SERIAL PRIMARY KEY,
  numero VARCHAR(10) NOT NULL,
  capacidade INTEGER,
  bloco VARCHAR(10)
);

CREATE TABLE TURMA (
  id_turma SERIAL PRIMARY KEY,
  semestre VARCHAR(10),
  horario VARCHAR(20),
  id_disciplina INTEGER REFERENCES DISCIPLINA(id_disciplina),
  id_sala INTEGER REFERENCES SALA(id_sala),
  id_professor INTEGER REFERENCES PROFESSOR(id_professor)
);

CREATE TABLE ALUNO (
  id_aluno SERIAL PRIMARY KEY,
  nome_aluno VARCHAR(100) NOT NULL,
  matricula VARCHAR(20) UNIQUE NOT NULL,
  email VARCHAR(100),
  id_curso INTEGER REFERENCES CURSO(id_curso)
);

CREATE TABLE MATRICULA (
  id_matricula SERIAL PRIMARY KEY,
  id_aluno INTEGER REFERENCES ALUNO(id_aluno),
  id_turma INTEGER REFERENCES TURMA(id_turma),
  data_matricula DATE,
  nota_final DECIMAL(4,2),
  status VARCHAR(20)
);
