-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Portfolio` DEFAULT CHARACTER SET utf8 ;
USE `Portfolio` ;

-- -----------------------------------------------------
-- Table `Portfolio`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`perfil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `fechaNac` DATE NULL,
  `email` VARCHAR(77) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`estudioCursado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`estudioCursado` (
  `id` INT NOT NULL,
  `nombreInstitucion` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NULL,
  `perfil_id` INT NOT NULL,
  PRIMARY KEY (`id`, `perfil_id`),
  INDEX `fk_estudioCursado_perfil1_idx` (`perfil_id` ASC) VISIBLE,
  CONSTRAINT `fk_estudioCursado_perfil1`
    FOREIGN KEY (`perfil_id`)
    REFERENCES `Portfolio`.`perfil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`tipo_empleo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`tipo_empleo` (
  `id` INT NOT NULL,
  `nombre_tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio`.`experienciaLaboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio`.`experienciaLaboral` (
  `id` INT NOT NULL,
  `nombreEmpresa` VARCHAR(45) NOT NULL,
  `puesto` VARCHAR(45) NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NULL,
  `esActual` TINYINT NULL,
  `descripcion` VARCHAR(256) NULL,
  `perfil_id` INT NOT NULL,
  `tipo_empleo_id` INT NOT NULL,
  PRIMARY KEY (`id`, `perfil_id`, `tipo_empleo_id`),
  INDEX `fk_experienciaLaboral_perfil_idx` (`perfil_id` ASC) VISIBLE,
  INDEX `fk_experienciaLaboral_tipo_empleo1_idx` (`tipo_empleo_id` ASC) VISIBLE,
  CONSTRAINT `fk_experienciaLaboral_perfil`
    FOREIGN KEY (`perfil_id`)
    REFERENCES `Portfolio`.`perfil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experienciaLaboral_tipo_empleo1`
    FOREIGN KEY (`tipo_empleo_id`)
    REFERENCES `Portfolio`.`tipo_empleo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
