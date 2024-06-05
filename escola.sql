
CREATE DATABASE ESCOLA;

USE ESCOLA;

CREATE TABLE ALUNO (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255),
    Matricula INT UNIQUE,
    Email VARCHAR(255),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20)
);

INSERT INTO ALUNO (Nome, Matricula, Email, Endereco, Telefone) VALUES
('João Carlos', 1234, 'Jcarlos@gmail.com', 'Rua 13 de maio', '(11)7825-4489'),
('José Vitor', 2345, 'Jvitor@gmail.com', 'Rua da Saudade', '(11)7825-6589'),
('Paulo André', 3456, 'Pandr@gmail.com', 'Rua do Sol', '(11)7825-4495');

CREATE TABLE EMPRESTIMOS (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    DataHora DATETIME,
    MatriculaAluno INT,
    DataDevolucao DATE,
    FOREIGN KEY (MatriculaAluno) REFERENCES ALUNO(Matricula)
);

INSERT INTO EMPRESTIMOS (DataHora, MatriculaAluno, DataDevolucao) VALUES
('2022-03-12 15:25:00', 1234, '2022-03-15'),
('2022-03-15 14:32:00', 3456, '2022-03-18'),
('2022-03-20 03:51:00', 2345, '2022-03-23');

CREATE TABLE EMPRESTIMOS_LIVROS (
    CodigoLivro INT,
    CodigoEmprestimo INT,
    PRIMARY KEY (CodigoLivro, CodigoEmprestimo),
    FOREIGN KEY (CodigoEmprestimo) REFERENCES EMPRESTIMOS(Codigo)
);

INSERT INTO EMPRESTIMOS_LIVROS (CodigoLivro, CodigoEmprestimo) VALUES
(3, 1),
(1, 3),
(2, 2);

CREATE TABLE LIVROS (
    CodigoLivro INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(255),
    Autor VARCHAR(255),
    CodigoSessao INT,
    CodigoEmprestimo INT,
    DataEmprestimo DATETIME,
    DataDevolucao DATE,
    NomeAluno VARCHAR(255),
    FOREIGN KEY (CodigoEmprestimo) REFERENCES EMPRESTIMOS(Codigo)
);

INSERT INTO LIVROS (Titulo, Autor, CodigoSessao, CodigoEmprestimo, DataEmprestimo, DataDevolucao, NomeAluno) VALUES
('Modelo Conceitual e Diagramas ER', 'Pressman, Roger S.', 3, 1, '2022-03-12 15:25:00', '2022-03-15', 'João Carlos'),
('Modelo Relacional e Álgebra Relacional', 'Heuser, Carlos Alberto', 1, 3, '2022-03-15 14:32:00', '2022-03-18', 'Paulo André'),
('Linguagem SQL', 'Beighley, Lynn', 2, 2, '2022-03-20 03:51:00', '2022-03-23', 'José Vitor');
