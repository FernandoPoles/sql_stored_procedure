
CREATE TABLE Alunos (
    idAlunos INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sobrenome VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    idade INT,
    Cursos_idCursos INT,
    FOREIGN KEY (Cursos_idCursos) REFERENCES Cursos(idCursos)
);

CREATE TABLE Professores (
    idProfessores INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Cursos (
    idCursos INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100)
);

CREATE TABLE Professores_da_Cursos (
    Professores_idProfessores INT,
    Cursos_idCursos INT,
    PRIMARY KEY (Professores_idProfessores, Cursos_idCursos),
    FOREIGN KEY (Professores_idProfessores) REFERENCES Professores(idProfessores),
    FOREIGN KEY (Cursos_idCursos) REFERENCES Cursos(idCursos)
);

DELIMITER $$

CREATE PROCEDURE InserirAluno(
    IN aluno_nome VARCHAR(50),
    IN aluno_sobrenome VARCHAR(50),
    IN aluno_idade INT,
    IN curso_id INT
)
BEGIN
    DECLARE novo_email VARCHAR(100);
    DECLARE email_suffix INT;
    
    SELECT COUNT(*) INTO email_suffix FROM Alunos WHERE Email = CONCAT(aluno_nome, '.', aluno_sobrenome, '@dominio.com');
    
    IF email_suffix > 0 THEN
        SET novo_email = CONCAT(aluno_nome, '.', aluno_sobrenome, email_suffix + 1, '@dominio.com');
    ELSE
        SET novo_email = CONCAT(aluno_nome, '.', aluno_sobrenome, '@dominio.com');
    END IF;
    
    -- Insere o novo aluno na tabela
    INSERT INTO Alunos (nome, sobrenome, email, idade, Cursos_idCursos)
    VALUES (aluno_nome, aluno_sobrenome, novo_email, aluno_idade, curso_id);
END $$

DELIMITER ;

INSERT INTO Cursos (nome) VALUES
('Matemática'),
('História'),
('Ciência da Computação'),
('Literatura'),
('Arte');

INSERT INTO Professores (nome_completo, email) VALUES
('João Silva', 'joao.silva@exemplo.com'),
('Maria Santos', 'maria.santos@exemplo.com'),
('Pedro Oliveira', 'pedro.oliveira@exemplo.com'),
('Ana Costa', 'ana.costa@exemplo.com'),
('Lucas Pereira', 'lucas.pereira@exemplo.com'),
('Juliana Carvalho', 'juliana.carvalho@exemplo.com'),
('Rafael Almeida', 'rafael.almeida@exemplo.com'),
('Carolina Sousa', 'carolina.sousa@exemplo.com'),
('Felipe Mendes', 'felipe.mendes@exemplo.com'),
('Amanda Lima', 'amanda.lima@exemplo.com');

CALL InserirAluno('José', 'Silva', 20, 1);
CALL InserirAluno('Maria', 'Santos', 22, 2);
CALL InserirAluno('João', 'Oliveira', 21, 3);
CALL InserirAluno('Ana', 'Costa', 19, 4);
CALL InserirAluno('Lucas', 'Pereira', 23, 5);
CALL InserirAluno('Carolina', 'Lima', 24, 1);
CALL InserirAluno('Felipe', 'Mendes', 25, 2);
CALL InserirAluno('Amanda', 'Souza', 20, 3);
CALL InserirAluno('Rafael', 'Almeida', 22, 4);
CALL InserirAluno('Juliana', 'Carvalho', 21, 5);
CALL InserirAluno('Mariana', 'Fernandes', 23, 1);
CALL InserirAluno('Pedro', 'Silveira', 24, 2);
CALL InserirAluno('Larissa', 'Vieira', 20, 3);
CALL InserirAluno('Marcelo', 'Ribeiro', 22, 4);
CALL InserirAluno('Sandra', 'Cruz', 21, 5);
CALL InserirAluno('Carlos', 'Santana', 25, 1);
CALL InserirAluno('Tatiana', 'Nunes', 19, 2);
CALL InserirAluno('Fernando', 'Costa', 23, 3);
CALL InserirAluno('Gisele', 'Rodrigues', 26, 4);
CALL InserirAluno('André', 'Lima', 24, 5);