**Projeto Final - Banco de Dados Relacional**

**Tema:** Sistema Acadêmico Universitário

---

# Introdução

Este projeto tem como objetivo desenvolver um sistema de banco de dados relacional para gerenciar informações acadêmicas de uma instituição de ensino superior. O sistema foi concebido para registrar e organizar dados de cursos, disciplinas, professores, salas, turmas e alunos. Além disso, permite o controle de matrículas dos alunos em turmas, com possibilidade de acompanhamento de notas e situações acadêmicas.

# Objetivo do Projeto

Implementar e documentar um banco de dados relacional completo utilizando PostgreSQL, aplicando as técnicas de modelagem conceitual, modelagem lógica, normalização e execução de scripts SQL (DDL, DML e DQL).

# Descrição Geral

O banco de dados proposto contempla as seguintes entidades: CURSO, DISCIPLINA, PROFESSOR, SALA, TURMA, ALUNO e MATRÍCULA. A estrutura permite o cadastro de informações completas e a geração de relatórios através de consultas SQL.

---

# Modelagem Conceitual

## Entidades e Atributos

* **CURSO:** id\_curso (PK), nome\_curso, duracao
* **DISCIPLINA:** id\_disciplina (PK), nome\_disciplina, carga\_horaria, id\_curso (FK)
* **PROFESSOR:** id\_professor (PK), nome\_professor, email, titulacao
* **SALA:** id\_sala (PK), numero, capacidade, bloco
* **TURMA:** id\_turma (PK), semestre, horario, id\_disciplina (FK), id\_sala (FK), id\_professor (FK)
* **ALUNO:** id\_aluno (PK), nome\_aluno, matricula, email, id\_curso (FK)
* **MATRÍCULA:** id\_matricula (PK), id\_aluno (FK), id\_turma (FK), data\_matricula, nota\_final, status

## Relacionamentos

* CURSO possui várias DISCIPLINAS
* DISCIPLINA pode ser ofertada em várias TURMAS
* TURMA ocorre em uma SALA e é ministrada por um PROFESSOR
* ALUNO pertence a um CURSO
* ALUNO se matricula em várias TURMAS (relacionamento muitos-para-muitos via MATRÍCULA)

---

# Modelagem Lógica

As entidades foram convertidas para tabelas relacionais com chaves primárias e estrangeiras:

### CURSO

* id\_curso (PK)
* nome\_curso
* duracao

### DISCIPLINA

* id\_disciplina (PK)
* nome\_disciplina
* carga\_horaria
* id\_curso (FK)

### PROFESSOR

* id\_professor (PK)
* nome\_professor
* email
* titulacao

### SALA

* id\_sala (PK)
* numero
* capacidade
* bloco

### TURMA

* id\_turma (PK)
* semestre
* horario
* id\_disciplina (FK)
* id\_sala (FK)
* id\_professor (FK)

### ALUNO

* id\_aluno (PK)
* nome\_aluno
* matricula
* email
* id\_curso (FK)

### MATRÍCULA

* id\_matricula (PK)
* id\_aluno (FK)
* id\_turma (FK)
* data\_matricula
* nota\_final
* status

---

# Normalização

### 1ª Forma Normal (1FN)

Todas as tabelas contêm apenas atributos atômicos, sem grupos repetitivos ou listas de valores.

### 2ª Forma Normal (2FN)

Não existem dependências parciais. A tabela MATRÍCULA utiliza chave artificial, evitando chaves compostas.

### 3ª Forma Normal (3FN)

Não existem dependências transitivas. Os atributos não-chave dependem apenas da chave primária de suas tabelas.

---

# Scripts SQL

## DDL (Data Definition Language)

```sql
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
```

## DML (Data Manipulation Language)

```sql
-- Inserindo dados exemplo
INSERT INTO CURSO (nome_curso, duracao) VALUES ('Sistemas de Informação', 8);
INSERT INTO DISCIPLINA (nome_disciplina, carga_horaria, id_curso) VALUES ('Banco de Dados', 60, 1);
INSERT INTO PROFESSOR (nome_professor, email, titulacao) VALUES ('João da Silva', 'joao@faculdade.edu', 'Mestre');
INSERT INTO SALA (numero, capacidade, bloco) VALUES ('101', 40, 'A');
INSERT INTO TURMA (semestre, horario, id_disciplina, id_sala, id_professor) VALUES ('2024.1', '19h-22h', 1, 1, 1);
INSERT INTO ALUNO (nome_aluno, matricula, email, id_curso) VALUES ('Maria Oliveira', '202412345', 'maria@aluno.edu', 1);
INSERT INTO MATRICULA (id_aluno, id_turma, data_matricula, nota_final, status) VALUES (1, 1, '2024-03-01', 9.5, 'Aprovado');
```

## DQL (Data Query Language)

```sql
-- Consultar todos os alunos e suas respectivas turmas
SELECT a.nome_aluno, t.semestre, d.nome_disciplina
FROM ALUNO a
JOIN MATRICULA m ON a.id_aluno = m.id_aluno
JOIN TURMA t ON t.id_turma = m.id_turma
JOIN DISCIPLINA d ON t.id_disciplina = d.id_disciplina;

-- Listar todas as disciplinas de um curso
SELECT d.nome_disciplina
FROM DISCIPLINA d
JOIN CURSO c ON d.id_curso = c.id_curso
WHERE c.nome_curso = 'Sistemas de Informação';
```

---

# Conclusão

O banco de dados acadêmico foi projetado de forma eficiente, seguindo os princípios de modelagem e normalização. A estrutura permite escalabilidade e manutenção fácil, podendo ser expandida para futuras funcionalidades, como histórico escolar, controle financeiro e gestão de calendário acadêmico.

---

# Referências

* Elmasri, R.; Navathe, S. B. "Sistemas de Banco de Dados".
* Date, C. J. "Introdução a Sistemas de Bancos de Dados".
* Documentação Oficial PostgreSQL
* ABNT NBR 6023:2018, 6027:2012 e 14724:2011
