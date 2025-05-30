BEGIN;

INSERT INTO MATRICULA (id_aluno, id_turma, data_matricula, nota_final, status)
VALUES (2, 2, '2024-02-05', NULL, 'Cursando');

SAVEPOINT antes_do_status;

UPDATE MATRICULA
SET status = 'Aprovado', nota_final = 7.5
WHERE id_aluno = 2 AND id_turma = 2;

ROLLBACK TO antes_do_status;

COMMIT;
