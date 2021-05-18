
CREATE TABLE `tbproduto` (
  `idproduto` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomeproduto` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idproduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
