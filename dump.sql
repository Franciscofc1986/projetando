-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 16/07/2018 às 01:08
-- Versão do servidor: 5.6.39-83.1
-- Versão do PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `temlo861_projetando`
--
CREATE DATABASE IF NOT EXISTS `temlo861_projetando` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `temlo861_projetando`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbcomentario`
--

CREATE TABLE `tbcomentario` (
  `id` int(11) NOT NULL,
  `idProjeto` int(11) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `mensagem` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbcurtidas`
--

CREATE TABLE `tbcurtidas` (
  `id` int(11) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idProjeto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbgrupo`
--

CREATE TABLE `tbgrupo` (
  `id` int(11) NOT NULL,
  `nome` varchar(500) DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tbgrupo`
--

INSERT INTO `tbgrupo` (`id`, `nome`, `foto`) VALUES
(1, 'Jardinagem', '5b4bdd28875f7.jpg'),
(2, 'Obras de construção', '5b4bde050a3dd.jpg'),
(3, 'Aeromodelismo', '5b4bdec2556ec.jpg'),
(4, 'Grupo disponivel', NULL),
(5, 'Grupo disponivel', NULL),
(6, 'Grupo disponivel', NULL),
(7, 'Grupo disponivel', NULL),
(8, 'Móveis', '5b4bdee319ed4.jpeg'),
(9, 'Brinquedos', '5b4bdf6c13dfb.jpg'),
(10, 'Agricultura e Pecuária', '5b4be02bdc43b.jpg'),
(11, 'Animais Domésticos', '5b4be046aea51.jpg'),
(12, 'Experimentos', '5b4be06653646.jpeg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbgrupogrupo`
--

CREATE TABLE `tbgrupogrupo` (
  `id` int(11) NOT NULL,
  `idPai` int(11) DEFAULT NULL,
  `idFilho` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tbgrupogrupo`
--

INSERT INTO `tbgrupogrupo` (`id`, `idPai`, `idFilho`) VALUES
(7, 0, 1),
(8, 0, 2),
(9, 0, 3),
(10, 0, 8),
(11, 0, 9),
(12, 0, 10),
(13, 0, 11),
(14, 0, 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbgrupoprojeto`
--

CREATE TABLE `tbgrupoprojeto` (
  `id` int(11) NOT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  `idProjeto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbmensagem`
--

CREATE TABLE `tbmensagem` (
  `id` int(11) NOT NULL,
  `idEmissor` int(11) DEFAULT NULL,
  `idDestinatario` int(11) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbprojeto`
--

CREATE TABLE `tbprojeto` (
  `id` int(11) NOT NULL,
  `nome` varchar(1000) DEFAULT NULL,
  `codigoVideo` varchar(1000) DEFAULT NULL,
  `passosJson` text,
  `custosJson` text,
  `dificuldadesJson` text,
  `materiaisJson` text,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tbprojeto`
--

INSERT INTO `tbprojeto` (`id`, `nome`, `codigoVideo`, `passosJson`, `custosJson`, `dificuldadesJson`, `materiaisJson`, `idUsuario`) VALUES
(1, 'Projeto de teste', 'GHB86yxT-W8', '{\r\n    \"1º Passo\": \"Separe os materiais\",\r\n    \"2º Passo\": \"Separe os materiais\",\r\n    \"3º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\",\r\n    \"4º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\"\r\n}', '{\r\n \"hábaco\": 15,\r\n \"2 x Isqueiro\": 45,\r\n \"4 x Pilhas\": 12,\r\n \"TOTAL\": 78\r\n}', '{\r\n \"dificuldade\":10,\r\n \"alertas\": [1,3,5]\r\n}', '{\r\n \"materiais\":\r\n  {\r\n   \"1cx\":\"Sabão em pó\",\r\n   \"2un\":\"isqueiro\",\r\n   \"1un\":\"cola quente\"\r\n  },\r\n  \"ferramentas\": [\"Cola-quente\", \"Martelo\", \"Espatula\"]\r\n}', 1),
(2, 'Projeto de aquaponia', 'ymknJKeFoLY', '{\r\n    \"1º Passo\": \"Separe os materiais\",\r\n    \"2º Passo\": \"Separe os materiais\",\r\n    \"3º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\",\r\n    \"4º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\"\r\n}', '{\r\n \"hábaco\": 15,\r\n \"2 x Isqueiro\": 45,\r\n \"4 x Pilhas\": 12,\r\n \"TOTAL\": 78\r\n}', '{\r\n \"dificuldade\":70,\r\n \"alertas\": [1,2,3,4,5,8,10]\r\n}', '{\r\n \"materiais\":\r\n  {\r\n   \"1cx\":\"Sabão em pó\",\r\n   \"2un\":\"isqueiro\",\r\n   \"1un\":\"cola quente\"\r\n  },\r\n  \"ferramentas\": [\"Cola-quente\", \"Martelo\", \"Espatula\"]\r\n}', 1),
(3, 'Projeto 3', '10x49T4oAzY', '{\r\n    \"1º Passo\": \"Separe os materiais\",\r\n    \"2º Passo\": \"Separe os materiais\",\r\n    \"3º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\",\r\n    \"4º Passo\": \"Nunca mexa com fogo sem a presença de um adulto\"\r\n}\r\n            ', '{\r\n    \"hábaco\": 15,\r\n    \"2 x Isqueiro\": 45,\r\n    \"4 x Pilhas\": 12,\r\n    \"TOTAL\": 78\r\n}\r\n            ', '{\r\n    \"dificuldade\":10,\r\n    \"alertas\": [1,3,5]\r\n}\r\n            ', '{\r\n    \"materiais\":\r\n    {\r\n    \"1cx\":\"Sabão em pó\",\r\n    \"2un\":\"isqueiro\",\r\n    \"1un\":\"cola quente\"\r\n    },\r\n    \"ferramentas\": [\"Cola-quente\", \"Martelo\", \"Espatula\"]\r\n}\r\n            ', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbtag`
--

CREATE TABLE `tbtag` (
  `id` int(11) NOT NULL,
  `nome` varchar(500) DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tbtag`
--

INSERT INTO `tbtag` (`id`, `nome`, `foto`) VALUES
(1, 'Madeira', 'madeira.jpg'),
(2, 'Artesanato', 'artesanato.jpg'),
(3, 'Papelão', 'papelao.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbtagprojeto`
--

CREATE TABLE `tbtagprojeto` (
  `id` int(11) NOT NULL,
  `idProjeto` int(11) DEFAULT NULL,
  `idTag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tbtagprojeto`
--

INSERT INTO `tbtagprojeto` (`id`, `idProjeto`, `idTag`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbusuario`
--

CREATE TABLE `tbusuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(500) DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `hashSenha` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Fazendo dump de dados para tabela `tbusuario`
--

INSERT INTO `tbusuario` (`id`, `nome`, `foto`, `email`, `hashSenha`) VALUES
(1, 'Francisco FC', 'img_1.jpeg', 'francisco_fc@yahoo.com.br', '1937211467');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `tbcomentario`
--
ALTER TABLE `tbcomentario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tbcurtidas`
--
ALTER TABLE `tbcurtidas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tbgrupo`
--
ALTER TABLE `tbgrupo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tbgrupogrupo`
--
ALTER TABLE `tbgrupogrupo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tbgrupoprojeto`
--
ALTER TABLE `tbgrupoprojeto`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tbmensagem`
--
ALTER TABLE `tbmensagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tbprojeto`
--
ALTER TABLE `tbprojeto`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tbtag`
--
ALTER TABLE `tbtag`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tbtagprojeto`
--
ALTER TABLE `tbtagprojeto`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tbusuario`
--
ALTER TABLE `tbusuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `tbcomentario`
--
ALTER TABLE `tbcomentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `tbcurtidas`
--
ALTER TABLE `tbcurtidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `tbgrupo`
--
ALTER TABLE `tbgrupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `tbgrupogrupo`
--
ALTER TABLE `tbgrupogrupo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tbgrupoprojeto`
--
ALTER TABLE `tbgrupoprojeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tbmensagem`
--
ALTER TABLE `tbmensagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbprojeto`
--
ALTER TABLE `tbprojeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbtag`
--
ALTER TABLE `tbtag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbtagprojeto`
--
ALTER TABLE `tbtagprojeto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tbusuario`
--
ALTER TABLE `tbusuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Banco de dados: `temlo861_temlogica_db`
--
CREATE DATABASE IF NOT EXISTS `temlo861_temlogica_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `temlo861_temlogica_db`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `argumento`
--

CREATE TABLE `argumento` (
  `argumento_id` int(10) UNSIGNED NOT NULL,
  `titulo_argumento` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao_argumento` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_argumento` tinyint(1) DEFAULT '1',
  `data_cadastro_argumento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resposta_id_argumento` int(10) UNSIGNED DEFAULT NULL,
  `cor_argumento` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `argumento_erro`
--

CREATE TABLE `argumento_erro` (
  `argumento_erro_id` int(10) UNSIGNED NOT NULL,
  `argumento_id` int(10) UNSIGNED DEFAULT NULL,
  `erro_id` int(10) UNSIGNED DEFAULT NULL,
  `cont_avaliacoes_erro_argumento` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `debate`
--

CREATE TABLE `debate` (
  `debate_id` int(10) UNSIGNED NOT NULL,
  `titulo_debate` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao_debate` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autor_id_debate` int(10) UNSIGNED DEFAULT NULL,
  `data_cadastro_debate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `debate_debate`
--

CREATE TABLE `debate_debate` (
  `debate_id_primeiro` int(10) UNSIGNED DEFAULT NULL,
  `debate_id_segundo` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `erro`
--

CREATE TABLE `erro` (
  `erro_id` int(10) UNSIGNED NOT NULL,
  `titulo_erro` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao_erro` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nome_original` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_erro_id` int(10) UNSIGNED DEFAULT NULL,
  `fonte_erro` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exemplo_erro`
--

CREATE TABLE `exemplo_erro` (
  `exemplo_erro_id` int(10) UNSIGNED NOT NULL,
  `descricao_exemplo_erro` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `erro_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `premissa`
--

CREATE TABLE `premissa` (
  `premissa_id` int(10) UNSIGNED NOT NULL,
  `titulo_premissa` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao_premissa` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_premissa` tinyint(1) DEFAULT '1',
  `data_cadastro_premissa` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `argumento_id_premissa` int(10) UNSIGNED DEFAULT NULL,
  `cor_premissa` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `premissa_erro`
--

CREATE TABLE `premissa_erro` (
  `premissa_erro_id` int(10) UNSIGNED NOT NULL,
  `premissa_id` int(10) UNSIGNED DEFAULT NULL,
  `erro_id` int(10) UNSIGNED DEFAULT NULL,
  `cont_avaliacoes_erro_premissa` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `resposta`
--

CREATE TABLE `resposta` (
  `resposta_id` int(10) UNSIGNED NOT NULL,
  `texto_resposta` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordem_resposta` smallint(5) UNSIGNED DEFAULT NULL,
  `autor_id_resposta` int(10) UNSIGNED DEFAULT NULL,
  `debate_id_resposta` int(10) UNSIGNED DEFAULT NULL,
  `data_cadastro_resposta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cor_resposta` tinyint(3) UNSIGNED DEFAULT NULL,
  `status_resposta` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `resposta_erro`
--

CREATE TABLE `resposta_erro` (
  `resposta_erro_id` int(10) UNSIGNED NOT NULL,
  `resposta_id` int(10) UNSIGNED DEFAULT NULL,
  `erro_id` int(10) UNSIGNED DEFAULT NULL,
  `cont_avaliacoes_erro_reposta` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_erro`
--

CREATE TABLE `tipo_erro` (
  `tipo_erro_id` int(10) UNSIGNED NOT NULL,
  `texto_tipo_erro` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cor_tipo_erro` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `nome_usuario` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `senha_usuario` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_usuario` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_usuario` tinyint(3) UNSIGNED DEFAULT NULL,
  `foto_usuario` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_cadastro_usuario` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_atualizacao_usuario` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Fazendo dump de dados para tabela `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `nome_usuario`, `senha_usuario`, `email_usuario`, `tipo_usuario`, `foto_usuario`, `data_cadastro_usuario`, `data_atualizacao_usuario`) VALUES
(1, 'Francisco de Faria Cardoso', '123456', 'francisco_fc@yahoo.com.br', 2, '1.jpg', '2018-03-21 06:05:27', '2018-03-21 06:05:27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_argumento_erro`
--

CREATE TABLE `usuario_argumento_erro` (
  `usuario_argumento_erro_id` int(10) UNSIGNED NOT NULL,
  `argumento_erro_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_sinalizador_id` int(10) UNSIGNED DEFAULT NULL,
  `comentario_sinalizador` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordem_comentario` smallint(5) UNSIGNED DEFAULT NULL,
  `data_cadastro_argumento_sinalizador` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_debate`
--

CREATE TABLE `usuario_debate` (
  `usuario_debate_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `debate_id` int(10) UNSIGNED DEFAULT NULL,
  `data_cadastro_usuario_debate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_premissa_erro`
--

CREATE TABLE `usuario_premissa_erro` (
  `usuario_premissa_erro_id` int(10) UNSIGNED NOT NULL,
  `premissa_erro_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_sinalizador_id` int(10) UNSIGNED DEFAULT NULL,
  `comentario_sinalizador` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordem_comentario` smallint(5) UNSIGNED DEFAULT NULL,
  `data_cadastro_premissa_sinalizador` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_resposta_erro`
--

CREATE TABLE `usuario_resposta_erro` (
  `usuario_resposta_erro_id` int(10) UNSIGNED NOT NULL,
  `resposta_erro_id` int(10) UNSIGNED DEFAULT NULL,
  `usuario_sinalizador_id` int(10) UNSIGNED DEFAULT NULL,
  `comentario_sinalizador` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ordem_comentario` smallint(5) UNSIGNED DEFAULT NULL,
  `data_cadastro_resposta_sinalizador` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `argumento`
--
ALTER TABLE `argumento`
  ADD PRIMARY KEY (`argumento_id`),
  ADD KEY `resposta_id_argumento` (`resposta_id_argumento`);

--
-- Índices de tabela `argumento_erro`
--
ALTER TABLE `argumento_erro`
  ADD PRIMARY KEY (`argumento_erro_id`),
  ADD KEY `argumento_id` (`argumento_id`),
  ADD KEY `erro_id` (`erro_id`);

--
-- Índices de tabela `debate`
--
ALTER TABLE `debate`
  ADD PRIMARY KEY (`debate_id`);

--
-- Índices de tabela `debate_debate`
--
ALTER TABLE `debate_debate`
  ADD KEY `debate_id_primeiro` (`debate_id_primeiro`),
  ADD KEY `debate_id_segundo` (`debate_id_segundo`);

--
-- Índices de tabela `erro`
--
ALTER TABLE `erro`
  ADD PRIMARY KEY (`erro_id`);

--
-- Índices de tabela `exemplo_erro`
--
ALTER TABLE `exemplo_erro`
  ADD PRIMARY KEY (`exemplo_erro_id`),
  ADD KEY `erro_id` (`erro_id`);

--
-- Índices de tabela `premissa`
--
ALTER TABLE `premissa`
  ADD PRIMARY KEY (`premissa_id`),
  ADD KEY `argumento_id_premissa` (`argumento_id_premissa`);

--
-- Índices de tabela `premissa_erro`
--
ALTER TABLE `premissa_erro`
  ADD PRIMARY KEY (`premissa_erro_id`),
  ADD KEY `premissa_id` (`premissa_id`),
  ADD KEY `erro_id` (`erro_id`);

--
-- Índices de tabela `resposta`
--
ALTER TABLE `resposta`
  ADD PRIMARY KEY (`resposta_id`),
  ADD KEY `debate_id_resposta` (`debate_id_resposta`);

--
-- Índices de tabela `resposta_erro`
--
ALTER TABLE `resposta_erro`
  ADD PRIMARY KEY (`resposta_erro_id`),
  ADD KEY `resposta_id` (`resposta_id`),
  ADD KEY `erro_id` (`erro_id`);

--
-- Índices de tabela `tipo_erro`
--
ALTER TABLE `tipo_erro`
  ADD PRIMARY KEY (`tipo_erro_id`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Índices de tabela `usuario_argumento_erro`
--
ALTER TABLE `usuario_argumento_erro`
  ADD PRIMARY KEY (`usuario_argumento_erro_id`),
  ADD KEY `argumento_erro_id` (`argumento_erro_id`);

--
-- Índices de tabela `usuario_debate`
--
ALTER TABLE `usuario_debate`
  ADD PRIMARY KEY (`usuario_debate_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `debate_id` (`debate_id`);

--
-- Índices de tabela `usuario_premissa_erro`
--
ALTER TABLE `usuario_premissa_erro`
  ADD PRIMARY KEY (`usuario_premissa_erro_id`),
  ADD KEY `premissa_erro_id` (`premissa_erro_id`);

--
-- Índices de tabela `usuario_resposta_erro`
--
ALTER TABLE `usuario_resposta_erro`
  ADD PRIMARY KEY (`usuario_resposta_erro_id`),
  ADD KEY `resposta_erro_id` (`resposta_erro_id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `argumento`
--
ALTER TABLE `argumento`
  MODIFY `argumento_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `argumento_erro`
--
ALTER TABLE `argumento_erro`
  MODIFY `argumento_erro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `debate`
--
ALTER TABLE `debate`
  MODIFY `debate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `erro`
--
ALTER TABLE `erro`
  MODIFY `erro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `exemplo_erro`
--
ALTER TABLE `exemplo_erro`
  MODIFY `exemplo_erro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `premissa`
--
ALTER TABLE `premissa`
  MODIFY `premissa_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `premissa_erro`
--
ALTER TABLE `premissa_erro`
  MODIFY `premissa_erro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `resposta`
--
ALTER TABLE `resposta`
  MODIFY `resposta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `resposta_erro`
--
ALTER TABLE `resposta_erro`
  MODIFY `resposta_erro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_erro`
--
ALTER TABLE `tipo_erro`
  MODIFY `tipo_erro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario_argumento_erro`
--
ALTER TABLE `usuario_argumento_erro`
  MODIFY `usuario_argumento_erro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_debate`
--
ALTER TABLE `usuario_debate`
  MODIFY `usuario_debate_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_premissa_erro`
--
ALTER TABLE `usuario_premissa_erro`
  MODIFY `usuario_premissa_erro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_resposta_erro`
--
ALTER TABLE `usuario_resposta_erro`
  MODIFY `usuario_resposta_erro_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
