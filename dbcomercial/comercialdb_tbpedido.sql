
CREATE TABLE `tbpedido` (
  `idpedido` bigint(20) NOT NULL AUTO_INCREMENT,
  `idusuario` bigint(20) NOT NULL,
  `datahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idpedido`),
  KEY `fk_pedido_pk_usuario_idx` (`idusuario`),
  CONSTRAINT `fk_pedido_pk_usuario` FOREIGN KEY (`idusuario`) REFERENCES `tbusuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

