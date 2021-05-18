
CREATE TABLE `tbcontato` (
  `idcontato` bigint(20) NOT NULL AUTO_INCREMENT,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`idcontato`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
