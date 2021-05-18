CREATE DATABASE comercialdb;
USE comercialdb;

CREATE TABLE `tbusuario` (
  `idusuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomeusuario` varchar(50) CHARACTER SET latin1 NOT NULL,
  `senha` varchar(200) CHARACTER SET latin1 NOT NULL,
  `datacriacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `nomeusuario` (`nomeusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbcontato` (
  `idcontato` bigint(20) NOT NULL AUTO_INCREMENT,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`idcontato`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbendereco` (
  `idendereco` bigint(20) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(45) NOT NULL,
  `cep` varchar(10) NOT NULL,
  PRIMARY KEY (`idendereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbcliente` (
  `idcliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomecliente` varchar(50) NOT NULL,
  `cpf` varchar(13) NOT NULL,
  `sexo` char(2) NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `idusuario` bigint(20) NOT NULL,
  `idcontato` bigint(20) NOT NULL,
  `idendereco` bigint(20) NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  UNIQUE KEY `idcontato_UNIQUE` (`idcontato`),
  UNIQUE KEY `idendereco_UNIQUE` (`idendereco`),
  CONSTRAINT `fk_cliente_pk_contato` FOREIGN KEY (`idcontato`) REFERENCES `tbcontato` (`idcontato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_pk_endereco` FOREIGN KEY (`idendereco`) REFERENCES `tbendereco` (`idendereco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_pk_usuario` FOREIGN KEY (`idusuario`) REFERENCES `tbusuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbproduto` (
  `idproduto` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomeproduto` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbpedido` (
  `idpedido` bigint(20) NOT NULL AUTO_INCREMENT,
  `idusuario` bigint(20) NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idpedido`),
  KEY `fk_pedido_pk_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_pedido_pk_usuario` FOREIGN KEY (`idusuario`) REFERENCES `tbusuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `tbitenspedido` (
  `iditenspedido` bigint(20) NOT NULL AUTO_INCREMENT,
  `idpedido` bigint(20) NOT NULL,
  `idproduto` bigint(20) NOT NULL,
  `quantidadecomprada` int(11) NOT NULL DEFAULT '1',
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`iditenspedido`),
  KEY `fk_itens_pk_pedido_idx` (`idpedido`),
  KEY `fk_itens_pk_produto_idx` (`idproduto`),
  CONSTRAINT `fk_itens_pk_pedido` FOREIGN KEY (`idpedido`) REFERENCES `tbpedido` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_pk_produto` FOREIGN KEY (`idproduto`) REFERENCES `tbproduto` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


