
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

