CREATE TABLE IF NOT EXISTS `Livro` (
	`id_livro` int(5) AUTO_INCREMENT NOT NULL UNIQUE,
	`titulo` varchar(50) NOT NULL,
	`ano` date(10) NOT NULL,
	`editora` varchar(30) NOT NULL,
	`autores` varchar(60) NOT NULL,
	`cod_categoria` int NOT NULL,
	PRIMARY KEY (`id_livro`)
);

INSERT INTO Livro VALUES
(0, 'Dom Casmurro', 01/01/1899, 'Livraria Garnier', 'Machado de Assis', 1),
(0, '1984', 08/06/1949, 'Secker & Warburg', 'George Orwell', 3),
(0, 'O Pequeno Príncipe', 06/04/1943, 'Reynal & Hitchcock', 'Antoine de Saint-Exupéry', 0),
(0, 'Crime e Castigo', 01/01/1866, 'The Russian Messenger', 'Fiódor Dostoiévski'0),
(0, 'Harry Potter e a Pedra Filosofal', 26/06/1997, 'Bloomsbury', 'J. K. Rowling', 2);

CREATE TABLE IF NOT EXISTS 'Autores' (
	`id_autor` int(5) AUTO_INCREMENT NOT NULL UNIQUE,
	`cpf` decimal(11) NOT NULL,
	`nome` varchar(60) NOT NULL,
	`nacionalidade` varchar(40) NOT NULL,
	`cidade` varchar(30) NOT NULL,
	PRIMARY KEY (`id_autor`)
);


INSERT INTO Autores VALUES
(0, '56235806370', 'Pietro Paulo da Rocha' ,'Xapuri'),
(0, '50635291355', 'Marlene Liz Barbosa','brasileiro' ,'Maringá'),
(0, '33543400029', 'Clarice Gabriela Stefany Carvalho','brasileira' ,'Manaus'),
(0, '52384034960', 'Cauê Rafael Pedro Sales','brasileiro' ,'Macapá'),
(0, '27138054300', 'Raul Miguel da Paz' ,'Rio Grande');

CREATE TABLE IF NOT EXISTS `Categorias` (
	`cod_categoria` int(5) NOT NULL UNIQUE,
	`nome` varchar(25) NOT NULL,
	`descricao` varchar(50) NOT NULL,
	`slug` varchar(30) NOT NULL,
	`data_cadastro` timestamp NOT NULL,
	PRIMARY KEY (`cod_categoria`)
);

INSERT INTO Categorias VALUES
(1, 'romance', 'uma história de amor entre duas pessoas', 'romance', CURRENT_TIMESTAMP),
(2, 'fantasia', 'uma história com magia e coisas sobrenaturais','fantasia' , CURRENT_TIMESTAMP),
(3, 'distopia', 'uma história de uma socidedade com problemas', 'distopia', CURRENT_TIMESTAMP),
(4, 'drama psicológico', 'uma história de pensamentos internos', 'drma-psicológico', CURRENT_TIMESTAMP),
(5, 'fábula', 'uma história que ensina uma lição de moral', 'fábula', CURRENT_TIMESTAMP);

CREATE TABLE IF NOT EXISTS `Leitores` (
	`id_leitor` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(60) NOT NULL,
	`cpf` decimal(11) NOT NULL UNIQUE,
	`email` varchar(70) NOT NULL,
	`data_cadastro` timestamp NOT NULL,
	PRIMARY KEY (`id_leitor`)
);

INSERT INTO Leitores VALUES
(0, 'Iago Geraldo Luís Barbosa', '72547113635','iagogeraldobarbosa@ymail.com', CURRENT_TIMESTAMP),
(0, 'Analu Tânia da Rosa', '77433697659', 'analutaniadarosa@dillon.com.br', CURRENT_TIMESTAMP),
(0, 'Isis Luciana Stefany Galvão', '08644736485', 'isis.luciana.galvao@lexos.com.br', CURRENT_TIMESTAMP),
(0, 'Oliver Cauã Enrico Aragão', '61568336845', 'oliver.caua.aragao@yahoo.com.com.br', CURRENT_TIMESTAMP),
(0, 'César Theo Sales', '34385816204', 'cesar_sales@abcturismo.com.br', CURRENT_TIMESTAMP);

CREATE TABLE IF NOT EXISTS `Emprestimo` (
	`id_emprestimo` int AUTO_INCREMENT NOT NULL,
	`id_leitor` int(5) NOT NULL,
	`id_livro` int(5) NOT NULL,
	`data_emprestimo` timestamp NOT NULL,
	`data-devolucao` datetime(19) NOT NULL,
	PRIMARY KEY (`id_emprestimo`)
);

INSERT INTO Emprestimo VALUES
(0, 1, 120, CURRENT_TIMESTAMP, 20/06/2026 12:10),
(0, 2, 050, CURRENT_TIMESTAMP, 10/06/2026 11:40),
(0, 3, 025, CURRENT_TIMESTAMP, 30/06/2026 13:30),
(0, 3, 380, CURRENT_TIMESTAMP, 23/07/2026 10:45),
(0, 4, 310, CURRENT_TIMESTAMP, 02/07/2026 16:50);

ALTER TABLE `Livro` ADD CONSTRAINT `Livro_fk4` FOREIGN KEY (`autores`) REFERENCES `Autores`(`id_autor`);
ALTER TABLE `Livro` ADD CONSTRAINT `Livro_fk5` FOREIGN KEY (`cod_categoria`) REFERENCES `Categorias`(`cod_categoria`);
ALTER TABLE `Autores` ADD CONSTRAINT `Autores_fk0` FOREIGN KEY (`id_autor`) REFERENCES `Livro`(`autores`);
ALTER TABLE `Categorias` ADD CONSTRAINT `Categorias_fk0` FOREIGN KEY (`cod_categoria`) REFERENCES `Livro`(`ISBN`);
ALTER TABLE `Emprestimo` ADD CONSTRAINT `Emprestimo_fk1` FOREIGN KEY (`id_leitor`) REFERENCES `Leitores`(`id_leitor`);
ALTER TABLE `Emprestimo` ADD CONSTRAINT `Emprestimo_fk2` FOREIGN KEY (`id_livro`) REFERENCES `Livro`(`id_livro`);