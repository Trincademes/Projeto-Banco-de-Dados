SELECT 
  A.nome_aluno,
  A.matricula,
  C.nome_curso
FROM ALUNO A
JOIN CURSO C ON A.id_curso = C.id_curso;

SELECT 
  T.id_turma,
  D.nome_disciplina,
  P.nome_professor,
  S.numero AS sala,
  T.semestre,
  T.horario
FROM TURMA T
JOIN DISCIPLINA D ON T.id_disciplina = D.id_disciplina
JOIN PROFESSOR P ON T.id_professor = P.id_professor
JOIN SALA S ON T.id_sala = S.id_sala;

SELECT 
  D.nome_disciplina,
  D.carga_horaria,
  C.nome_curso
FROM DISCIPLINA D
JOIN CURSO C ON D.id_curso = C.id_curso
WHERE C.nome_curso = 'Engenharia de Software';

SELECT 
  A.nome_aluno,
  A.matricula,
  M.data_matricula,
  M.nota_final,
  M.status
FROM MATRICULA M
JOIN ALUNO A ON M.id_aluno = A.id_aluno
WHERE M.id_turma = 1;

SELECT 
  D.nome_disciplina,
  ROUND(AVG(M.nota_final), 2) AS media_final
FROM MATRICULA M
JOIN TURMA T ON M.id_turma = T.id_turma
JOIN DISCIPLINA D ON T.id_disciplina = D.id_disciplina
GROUP BY D.nome_disciplina;

SELECT 
  C.nome_curso,
  COUNT(A.id_aluno) AS total_alunos
FROM CURSO C
LEFT JOIN ALUNO A ON C.id_curso = A.id_curso
GROUP BY C.nome_curso;

SELECT 
  P.nome_professor,
  D.nome_disciplina
FROM TURMA T
JOIN PROFESSOR P ON T.id_professor = P.id_professor
JOIN DISCIPLINA D ON T.id_disciplina = D.id_disciplina
GROUP BY P.nome_professor, D.nome_disciplina
ORDER BY P.nome_professor;

SELECT 
  A.nome_aluno,
  D.nome_disciplina,
  M.nota_final,
  M.status
FROM MATRICULA M
JOIN ALUNO A ON M.id_aluno = A.id_aluno
JOIN TURMA T ON M.id_turma = T.id_turma
JOIN DISCIPLINA D ON T.id_disciplina = D.id_disciplina
WHERE A.nome_aluno = 'Lucas Pereira';
