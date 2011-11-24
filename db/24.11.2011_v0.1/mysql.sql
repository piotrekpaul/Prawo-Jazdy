SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `naukajazdy` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `naukajazdy` ;

-- -----------------------------------------------------
-- Table `naukajazdy`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `naukajazdy`.`users` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `surname` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `naukajazdy`.`cars`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `naukajazdy`.`cars` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `maintance` DATE NULL ,
  `insurance` DATE NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `naukajazdy`.`instructor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `naukajazdy`.`instructor` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `surname` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `naukajazdy`.`costs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `naukajazdy`.`costs` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `price` FLOAT NULL ,
  `status` ENUM('paid', 'pending') NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `naukajazdy`.`cars_has_costs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `naukajazdy`.`cars_has_costs` (
  `cars_id` INT NOT NULL ,
  `costs_id` INT NOT NULL ,
  PRIMARY KEY (`cars_id`, `costs_id`) ,
  INDEX `fk_cars_has_costs_costs1` (`costs_id` ASC) ,
  INDEX `fk_cars_has_costs_cars` (`cars_id` ASC) ,
  CONSTRAINT `fk_cars_has_costs_cars`
    FOREIGN KEY (`cars_id` )
    REFERENCES `naukajazdy`.`cars` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_has_costs_costs1`
    FOREIGN KEY (`costs_id` )
    REFERENCES `naukajazdy`.`costs` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `naukajazdy`.`instructor_has_costs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `naukajazdy`.`instructor_has_costs` (
  `instructor_id` INT NOT NULL ,
  `costs_id` INT NOT NULL ,
  PRIMARY KEY (`instructor_id`, `costs_id`) ,
  INDEX `fk_instructor_has_costs_costs1` (`costs_id` ASC) ,
  INDEX `fk_instructor_has_costs_instructor1` (`instructor_id` ASC) ,
  CONSTRAINT `fk_instructor_has_costs_instructor1`
    FOREIGN KEY (`instructor_id` )
    REFERENCES `naukajazdy`.`instructor` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_instructor_has_costs_costs1`
    FOREIGN KEY (`costs_id` )
    REFERENCES `naukajazdy`.`costs` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `naukajazdy`.`incoms`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `naukajazdy`.`incoms` (
  `id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `value` FLOAT NULL ,
  `status` ENUM('paid', 'pending') NULL ,
  `users_id` INT NOT NULL ,
  INDEX `fk_table1_users1` (`users_id` ASC) ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_table1_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `naukajazdy`.`users` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
