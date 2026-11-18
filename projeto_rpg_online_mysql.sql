/*
-- Projeto: Jogo de RPG online
-- SGBD: MySQL
-- Descricao: Criacao
-- Nome: Jorge Luiz Alencar Lopes
-- Turma: Desenvolvedor Back-End - Turma 01 DR RN
*/

-- 1. Criacao do banco de dados
CREATE DATABASE RPGOnlineDB;

-- 2. Selecao do banco para criar as tabelas dentro dele
USE RPGOnlineDB;

-- =====================================================
-- 3. Tabelas independentes (sem chave estrangeira)
-- =====================================================

-- Tabela USUARIOS
CREATE TABLE Usuarios
(
    UsuarioId INT PRIMARY KEY AUTO_INCREMENT
    ,Email VARCHAR(120) NOT NULL UNIQUE
    ,Senha VARCHAR(255) NOT NULL -- armazenar apenas o hash da senha
);

-- Tabela CLASSES
CREATE TABLE Classes
(
    ClasseId INT PRIMARY KEY AUTO_INCREMENT
    ,Nome VARCHAR(50) NOT NULL UNIQUE
    ,Descricao VARCHAR(255)
);

-- Tabela HABILIDADES
CREATE TABLE Habilidades
(
    HabilidadeId INT PRIMARY KEY AUTO_INCREMENT
    ,Nome VARCHAR(50) NOT NULL UNIQUE
);

-- =====================================================
-- 4. Tabelas dependentes (com chave estrangeira)
-- =====================================================

-- Tabela PERSONAGENS
-- Um usuario possui N personagens (1:N)
-- Uma classe possui N personagens (1:N)
CREATE TABLE Personagens
(
    PersonagemId INT PRIMARY KEY AUTO_INCREMENT
    ,NomePersonagem VARCHAR(50) NOT NULL
    ,UsuarioId INT NOT NULL
    ,ClasseId INT NOT NULL
    ,FOREIGN KEY (UsuarioId) REFERENCES Usuarios(UsuarioId)
    ,FOREIGN KEY (ClasseId) REFERENCES Classes(ClasseId)
);

-- Tabela CLASSES_HABILIDADES
-- Resolve o relacionamento N:N entre CLASSES e HABILIDADES
-- Chave primaria composta (ClasseId + HabilidadeId), ambas tambem FK
CREATE TABLE Classes_Habilidades
(
    ClasseId INT NOT NULL
    ,HabilidadeId INT NOT NULL
    ,PRIMARY KEY (ClasseId, HabilidadeId)
    ,FOREIGN KEY (ClasseId) REFERENCES Classes(ClasseId)
    ,FOREIGN KEY (HabilidadeId) REFERENCES Habilidades(HabilidadeId)
);
