-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(145) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Team` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Team` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `owner` VARCHAR(45) NULL,
  `budget` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Player` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Player` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `team_id` INT NULL DEFAULT 9,
  `position` VARCHAR(10) NOT NULL,
  `points` DOUBLE NULL DEFAULT 0,
  `salary` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_player_team`
    FOREIGN KEY (`team_id`)
    REFERENCES `mydb`.`Team` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_player_team_idx` ON `mydb`.`Player` (`team_id` ASC);

SET SQL_MODE = '';
GRANT USAGE ON *.* TO auction;
 DROP USER auction;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'auction' IDENTIFIED BY 'auction';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `mydb`.* TO 'auction';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`User` (`id`, `username`, `password`) VALUES (1, 'admin', 'admin');
INSERT INTO `mydb`.`User` (`id`, `username`, `password`) VALUES (2, 'standard', 'standard');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Team`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Team` (`id`, `name`, `owner`, `budget`) VALUES (1, 'Kneel on this!!', 'Tyler', 150);
INSERT INTO `mydb`.`Team` (`id`, `name`, `owner`, `budget`) VALUES (2, 'Clown Fiesta', 'Sam', 150);
INSERT INTO `mydb`.`Team` (`id`, `name`, `owner`, `budget`) VALUES (3, 'Tutant Meenage Neetle Teetles', 'Tom', 150);
INSERT INTO `mydb`.`Team` (`id`, `name`, `owner`, `budget`) VALUES (4, 'RAYMORE FRIED CHICKENS', 'Bryce', 150);
INSERT INTO `mydb`.`Team` (`id`, `name`, `owner`, `budget`) VALUES (5, 'dot dot dot dot', 'Dom', 150);
INSERT INTO `mydb`.`Team` (`id`, `name`, `owner`, `budget`) VALUES (6, 'Fat Lazy Manatees', 'Jeremy', 150);
INSERT INTO `mydb`.`Team` (`id`, `name`, `owner`, `budget`) VALUES (7, 'F U Jay Ajayi', 'Matt', 150);
INSERT INTO `mydb`.`Team` (`id`, `name`, `owner`, `budget`) VALUES (8, 'Cat Copters', 'Scott', 150);
INSERT INTO `mydb`.`Team` (`id`, `name`, `owner`, `budget`) VALUES (9, 'Free Agents', 'ESPN', 100000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Player`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Player` (`id`, `name`, `team_id`, `position`, `points`, `salary`) VALUES (1, 'Tom Brady', 9, 'QB', 385.3, 20);
INSERT INTO `mydb`.`Player` (`id`, `name`, `team_id`, `position`, `points`, `salary`) VALUES (2, 'Le\'Veon Bell', 9, 'RB', 306, 44);

COMMIT;

