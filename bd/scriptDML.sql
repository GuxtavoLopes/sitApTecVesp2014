-- -----------------------------------------------------
-- Data for table `sitap`.`Usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`Usuario` (`idUsuario`, `Nome`, `Senha`, `Email`, `Endereco`, `Telefone`, `Foto`) VALUES (1, 'Joao', '1234', 'jo@hotmail.com', '1° de Maio', 4766565522, 'http://lorempixel.com/output/people-q-c-330-330-3.jpg');
INSERT INTO `sitap`.`Usuario` (`idUsuario`, `Nome`, `Senha`, `Email`, `Endereco`, `Telefone`, `Foto`) VALUES (2, 'Maria', '1234', 'ma@hotmail.com', 'joaqui tavora', 4733502211, 'http://lorempixel.com/output/people-q-c-330-330-10.jpg');
INSERT INTO `sitap`.`Usuario` (`idUsuario`, `Nome`, `Senha`, `Email`, `Endereco`, `Telefone`, `Foto`) VALUES (3, 'anonimo', 'anonimo123', NULL, NULL, NULL, NULL);
INSERT INTO `sitap`.`Usuario` (`idUsuario`, `Nome`, `Senha`, `Email`, `Endereco`, `Telefone`, `Foto`) VALUES (4, 'admin', 'admin123', 'adm@hotmail.com', 'sao joao batista', 4788996655, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`Artigo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`Artigo` (`idArtigo`, `Titulo`, `Corpo`, `Data`, `Usuario_idUsuario`, `like`) VALUES (1, 'A pizza nossa de cada dia que nos dai hoje', '<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>', '2014-10-27 16:42:13', 1, '15');
INSERT INTO `sitap`.`Artigo` (`idArtigo`, `Titulo`, `Corpo`, `Data`, `Usuario_idUsuario`, `like`) VALUES (2, 'O bacon faz mal pro corpo', '<p>Bacon ipsum dolor amet doner pork chop ham brisket. Bacon meatball meatloaf hamburger. Porchetta turkey leberkas, ball tip fatback sirloin beef ribs. Salami shoulder drumstick, chuck capicola filet mignon shankle ham ground round tri-tip frankfurter pork jowl.</p><p>Bacon ipsum dolor amet doner pork chop ham brisket. Bacon meatball meatloaf hamburger. Porchetta turkey leberkas, ball tip fatback sirloin beef ribs. Salami shoulder drumstick, chuck capicola filet mignon shankle ham ground round tri-tip frankfurter pork jowl.</p><p>Bacon ipsum dolor amet doner pork chop ham brisket. Bacon meatball meatloaf hamburger. Porchetta turkey leberkas, ball tip fatback sirloin beef ribs. Salami shoulder drumstick, chuck capicola filet mignon shankle ham ground round tri-tip frankfurter pork jowl.</p>', '2014-10-27 16:50:35', 3, '10');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`Comentario`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`Comentario` (`idcomentario`, `idUsuario`, `idArtigo`, `Corpo`, `data`) VALUES (1, 1, 1, 'Que Pizza boa !!', '2014-10-27 16:50:50');
INSERT INTO `sitap`.`Comentario` (`idcomentario`, `idUsuario`, `idArtigo`, `Corpo`, `data`) VALUES (2, 2, 2, 'que Bacon ótimo!!', '2014-10-27 16:55:50');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`Foto`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`Foto` (`idFoto`, `Arquivo`, `idArtigo`) VALUES (1, 'http://lorempizza.com/514/300', 1);
INSERT INTO `sitap`.`Foto` (`idFoto`, `Arquivo`, `idArtigo`) VALUES (2, 'http://lorempizza.com/514/300', 1);
INSERT INTO `sitap`.`Foto` (`idFoto`, `Arquivo`, `idArtigo`) VALUES (3, 'http://img1.wikia.nocookie.net/__cb20121011210330/loremipsum/images/1/10/Lp-bacon.png', 2);
INSERT INTO `sitap`.`Foto` (`idFoto`, `Arquivo`, `idArtigo`) VALUES (4, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtaZH1NZWs9Sf8MYsNP7UaGCd9rP9ypwlgNtfXKJjmTR3hcGec', 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`Categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`Categoria` (`idCategoria`, `Nome`, `Descricao`, `Data`) VALUES (1, 'Pizza', 'Categoria que fala sobre Pizza', NULL);
INSERT INTO `sitap`.`Categoria` (`idCategoria`, `Nome`, `Descricao`, `Data`) VALUES (2, 'Bacon', 'Caregoria que fala sobre Bacon', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sitap`.`Categoria_has_Artigo`
-- -----------------------------------------------------
START TRANSACTION;
USE `sitap`;
INSERT INTO `sitap`.`Categoria_has_Artigo` (`idCategoria`, `idArtigo`) VALUES (1, 1);
INSERT INTO `sitap`.`Categoria_has_Artigo` (`idCategoria`, `idArtigo`) VALUES (2, 2);

COMMIT;
