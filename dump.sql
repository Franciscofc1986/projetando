-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 07-Ago-2018 às 03:48
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
-- Database: `temlo861_projetando`
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbcomentario`
--

INSERT INTO `tbcomentario` (`id`, `idProjeto`, `ordem`, `idUsuario`, `mensagem`) VALUES
(18, 4, 1, 1, 'teste'),
(19, 4, 2, 1, 'sdfsdf'),
(20, 7, 1, 1, 'teste');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbcurtidas`
--

INSERT INTO `tbcurtidas` (`id`, `idUsuario`, `idProjeto`) VALUES
(36, 1, 4),
(37, 1, 6);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbgrupo`
--

INSERT INTO `tbgrupo` (`id`, `nome`, `foto`) VALUES
(1, 'Jardinagem', 'jardinagem.png'),
(2, 'Casa e Construção', 'casa.png'),
(3, 'Aeromodelos e Drones', 'drone.png'),
(4, 'Vestuario', 'vestuario.png'),
(5, 'Animais Domésticos', 'bichanos.png'),
(6, 'Agricultura e Pecuária', 'agropecuaria.png'),
(7, 'Brinquedos', 'cavalinho.png'),
(8, 'Ferramentas', 'ferramentas.png'),
(9, 'Culinária', 'culinaria.png'),
(10, 'Moveis', 'sofa.png'),
(11, 'Aquaponia', 'aquaponia.png'),
(12, 'Experimentos', 'experimento.png'),
(13, 'Hidroponia', '5b6914f157fc5.png'),
(14, 'Horticultura', '5b69159bb01c9.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbgrupogrupo`
--

INSERT INTO `tbgrupogrupo` (`id`, `idPai`, `idFilho`) VALUES
(7, 0, 1),
(8, 0, 2),
(9, 0, 3),
(10, 0, 8),
(11, 0, 9),
(12, 0, 10),
(13, 999, 11),
(14, 0, 12),
(15, 0, 4),
(16, 0, 5),
(17, 0, 6),
(18, 0, 7),
(19, 6, 11),
(20, 6, 13),
(21, 6, 14);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbgrupoprojeto`
--

INSERT INTO `tbgrupoprojeto` (`id`, `idGrupo`, `idProjeto`) VALUES
(5, 7, 4),
(6, 1, 7),
(7, 1, 6);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbprojeto`
--

