-- MySQL Script generated by MySQL Workbench
-- Sun Mar 17 05:27:17 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema wmktranslation
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `wmktranslation` ;

-- -----------------------------------------------------
-- Schema wmktranslation
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wmktranslation` DEFAULT CHARACTER SET utf8 ;
USE `wmktranslation` ;

-- -----------------------------------------------------
-- Table `wmktranslation`.`language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wmktranslation`.`language` ;

CREATE TABLE IF NOT EXISTS `wmktranslation`.`language` (
  `LanguageId` CHAR(36) NOT NULL,
  `FromToLanguage` VARCHAR(46) CHARACTER SET 'utf8' NOT NULL,
  `Description` VARCHAR(60) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`LanguageId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wmktranslation`.`translator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wmktranslation`.`translator` ;

CREATE TABLE IF NOT EXISTS `wmktranslation`.`translator` (
  `Id` CHAR(36) NOT NULL,
  `StartDate` DATE NULL DEFAULT NULL,
  `Bio` VARCHAR(256) NULL DEFAULT NULL,
  `ActivityStatus` TINYINT NULL DEFAULT '1',
  `ImageUrl` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wmktranslation`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wmktranslation`.`user` ;

CREATE TABLE IF NOT EXISTS `wmktranslation`.`user` (
  `Id` CHAR(36) NOT NULL,
  `FirstName` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `LastName` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `Telephone` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `Address` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
  `PasswordHash` VARBINARY(256) NULL DEFAULT NULL,
  `PasswordSalt` VARBINARY(256) NULL DEFAULT NULL,
  `Role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wmktranslation`.`translationorder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `wmktranslation`.`translationorder` ;

CREATE TABLE IF NOT EXISTS `wmktranslation`.`translationorder` (
  `TranslationOrderId` CHAR(36) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `DocumentTitle` VARCHAR(45) NOT NULL,
  `Category` VARCHAR(45) NULL DEFAULT NULL,
  `IssuingOrganization` VARCHAR(45) NULL DEFAULT NULL,
  `Price` DECIMAL(10,0) NOT NULL,
  `LanguageId` CHAR(36) NOT NULL,
  `UserId` CHAR(36) NOT NULL,
  `TranslatorId` CHAR(36) NOT NULL,
  PRIMARY KEY (`TranslationOrderId`),
  INDEX `fk_TranslationOrder_Language_idx` (`LanguageId` ASC) VISIBLE,
  INDEX `fk_TranslationOrder_Customer1_idx` (`UserId` ASC) VISIBLE,
  INDEX `fk_TranslationOrder_Translator1_idx` (`TranslatorId` ASC) VISIBLE,
  CONSTRAINT `fk_TranslationOrder_Language`
    FOREIGN KEY (`LanguageId`)
    REFERENCES `wmktranslation`.`language` (`LanguageId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_translationorder_translator1`
    FOREIGN KEY (`TranslatorId`)
    REFERENCES `wmktranslation`.`translator` (`Id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_translationorder_user1`
    FOREIGN KEY (`UserId`)
    REFERENCES `wmktranslation`.`user` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
