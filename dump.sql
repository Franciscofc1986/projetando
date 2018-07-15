-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 15-Jul-2018 às 22:05
-- Versão do servidor: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projetando`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcomentario`
--

DROP TABLE IF EXISTS `tbcomentario`;
CREATE TABLE IF NOT EXISTS `tbcomentario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProjeto` int(11) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `mensagem` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbcomentario`
--

INSERT INTO `tbcomentario` (`id`, `idProjeto`, `ordem`, `idUsuario`, `mensagem`) VALUES
(1, 1, 1, 1, 'Primeiro da lista porra'),
(2, 1, 2, 1, 'Grande merda'),
(3, 2, 1, 1, 'To sozinho aqui msm ?'),
(4, 1, 3, 1, 'teste'),
(5, 1, 4, 1, 'testando novamnete'),
(6, 1, 5, 1, 'outro'),
(7, 2, 2, 1, 'e  aqui'),
(8, 2, 3, 1, 'DFGDFGFD'),
(9, 1, 6, 1, 'dfgfdgdfg'),
(10, 1, 7, 1, 'teste'),
(11, 1, 8, 1, 'sdfsdf\nsdf\nsdf\nsdfsdfsdf\nsdf\nsdfsdf\ns\ndfs\ndfs\ndfsdf'),
(12, 2, 4, 1, 'gfhfhgfh'),
(13, 2, 8, 1, 'xcvcxvxcv\nxcxcv'),
(14, 2, 5, 1, 'xcvcxvxcv\nxcxcv'),
(15, 2, 6, 1, 'xcvxcv'),
(16, 2, 7, 1, 'xcvxcv'),
(17, 2, 9, 5, 'hjkhjkhjkhjkm,h,jh,');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcurtidas`
--

DROP TABLE IF EXISTS `tbcurtidas`;
CREATE TABLE IF NOT EXISTS `tbcurtidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `idProjeto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbcurtidas`
--

INSERT INTO `tbcurtidas` (`id`, `idUsuario`, `idProjeto`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 2),
(4, 1, 2),
(5, 1, 2),
(6, 1, 2),
(7, 1, 2),
(8, 1, 2),
(9, 1, 2),
(10, 1, 2),
(11, 1, 2),
(12, 1, 2),
(13, 1, 2),
(14, 1, 2),
(15, 1, 2),
(16, 1, 2),
(17, 1, 2),
(18, 1, 2),
(19, 1, 2),
(20, 1, 2),
(21, 1, 2),
(22, 1, 2),
(23, 1, 2),
(24, 1, 1),
(25, 1, 2),
(26, 1, 1),
(27, 1, 1),
(28, 1, 2),
(29, 1, 2),
(30, 1, 2),
(31, 1, 2),
(32, 1, 2),
(33, 1, 2),
(34, 5, 2),
(35, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbgrupo`
--

DROP TABLE IF EXISTS `tbgrupo`;
CREATE TABLE IF NOT EXISTS `tbgrupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbgrupo`
--

