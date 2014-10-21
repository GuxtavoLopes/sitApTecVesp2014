SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT ,
  `Nome` VARCHAR(45) NOT NULL ,
  `Senha` VARCHAR(45) NOT NULL ,
  `Email` VARCHAR(45) NOT NULL ,
  `Endereco` VARCHAR(45) NULL ,
  `Telefone` INT NULL ,
  `Foto` VARCHAR(50) NULL ,
  PRIMARY KEY (`idUsuario`) ,
  UNIQUE INDEX `Nome_UNIQUE` (`Nome` ASC) ,
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Artigo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Artigo` (
  `idArtigo` INT NOT NULL AUTO_INCREMENT ,
  `Titulo` VARCHAR(45) NULL ,
  `Corpo` TEXT NULL ,
  `Data` DATETIME NULL ,
  `Usuario_idUsuario` INT NOT NULL ,
  PRIMARY KEY (`idArtigo`) ,
  INDEX `fk_Artigo_Usuario1` (`Usuario_idUsuario` ASC) ,
  CONSTRAINT `fk_Artigo_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario` )
    REFERENCES `mydb`.`Usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comentario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Comentario` (
  `idUsuario` INT NOT NULL ,
  `idArtigo` INT NOT NULL ,
  `Corpo` VARCHAR(45) NULL ,
  INDEX `fk_Usuario_has_Artigo_Artigo1` (`idArtigo` ASC) ,
  INDEX `fk_Usuario_has_Artigo_Usuario` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Artigo_Usuario`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `mydb`.`Usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Artigo_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Foto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Foto` (
  `idFoto` INT NOT NULL ,
  `Arquivo` VARCHAR(45) NULL ,
  `idArtigo` INT NOT NULL ,
  PRIMARY KEY (`idFoto`) ,
  INDEX `fk_Foto_Artigo1` (`idArtigo` ASC) ,
  CONSTRAINT `fk_Foto_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `idCategoria` INT NOT NULL ,
  `Nome` VARCHAR(45) NULL ,
  `Descricao` VARCHAR(100) NULL ,
  `Data` DATETIME NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria_has_Artigo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Categoria_has_Artigo` (
  `idCategoria` INT NOT NULL ,
  `idArtigo` INT NOT NULL ,
  PRIMARY KEY (`idCategoria`, `idArtigo`) ,
  INDEX `fk_Categoria_has_Artigo_Artigo1` (`idArtigo` ASC) ,
  INDEX `fk_Categoria_has_Artigo_Categoria1` (`idCategoria` ASC) ,
  CONSTRAINT `fk_Categoria_has_Artigo_Categoria1`
    FOREIGN KEY (`idCategoria` )
    REFERENCES `mydb`.`Categoria` (`idCategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Categoria_has_Artigo_Artigo1`
    FOREIGN KEY (`idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
