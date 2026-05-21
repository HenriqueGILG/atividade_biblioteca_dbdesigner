CREATE TABLE IF NOT EXISTS `Livro` (
	`ISBN` int AUTO_INCREMENT NOT NULL UNIQUE,
	`titulo` varchar(50) NOT NULL,
	`ano` date NOT NULL,
	`editora` varchar(30) NOT NULL,
	`autores` varchar(60) NOT NULL,
	PRIMARY KEY (`ISBN`)
);
CREATE TABLE IF NOT EXISTS `Autores` (
	`nome` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nacionalidade` varchar(40) NOT NULL,
	PRIMARY KEY (`nome`)
);
CREATE TABLE IF NOT EXISTS `Categorias` (
	`cod_categoria` int AUTO_INCREMENT NOT NULL UNIQUE,
	`descricao` varchar(50) NOT NULL,
	PRIMARY KEY (`cod_categoria`)
);
ALTER TABLE `Livro` ADD CONSTRAINT `Livro_fk1` FOREIGN KEY (`titulo`) REFERENCES `Autores`(`nome`);
ALTER TABLE `Autores` ADD CONSTRAINT `Autores_fk0` FOREIGN KEY (`nome`) REFERENCES `Livro`(`titulo`);
ALTER TABLE `Categorias` ADD CONSTRAINT `Categorias_fk0` FOREIGN KEY (`cod_categoria`) REFERENCES `Livro`(`ISBN`);