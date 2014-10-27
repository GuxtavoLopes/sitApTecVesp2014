SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `sitap`.`Usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT ,
  `Nome` VARCHAR(45) NULL ,
  `Senha` VARCHAR(45) NULL ,
  `Email` VARCHAR(45) NULL ,
  `Endereco` VARCHAR(45) NULL ,
  `Telefone` INT NULL ,
  `Foto` VARCHAR(50) NULL ,
  PRIMARY KEY (`idUsuario`) ,
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`Artigo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`Artigo` (
  `idArtigo` INT NOT NULL AUTO_INCREMENT ,
  `Titulo` VARCHAR(45) NULL ,
  `Corpo` TEXT NULL ,
  `Data` DATETIME NULL ,
  `Usuario_idUsuario` INT NOT NULL ,
  `like` VARCHAR(45) NULL COMMENT 'Quantidade de curtidas que o artigo recebe.' ,
  PRIMARY KEY (`idArtigo`) ,
  INDEX `fk_Artigo_Usuario1` (`Usuario_idUsuario` ASC) ,
  CONSTRAINT `fk_Artigo_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario` )
    REFERENCES `sitap`.`Usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`Comentario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`Comentario` (
  `idcomentario` INT NOT NULL AUTO_INCREMENT ,
  `idUsuario` INT NOT NULL ,
  `idArtigo` INT NOT NULL ,
  `Corpo` VARCHAR(45) NULL ,
  `data` DATETIME NULL ,
  INDEX `fk_Usuario_has_Artigo_Artigo1` (`idArtigo` ASC) ,
  INDEX `fk_Usuario_has_Artigo_Usuario` (`idUsuario` ASC) ,
  PRIMARY KEY (`idcomentario`) ,
  CONSTRAINT `fk_Usuario_has_Artigo_Usuario`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `sitap`.`Usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Artigo_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `sitap`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`Foto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`Foto` (
  `idFoto` INT NOT NULL AUTO_INCREMENT ,
  `Arquivo` VARCHAR(45) NULL ,
  `idArtigo` INT NOT NULL ,
  PRIMARY KEY (`idFoto`) ,
  INDEX `fk_Foto_Artigo1` (`idArtigo` ASC) ,
  CONSTRAINT `fk_Foto_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `sitap`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`Categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`Categoria` (
  `idCategoria` INT NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  `Descricao` VARCHAR(100) NULL ,
  `Data` DATETIME NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`Categoria_has_Artigo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`Categoria_has_Artigo` (
  `idCategoria` INT NOT NULL ,
  `idArtigo` INT NOT NULL ,
  PRIMARY KEY (`idCategoria`, `idArtigo`) ,
  INDEX `fk_Categoria_has_Artigo_Artigo1` (`idArtigo` ASC) ,
  INDEX `fk_Categoria_has_Artigo_Categoria1` (`idCategoria` ASC) ,
  CONSTRAINT `fk_Categoria_has_Artigo_Categoria1`
    FOREIGN KEY (`idCategoria` )
    REFERENCES `sitap`.`Categoria` (`idCategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Categoria_has_Artigo_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `sitap`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
