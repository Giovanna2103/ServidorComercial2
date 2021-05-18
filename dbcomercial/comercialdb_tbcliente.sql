
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