INSERT INTO `tbprojeto` (`id`, `nome`, `codigoVideo`, `passosJson`, `custosJson`, `dificuldadesJson`, `materiaisJson`, `idUsuario`) VALUES
(1, 'Projeto de teste', 'GHB86yxT-W8', '{\r\n    \"1º Passo\": \"Separe os materiais\",\r\n    \"2º Passo\": \"Separe os materiais\",\r\n    \"3º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\",\r\n    \"4º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\"\r\n}', '{\r\n \"hábaco\": 15,\r\n \"2 x Isqueiro\": 45,\r\n \"4 x Pilhas\": 12,\r\n \"TOTAL\": 78\r\n}', '{\r\n \"dificuldade\":10,\r\n \"alertas\": [1,3,5]\r\n}', '{\r\n \"materiais\":\r\n  {\r\n   \"1cx\":\"Sabão em pó\",\r\n   \"2un\":\"isqueiro\",\r\n   \"1un\":\"cola quente\"\r\n  },\r\n  \"ferramentas\": [\"Cola-quente\", \"Martelo\", \"Espatula\"]\r\n}', 1),
(2, 'Projeto de aquaponia', 'ymknJKeFoLY', '{\r\n    \"1º Passo\": \"Separe os materiais\",\r\n    \"2º Passo\": \"Separe os materiais\",\r\n    \"3º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\",\r\n    \"4º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\"\r\n}', '{\r\n \"hábaco\": 15,\r\n \"2 x Isqueiro\": 45,\r\n \"4 x Pilhas\": 12,\r\n \"TOTAL\": 78\r\n}', '{\r\n \"dificuldade\":70,\r\n \"alertas\": [1,2,3,4,5,8,10]\r\n}', '{\r\n \"materiais\":\r\n  {\r\n   \"1cx\":\"Sabão em pó\",\r\n   \"2un\":\"isqueiro\",\r\n   \"1un\":\"cola quente\"\r\n  },\r\n  \"ferramentas\": [\"Cola-quente\", \"Martelo\", \"Espatula\"]\r\n}', 1),
(3, 'Projeto 3', '10x49T4oAzY', '{\r\n    \"1º Passo\": \"Separe os materiais\",\r\n    \"2º Passo\": \"Separe os materiais\",\r\n    \"3º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\",\r\n    \"4º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\"\r\n}\r\n            ', '{\r\n    \"hábaco\": 15,\r\n    \"2 x Isqueiro\": 45,\r\n    \"4 x Pilhas\": 12,\r\n    \"TOTAL\": 78\r\n}\r\n            ', '{\r\n    \"dificuldade\":10,\r\n    \"alertas\": [1,3,5]\r\n}\r\n            ', '{\r\n    \"materiais\":\r\n    {\r\n    \"1cx\":\"Sabão em pó\",\r\n    \"2un\":\"isqueiro\",\r\n    \"1un\":\"cola quente\"\r\n    },\r\n    \"ferramentas\": [\"Cola-quente\", \"Martelo\", \"Espatula\"]\r\n}\r\n            ', 1),
(4, 'Aquaponia junto com tanque de decantação', 'tEXo-KhXGys', '{\r\n    \"1º Passo\": \"Separe os materiais\",\r\n    \"2º Passo\": \"Atenção ao vídeo\"\r\n}\r\n            ', '{\r\n    \"2 x tambores\": 70,\r\n    \"1 x caixa d\'agua(1000L)\": 130,\r\n    \"1 x Bomba de aquario\": 80,\r\n    \"1pct x Argila espandida\": 20,\r\n    \"5 x tanques para cultivo e decantação\": 20,\r\n    \"1 x kit de medição da água\": 35,\r\n    \"20 x alevino de tilápia\": 15,\r\n    \"itens não mapeados\": 0,\r\n    \"TOTAL\": 1200\r\n}\r\n            ', '{\r\n    \"dificuldade\":60,\r\n    \"alertas\": [5,7,8,9]\r\n}\r\n            ', '{\r\n    \"materiais\":\r\n    {\r\n    \"2un\":\"Tambor de plástico\",\r\n    \"1un\":\"Caixa d\'agua 1000L\",\r\n    \"1un\":\"Bomba de aquário\",\r\n    \"1pct\":\"Argila Expandida\",\r\n    \"5un\":\"Tanque plastico\",\r\n    \"1un\":\"Kit medição de qualidade da água\",\r\n    \"20un\":\"Alevino de tilápia\",\r\n    \"6m\":\"Cano pvc 25mm\"\r\n    },\r\n    \"ferramentas\": [\"Furadeira\", \"Serra copo\", \"Lixa fina\"]\r\n}\r\n            ', 1),
(5, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 'tyrtyrtyrty', '10x49T4oAzY', '{\r\n    \"1º Passo\": \"Separe os materiais\",\r\n    \"2º Passo\": \"Separe os materiais\",\r\n    \"3º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\",\r\n    \"4º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\"\r\n}\r\n            ', '{\r\n    \"hábaco\": 15,\r\n    \"2 x Isqueiro\": 45,\r\n    \"4 x Pilhas\": 12,\r\n    \"TOTAL\": 78\r\n}\r\n            ', '{\r\n    \"dificuldade\":10,\r\n    \"alertas\": [1,3,5]\r\n}\r\n            ', '{\r\n    \"materiais\":\r\n    {\r\n    \"1cx\":\"Sabão em pó\",\r\n    \"2un\":\"isqueiro\",\r\n    \"1un\":\"cola quente\"\r\n    },\r\n    \"ferramentas\": [\"Cola-quente\", \"Martelo\", \"Espatula\"]\r\n}\r\n            ', 1),
(7, 'fghgfhfgh', 'tEXo-KhXGys', '{\"1º Passo\":\"dfgdfg\", \"2º Passo\":\"dfgdgfg\"}', '{\"45 x dfg\": 45, \"45 x dgdfdfd\": 45, \"TOTAL\": 90}', '{\"dificuldade\":45,\"alertas\": [3,5,8]}', '{\r\n \"materiais\":{\"45\":\"dfg\", \"456\":\"dgdfdfd\"},\r\n \"ferramentas\":[\"dfgdg\", \"dfgfd\"]\r\n}', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbtag`
--

INSERT INTO `tbtag` (`id`, `nome`, `foto`) VALUES
(1, 'Madeira', 'madeira.jpg'),
(2, 'Artesanato', 'artesanato.jpg'),
(3, 'Papelão', 'papelao.jpg'),
(4, 'Plástico', 'plastico.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbtagprojeto`
--

INSERT INTO `tbtagprojeto` (`id`, `idProjeto`, `idTag`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 1),
(5, 4, 4);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbusuario`
--

INSERT INTO `tbusuario` (`id`, `nome`, `foto`, `email`, `hashSenha`) VALUES
(1, 'Francisco FC', 'img_1.jpeg', 'francisco_fc@yahoo.com.br', '1937211467');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