INSERT INTO `tbgrupo` (`id`, `nome`, `foto`) VALUES
(1, 'Grupo 1', NULL),
(2, 'Aquaponia', 'img_1.jpeg'),
(3, 'Grupo 3', '5b4b6eba49d14.jpeg'),
(4, 'Grupo 4', NULL),
(5, 'Grupo 5', NULL),
(6, 'Grupo novo', '5b4b70eb3c8b3.jpeg'),
(7, 'Grupo atual', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbgrupogrupo`
--

DROP TABLE IF EXISTS `tbgrupogrupo`;
CREATE TABLE IF NOT EXISTS `tbgrupogrupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPai` int(11) DEFAULT NULL,
  `idFilho` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbgrupogrupo`
--

INSERT INTO `tbgrupogrupo` (`id`, `idPai`, `idFilho`) VALUES
(1, 2, 1),
(2, 2, 3),
(3, 3, 4),
(4, 0, 2),
(5, 3, 5),
(6, 1, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbgrupoprojeto`
--

DROP TABLE IF EXISTS `tbgrupoprojeto`;
CREATE TABLE IF NOT EXISTS `tbgrupoprojeto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idGrupo` int(11) DEFAULT NULL,
  `idProjeto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbgrupoprojeto`
--

INSERT INTO `tbgrupoprojeto` (`id`, `idGrupo`, `idProjeto`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 6, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbmensagem`
--

DROP TABLE IF EXISTS `tbmensagem`;
CREATE TABLE IF NOT EXISTS `tbmensagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEmissor` int(11) DEFAULT NULL,
  `idDestinatario` int(11) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbprojeto`
--

DROP TABLE IF EXISTS `tbprojeto`;
CREATE TABLE IF NOT EXISTS `tbprojeto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(1000) DEFAULT NULL,
  `codigoVideo` varchar(1000) DEFAULT NULL,
  `passosJson` text,
  `custosJson` text,
  `dificuldadesJson` text,
  `materiaisJson` text,
  `idUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbprojeto`
--

INSERT INTO `tbprojeto` (`id`, `nome`, `codigoVideo`, `passosJson`, `custosJson`, `dificuldadesJson`, `materiaisJson`, `idUsuario`) VALUES
(1, 'Projeto de teste', 'GHB86yxT-W8', '{\r\n    \"1º Passo\": \"Separe os materiais\",\r\n    \"2º Passo\": \"Separe os materiais\",\r\n    \"3º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\",\r\n    \"4º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\"\r\n}', '{\r\n \"hábaco\": 15,\r\n \"2 x Isqueiro\": 45,\r\n \"4 x Pilhas\": 12,\r\n \"TOTAL\": 78\r\n}', '{\r\n \"dificuldade\":10,\r\n \"alertas\": [1,3,5]\r\n}', '{\r\n \"materiais\":\r\n  {\r\n   \"1cx\":\"Sabão em pó\",\r\n   \"2un\":\"isqueiro\",\r\n   \"1un\":\"cola quente\"\r\n  },\r\n  \"ferramentas\": [\"Cola-quente\", \"Martelo\", \"Espatula\"]\r\n}', 1),
(2, 'Projeto de aquaponia', 'ymknJKeFoLY', '{\r\n    \"1º Passo\": \"Separe os materiais\",\r\n    \"2º Passo\": \"Separe os materiais\",\r\n    \"3º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\",\r\n    \"4º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\"\r\n}', '{\r\n \"hábaco\": 15,\r\n \"2 x Isqueiro\": 45,\r\n \"4 x Pilhas\": 12,\r\n \"TOTAL\": 78\r\n}', '{\r\n \"dificuldade\":70,\r\n \"alertas\": [1,2,3,4,5,8,10]\r\n}', '{\r\n \"materiais\":\r\n  {\r\n   \"1cx\":\"Sabão em pó\",\r\n   \"2un\":\"isqueiro\",\r\n   \"1un\":\"cola quente\"\r\n  },\r\n  \"ferramentas\": [\"Cola-quente\", \"Martelo\", \"Espatula\"]\r\n}', 1),
(3, 'Projeto 3', '10x49T4oAzY', '{\r\n    \"1º Passo\": \"Separe os materiais\",\r\n    \"2º Passo\": \"Separe os materiais\",\r\n    \"3º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\",\r\n    \"4º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\"\r\n}\r\n            ', '{\r\n    \"hábaco\": 15,\r\n    \"2 x Isqueiro\": 45,\r\n    \"4 x Pilhas\": 12,\r\n    \"TOTAL\": 78\r\n}\r\n            ', '{\r\n    \"dificuldade\":10,\r\n    \"alertas\": [1,3,5]\r\n}\r\n            ', '{\r\n    \"materiais\":\r\n    {\r\n    \"1cx\":\"Sabão em pó\",\r\n    \"2un\":\"isqueiro\",\r\n    \"1un\":\"cola quente\"\r\n    },\r\n    \"ferramentas\": [\"Cola-quente\", \"Martelo\", \"Espatula\"]\r\n}\r\n            ', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtag`
--

DROP TABLE IF EXISTS `tbtag`;
CREATE TABLE IF NOT EXISTS `tbtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbtag`
--

INSERT INTO `tbtag` (`id`, `nome`, `foto`) VALUES
(1, 'Madeira', 'madeira.jpg'),
(2, 'Artesanato', 'artesanato.jpg'),
(3, 'Papelão', 'papelao.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtagprojeto`
--

DROP TABLE IF EXISTS `tbtagprojeto`;
CREATE TABLE IF NOT EXISTS `tbtagprojeto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProjeto` int(11) DEFAULT NULL,
  `idTag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbtagprojeto`
--

INSERT INTO `tbtagprojeto` (`id`, `idProjeto`, `idTag`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbusuario`
--

DROP TABLE IF EXISTS `tbusuario`;
CREATE TABLE IF NOT EXISTS `tbusuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `hashSenha` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbusuario`
--

INSERT INTO `tbusuario` (`id`, `nome`, `foto`, `email`, `hashSenha`) VALUES
(1, 'Francisco FC', 'img_1.jpeg', 'francisco_fc@yahoo.com.br', '1937211467'),
(2, 'juca', '5b4bc192073c8.png', 'juca@uol.br', '1264879959'),
(3, 'elite', '5b4b614ad9890.jpeg', 'elite@teste.br', '112581311'),
(4, 'dfgdg', NULL, 'dfgdfg@uol.br', '1562708426'),
(5, 'teste', '5b4bacc01dcad.png', 'teste@yahoo.com.br', '1146334401'),
(6, 'fghfgh', NULL, 'fghfgh@uol', '273621906'),
(7, 'pipoca', NULL, 'pipoca@uol', '1628421724'),
(8, 'tulipa', NULL, 'tulipa@br', '1282357853'),
(9, 'testando', NULL, 'testando@uol', '1376173288'),
(10, 'queijo', NULL, 'queijo@queijo', '2077644283');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
