-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Ficha11
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ficha11
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ficha11` DEFAULT CHARACTER SET utf8 ;
USE `Ficha11` ;

-- -----------------------------------------------------
-- Table `Ficha11`.`Docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ficha11`.`Docente` (
  `codDocente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codDocente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ficha11`.`Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ficha11`.`Disciplina` (
  `codUC` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `codDocente` INT NOT NULL,
  PRIMARY KEY (`codUC`),
  INDEX `fk_Disciplina_Docente_idx` (`codDocente` ASC),
  CONSTRAINT `fk_Disciplina_Docente`
    FOREIGN KEY (`codDocente`)
    REFERENCES `Ficha11`.`Docente` (`codDocente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ficha11`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ficha11`.`Curso` (
  `idCurso` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ficha11`.`Exame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ficha11`.`Exame` (
  `idExame` INT NOT NULL,
  `codUC` INT NOT NULL,
  `Data` DATE NOT NULL,
  PRIMARY KEY (`idExame`),
  INDEX `fk_Exame_Disciplina1_idx` (`codUC` ASC),
  CONSTRAINT `fk_Exame_Disciplina1`
    FOREIGN KEY (`codUC`)
    REFERENCES `Ficha11`.`Disciplina` (`codUC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ficha11`.`Quest�o`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ficha11`.`Quest�o` (
  `num` INT NOT NULL,
  `enunciado` TEXT NOT NULL,
  `dificuldade` INT NOT NULL,
  PRIMARY KEY (`num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ficha11`.`curso_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ficha11`.`curso_disciplina` (
  `idCurso` INT NOT NULL,
  `codUC` INT NOT NULL,
  PRIMARY KEY (`idCurso`, `codUC`),
  INDEX `fk_Curso_has_Disciplina_Disciplina1_idx` (`codUC` ASC),
  INDEX `fk_Curso_has_Disciplina_Curso1_idx` (`idCurso` ASC),
  CONSTRAINT `fk_Curso_has_Disciplina_Curso1`
    FOREIGN KEY (`idCurso`)
    REFERENCES `Ficha11`.`Curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Disciplina_Disciplina1`
    FOREIGN KEY (`codUC`)
    REFERENCES `Ficha11`.`Disciplina` (`codUC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ficha11`.`Exame_Quest�o`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ficha11`.`Exame_Quest�o` (
  `Exame_idExame` INT NOT NULL,
  `Quest�o_num` INT NOT NULL,
  `Pontua�ao` INT NOT NULL,
  `Ordem` INT NOT NULL,
  PRIMARY KEY (`Exame_idExame`, `Quest�o_num`),
  INDEX `fk_Exame_has_Quest�o_Quest�o1_idx` (`Quest�o_num` ASC),
  INDEX `fk_Exame_has_Quest�o_Exame1_idx` (`Exame_idExame` ASC),
  CONSTRAINT `fk_Exame_has_Quest�o_Exame1`
    FOREIGN KEY (`Exame_idExame`)
    REFERENCES `Ficha11`.`Exame` (`idExame`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Exame_has_Quest�o_Quest�o1`
    FOREIGN KEY (`Quest�o_num`)
    REFERENCES `Ficha11`.`Quest�o` (`num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
