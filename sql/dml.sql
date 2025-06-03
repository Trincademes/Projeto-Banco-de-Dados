INSERT INTO CURSO (nome_curso, duracao) VALUES 
('Engenharia de Software', 8),     
('Ciência da Computação', 8),      
('Sistemas de Informação', 8);     

SELECT * FROM CURSO;

INSERT INTO PROFESSOR (nome_professor, email, titulacao) VALUES 
('Ana Paula Costa', 'ana.costa@faculdade.edu', 'Mestre'),     
('Carlos Eduardo Lima', 'carlos.lima@faculdade.edu', 'Doutor'), 
('Fernanda Ribeiro', 'fernanda.ribeiro@faculdade.edu', 'Especialista'); 

SELECT * FROM PROFESSOR;

INSERT INTO SALA (numero, capacidade, bloco) VALUES 
('101', 40, 'A'),    
('202', 35, 'B'),    
('303', 50, 'C');    

SELECT * FROM SALA;

INSERT INTO DISCIPLINA (nome_disciplina, carga_horaria, id_curso) VALUES 
('Algoritmos e Lógica de Programação', 60, 1), 
('Banco de Dados I', 60, 1),                   
('Estrutura de Dados', 60, 2),                 
('Engenharia de Software I', 60, 1),          
('Redes de Computadores', 60, 3);             

SELECT * FROM DISCIPLINA;

INSERT INTO TURMA (semestre, horario, id_disciplina, id_sala, id_professor) VALUES 
('2024.1', 'Seg e Qua 08:00-10:00', 1, 1, 1),  
('2024.1', 'Ter e Qui 10:00-12:00', 2, 2, 2),  
('2024.1', 'Seg e Qua 14:00-16:00', 3, 3, 3),  
('2024.1', 'Ter e Qui 08:00-10:00', 4, 1, 1);  

SELECT * FROM TURMA;

INSERT INTO ALUNO (nome_aluno, matricula, email, id_curso) VALUES 
('Lucas Pereira', '20241001', 'lucas.pereira@aluno.edu', 1),   
('Juliana Matos', '20241002', 'juliana.matos@aluno.edu', 1),   
('Rafael Souza', '20241003', 'rafael.souza@aluno.edu', 2),     
('Camila Lima', '20241004', 'camila.lima@aluno.edu', 3);       

SELECT * FROM ALUNO;

INSERT INTO MATRICULA (id_aluno, id_turma, data_matricula, nota_final, status) VALUES 
(1, 1, '2024-01-10', 8.5, 'Aprovado'),
(1, 2, '2024-01-10', 7.2, 'Aprovado'),
(2, 1, '2024-01-10', 6.0, 'Aprovado'),
(3, 3, '2024-01-12', 5.0, 'Reprovado'),
(4, 4, '2024-01-12', 9.1, 'Aprovado');

SELECT * FROM MATRICULA;
