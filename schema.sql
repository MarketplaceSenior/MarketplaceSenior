CREATE SCHEMA `marketplace` ;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema marketplace
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema marketplace
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `marketplace` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `marketplace` ;

-- -----------------------------------------------------
-- Table `marketplace`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marketplace`.`users` (
  `idu` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` LONGTEXT NOT NULL,
  `rols` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `marketplace`.`browses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marketplace`.`browses` (
  `idb` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idb`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `marketplace`.`categorys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marketplace`.`categorys` (
  `idcat` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `image` LONGTEXT NOT NULL,
  `browses_idb` INT NOT NULL,
  PRIMARY KEY (`idcat`),
  INDEX `fk_categorys_browses_idx` (`browses_idb` ASC) VISIBLE,
  CONSTRAINT `fk_categorys_browses`
    FOREIGN KEY (`browses_idb`)
    REFERENCES `marketplace`.`browses` (`idb`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `marketplace`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marketplace`.`product` (
  `idp` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `image` LONGTEXT NOT NULL,
  `lastprice` INT NOT NULL,
  `newprice` INT NOT NULL,
  `categorys_idcat` INT NOT NULL,
  `users_idu` INT NOT NULL,
  `rate` INT NOT NULL,
  PRIMARY KEY (`idp`),
  INDEX `fk_product_categorys1_idx` (`categorys_idcat` ASC) VISIBLE,
  INDEX `fk_product_users1_idx` (`users_idu` ASC) VISIBLE,
  CONSTRAINT `fk_product_categorys1`
    FOREIGN KEY (`categorys_idcat`)
    REFERENCES `marketplace`.`categorys` (`idcat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_users1`
    FOREIGN KEY (`users_idu`)
    REFERENCES `marketplace`.`users` (`idu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
ALTER TABLE `marketplace`.`product` 
CHANGE COLUMN `image` `image` JSON NOT NULL ;

