
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
  `idProjeto` int(11) NULL,
  `ordem` int(11) NULL,
  `idUsuario` int(11) NULL,
  `mensagem` text NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcurtidas`
--

DROP TABLE IF EXISTS `tbcurtidas`;
CREATE TABLE IF NOT EXISTS `tbcurtidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NULL,
  `idProjeto` int(11) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbgrupo`
--

DROP TABLE IF EXISTS `tbgrupo`;
CREATE TABLE IF NOT EXISTS `tbgrupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbgrupogrupo`
--

DROP TABLE IF EXISTS `tbgrupogrupo`;
CREATE TABLE IF NOT EXISTS `tbgrupogrupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPai` int(11) NULL,
  `idFilho` int(11) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbgrupoprojeto`
--

DROP TABLE IF EXISTS `tbgrupoprojeto`;
CREATE TABLE IF NOT EXISTS `tbgrupoprojeto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idGrupo` int(11) NULL,
  `idProjeto` int(11) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbprojeto`
--

DROP TABLE IF EXISTS `tbprojeto`;
CREATE TABLE IF NOT EXISTS `tbprojeto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(1000) NULL,
  `urlVideo` varchar(1000) NULL,
  `passosJson` text NULL,
  `custosJson` text NULL,
  `materiaisJson` text NULL,
  `idUsuario` int(11) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtag`
--

DROP TABLE IF EXISTS `tbtag`;
CREATE TABLE IF NOT EXISTS `tbtag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtagprojetos`
--

DROP TABLE IF EXISTS `tbtagprojeto`;
CREATE TABLE IF NOT EXISTS `tbtagprojeto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProjeto` int(11) NULL,
  `idTag` int(11) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbusuario`
--

DROP TABLE IF EXISTS `tbusuario`;
CREATE TABLE IF NOT EXISTS `tbusuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(500) NULL,
  `foto` varchar(500) NULL,
  `email` varchar(200) NULL,
  `hashSenha` varchar(500) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbmensagem`
--

DROP TABLE IF EXISTS `tbmensagem`;
CREATE TABLE IF NOT EXISTS `tbmensagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEmissor` int(11) NULL,
  `idDestinatario` int(11) NULL,
  `ordem` int(11) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;