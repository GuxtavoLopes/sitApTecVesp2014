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
  `Endereço` VARCHAR(45) NULL ,
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
  `idArtigo` INT NOT NULL ,
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
-- Table `mydb`.`Fotos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Fotos` (
  `idfotos` INT NOT NULL ,
  `Artigo_idArtigo` INT NOT NULL ,
  PRIMARY KEY (`idfotos`) ,
  INDEX `fk_Fotos_Artigo` (`Artigo_idArtigo` ASC) ,
  CONSTRAINT `fk_Fotos_Artigo`
    FOREIGN KEY (`Artigo_idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comentarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Comentarios` (
  `idComentarios` INT NOT NULL ,
  `Artigo_idArtigo` INT NOT NULL ,
  `Usuario_idUsuario` INT NOT NULL ,
  PRIMARY KEY (`idComentarios`) ,
  INDEX `fk_Comentarios_Artigo1` (`Artigo_idArtigo` ASC) ,
  INDEX `fk_Comentarios_Usuario1` (`Usuario_idUsuario` ASC) ,
  CONSTRAINT `fk_Comentarios_Artigo1`
    FOREIGN KEY (`Artigo_idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentarios_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario` )
    REFERENCES `mydb`.`Usuario` (`idUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT ,
  `Nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Artigo_has_Categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Artigo_has_Categoria` (
  `Artigo_idArtigo` INT NOT NULL ,
  `Categoria_idCategoria` INT NOT NULL ,
  PRIMARY KEY (`Artigo_idArtigo`, `Categoria_idCategoria`) ,
  INDEX `fk_Artigo_has_Categoria_Categoria1` (`Categoria_idCategoria` ASC) ,
  INDEX `fk_Artigo_has_Categoria_Artigo1` (`Artigo_idArtigo` ASC) ,
  CONSTRAINT `fk_Artigo_has_Categoria_Artigo1`
    FOREIGN KEY (`Artigo_idArtigo` )
    REFERENCES `mydb`.`Artigo` (`idArtigo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artigo_has_Categoria_Categoria1`
    FOREIGN KEY (`Categoria_idCategoria` )
    REFERENCES `mydb`.`Categoria` (`idCategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
