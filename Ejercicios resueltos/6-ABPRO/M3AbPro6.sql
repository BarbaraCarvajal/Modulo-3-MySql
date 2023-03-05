-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema capemp2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema capemp2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `capemp2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `capemp2` ;

-- -----------------------------------------------------
-- Table `capemp2`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capemp2`.`cliente` (
  `rutCliente` INT NOT NULL,
  `Nombres` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `Apellidos` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `Telefono` VARCHAR(20) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `AFP` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  `SistemaSalud` INT NULL DEFAULT NULL,
  `Direccion` VARCHAR(70) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  `Comuna` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  `Edad` INT NOT NULL,
  PRIMARY KEY (`rutCliente`),
  UNIQUE INDEX `uk_telefono` (`Telefono` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `capemp2`.`accidente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capemp2`.`accidente` (
  `idAccidente` INT NOT NULL,
  `Dia` DATE NULL DEFAULT NULL,
  `Hora` TIME NOT NULL,
  `Lugar` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `Origen` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  `Consecuencias` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  `Cliente_rutCliente` INT NOT NULL,
  PRIMARY KEY (`idAccidente`),
  INDEX `Cliente_rutCliente` (`Cliente_rutCliente` ASC) VISIBLE,
  CONSTRAINT `accidente_ibfk_1`
    FOREIGN KEY (`Cliente_rutCliente`)
    REFERENCES `capemp2`.`cliente` (`rutCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `capemp2`.`capacitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capemp2`.`capacitacion` (
  `idCapacitacion` INT NOT NULL AUTO_INCREMENT,
  `Cliente_rutCliente` INT(9) NOT NULL,
  `dia` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  `hora` VARCHAR(5) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  `lugar` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NOT NULL,
  `duracion` INT NOT NULL,
  `cantAsistentes` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idCapacitacion`),
  INDEX `rutCliente_idx` (`Cliente_rutCliente` ASC) VISIBLE,
  CONSTRAINT `rutCliente`
    FOREIGN KEY (`Cliente_rutCliente`)
    REFERENCES `capemp2`.`cliente` (`rutCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `capemp2`.`asistentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capemp2`.`asistentes` (
  `idAsistentes` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_spanish_ci' NULL DEFAULT NULL,
  `edad` INT NULL DEFAULT NULL,
  `capacitacion_idCapacitacion` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idAsistentes`),
  UNIQUE INDEX `nombres_unicos` (`nombres` ASC) VISIBLE,
  INDEX `capacitacion_idCapacitacion` (`capacitacion_idCapacitacion` ASC) VISIBLE,
  CONSTRAINT `capacitacion_idCapacitacion`
    FOREIGN KEY (`capacitacion_idCapacitacion`)
    REFERENCES `capemp2`.`capacitacion` (`idCapacitacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_spanish_ci;


-- -----------------------------------------------------
-- Table `capemp2`.`visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capemp2`.`visita` (
  `idVisita` INT NOT NULL,
  `VisFecha` DATE NOT NULL,
  `VisHora` DATE NULL DEFAULT NULL,
  `visLugar` VARCHAR(50) NOT NULL,
  `visComentarios` VARCHAR(250) NOT NULL,
  `Cliente_rutCliente` INT NOT NULL,
  PRIMARY KEY (`idVisita`),
  INDEX `rutCliente_idx` (`Cliente_rutCliente` ASC) VISIBLE,
  CONSTRAINT `rutCliente`
    FOREIGN KEY (`Cliente_rutCliente`)
    REFERENCES `capemp2`.`cliente` (`rutCliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
