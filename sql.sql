CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Pessoa (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    DataNascimento DATE NOT NULL
);

CREATE TABLE Autor (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CPF VARCHAR(11) NOT NULL,
    FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
);

CREATE TABLE Aluno (
    Matricula INT PRIMARY KEY,
    CPF VARCHAR(11) NOT NULL,
    Entrada DATE NOT NULL,
    Ativo BOOLEAN NOT NULL,
    FOREIGN KEY (CPF) REFERENCES Pessoa(CPF)
);

CREATE TABLE Curso (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Turma (
    Codigo INT PRIMARY KEY,
    Semestre VARCHAR(20) NOT NULL,
    CursoCodigo INT NOT NULL,
    FOREIGN KEY (CursoCodigo) REFERENCES Curso(Codigo)
);

CREATE TABLE AlunoCurso (
    Matricula INT,
    CursoCodigo INT,
    PRIMARY KEY (Matricula, CursoCodigo),
    FOREIGN KEY (Matricula) REFERENCES Aluno(Matricula),
    FOREIGN KEY (CursoCodigo) REFERENCES Curso(Codigo)
);

CREATE TABLE Livro (
    COD VARCHAR(20) PRIMARY KEY,
    Titulo VARCHAR(200) NOT NULL,
    Ano INT NOT NULL,
    Editora VARCHAR(100) NOT NULL
);

CREATE TABLE AutorLivro (
    AutorID INT,
    COD VARCHAR(20),
    PRIMARY KEY (AutorID, COD),
    FOREIGN KEY (AutorID) REFERENCES Autor(ID),
    FOREIGN KEY (COD) REFERENCES Livro(COD)
);

CREATE TABLE Emprestimo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Matricula INT NOT NULL,
    COD VARCHAR(20) NOT NULL,
    DataEmprestimo DATE NOT NULL,
    DataDevolucao DATE,
    FOREIGN KEY (Matricula) REFERENCES Aluno(Matricula),
    FOREIGN KEY (COD) REFERENCES Livro(COD)
);

INSERT INTO Pessoa (CPF, Nome, DataNascimento) VALUES
('11111111111', 'João Silva', '2000-05-10'),
('22222222222', 'Maria Souza', '1999-03-15'),
('33333333333', 'Carlos Pereira', '1980-08-20');

INSERT INTO Autor (CPF) VALUES
('33333333333'),
('22222222222'),
('11111111111');

INSERT INTO Aluno (Matricula, CPF, Entrada, Ativo) VALUES
(1001, '11111111111', '2022-01-15', TRUE),
(1002, '22222222222', '2023-02-10', TRUE),
(1003, '33333333333', '2021-07-01', FALSE);

INSERT INTO Curso (Codigo, Nome) VALUES
(1, 'Ciência da Computação'),
(2, 'Engenharia de Software'),
(3, 'Sistemas de Informação');

INSERT INTO Turma (Codigo, Semestre, CursoCodigo) VALUES
(101, '2023/1', 1),
(102, '2023/2', 2),
(103, '2024/1', 3);

INSERT INTO AlunoCurso (Matricula, CursoCodigo) VALUES
(1001, 1),
(1002, 2),
(1003, 3);

INSERT INTO Livro (COD, Titulo, Ano, Editora) VALUES
('978-0001', 'Banco de Dados Essencial', 2020, 'Pearson'),
('978-0002', 'Algoritmos e Programação', 2019, 'Elsevier'),
('978-0003', 'Redes de Computadores', 2021, 'Makron Books');

INSERT INTO AutorLivro (AutorID, COD) VALUES
(1, '978-0001'),
(2, '978-0002'),
(3, '978-0003');

INSERT INTO Emprestimo (Matricula, COD, DataEmprestimo, DataDevolucao) VALUES
(1001, '978-0001', '2024-02-01', '2024-02-10'),
(1002, '978-0002', '2024-03-05', NULL),
(1003, '978-0003', '2024-01-20', '2024-02-15');