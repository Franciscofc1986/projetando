
--
-- Database: `projetando`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcomentario`
--

DROP TABLE IF EXISTS `tbcomentario`;
CREATE TABLE IF NOT EXISTS `tbcomentario` (
  `idComentario` int(11) NOT NULL,
  `idProjeto` int(11) NOT NULL,
  `ordem` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `mensagem` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcurtidas`
--

DROP TABLE IF EXISTS `tbcurtidas`;
CREATE TABLE IF NOT EXISTS `tbcurtidas` (
  `idCurtida` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idProjeto` int(11) NOT NULL,
  PRIMARY KEY (`idCurtida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbgrupo`
--

DROP TABLE IF EXISTS `tbgrupo`;
CREATE TABLE IF NOT EXISTS `tbgrupo` (
  `idGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nomeGrupo` varchar(500) NOT NULL,
  PRIMARY KEY (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbgrupogrupo`
--

DROP TABLE IF EXISTS `tbgrupogrupo`;
CREATE TABLE IF NOT EXISTS `tbgrupogrupo` (
  `idGrupoGrupo` int(11) NOT NULL AUTO_INCREMENT,
  `idGrupoPai` int(11) NOT NULL,
  `idGrupoFilho` int(11) NOT NULL,
  PRIMARY KEY (`idGrupoGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbprojeto`
--

DROP TABLE IF EXISTS `tbprojeto`;
CREATE TABLE IF NOT EXISTS `tbprojeto` (
  `idProjeto` int(11) NOT NULL AUTO_INCREMENT,
  `urlVideo` varchar(1000) NOT NULL,
  `passosJson` text NOT NULL,
  `custosJson` text NOT NULL,
  `materiaisJson` text NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idProjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtag`
--

DROP TABLE IF EXISTS `tbtag`;
CREATE TABLE IF NOT EXISTS `tbtag` (
  `idTag` int(11) NOT NULL AUTO_INCREMENT,
  `nomeTag` varchar(500) NOT NULL,
  PRIMARY KEY (`idTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbtagprojetos`
--

DROP TABLE IF EXISTS `tbtagprojetos`;
CREATE TABLE IF NOT EXISTS `tbtagprojetos` (
  `idTagProjeto` int(11) NOT NULL AUTO_INCREMENT,
  `idProjeto` int(11) NOT NULL,
  `idTag` int(11) NOT NULL,
  PRIMARY KEY (`idTagProjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbusuario`
--

DROP TABLE IF EXISTS `tbusuario`;
CREATE TABLE IF NOT EXISTS `tbusuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nomeUsuario` varchar(500) NOT NULL,
  `foto` varchar(500) NOT NULL,
  `email` varchar(200) NOT NULL,
  `hashSenha` varchar(500) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbmensagem`
--

DROP TABLE IF EXISTS `tbmensagem`;
CREATE TABLE IF NOT EXISTS `tbmensagem` (
  `idMensagem` int(11) NOT NULL AUTO_INCREMENT,
  `idUsarioEmissor` int(11) NOT NULL,
  `idUsuarioDestinatario` int(11) NOT NULL,
  `ordem` int(11) NOT NULL,
  PRIMARY KEY (`idMensagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;