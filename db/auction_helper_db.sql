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
  `enabled` TINYINT(1) NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
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
  `player_name` VARCHAR(100) NOT NULL,
  `team_id` INT NULL DEFAULT 9,
  `position` VARCHAR(10) NULL,
  `expected_points` DOUBLE NULL DEFAULT 0,
  `salary` INT NULL DEFAULT 0,
  `dollar_value` INT NULL DEFAULT 0,
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
INSERT INTO `mydb`.`User` (`id`, `username`, `password`, `enabled`, `role`) VALUES (1, 'admin', 'admin', NULL, NULL);
INSERT INTO `mydb`.`User` (`id`, `username`, `password`, `enabled`, `role`) VALUES (2, 'standard', 'standard', NULL, NULL);

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
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (1, 'Tom Brady', 9, 'QB', 384.9, 0, 17);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (2, 'Aaron Rodgers', 9, 'QB', 384.3, 0, 17);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (3, 'Cam Newton', 9, 'QB', 348.4, 0, 11);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (4, 'Russell Wilson', 9, 'QB', 346.1, 0, 10);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (5, 'Andrew Luck', 1, 'QB', 344.5, 0, 10);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (6, 'Carson Wentz', 9, 'QB', 340.6, 0, 9);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (7, 'Alex Smith', 5, 'QB', 339.1, 0, 9);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (8, 'Matthew Stafford', 8, 'QB', 335.2, 0, 9);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (9, 'Ben Roethlisberger', 9, 'QB', 334.6, 0, 8);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (10, 'Kirk Cousins', 9, 'QB', 334.2, 0, 8);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (11, 'Philip Rivers', 9, 'QB', 333.8, 0, 8);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (12, 'Deshaun Watson', 6, 'QB', 330.7, 0, 8);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (13, 'Drew Brees', 9, 'QB', 329.3, 0, 8);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (14, 'Matt Ryan', 2, 'QB', 327.8, 0, 8);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (15, 'Marcus Mariota', 9, 'QB', 318.3, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (16, 'Patrick Mahomes', 4, 'QB', 317.1, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (17, 'Jimmy Garoppolo', 1, 'QB', 312.5, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (18, 'Jared Goff', 1, 'QB', 312.3, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (19, 'Mitchell Trubisky', 9, 'QB', 311.1, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (20, 'Derek Carr', 4, 'QB', 304.1, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (21, 'Andy Dalton', 9, 'QB', 302.9, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (22, 'Ryan Tannehill', 9, 'QB', 300.5, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (23, 'Dak Prescott', 9, 'QB', 296.3, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (24, 'Eli Manning', 9, 'QB', 295, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (25, 'Blake Bortles', 8, 'QB', 294.9, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (26, 'Case Keenum', 5, 'QB', 293.1, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (27, 'Tyrod Taylor', 9, 'QB', 281.2, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (28, 'Jameis Winston', 9, 'QB', 280.8, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (29, 'Joe Flacco', 9, 'QB', 238.4, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (30, 'Sam Darnold', 9, 'QB', 227.3, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (31, 'Le\'Veon Bell', 7, 'RB', 352.3, 0, 32);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (32, 'Todd Gurley II', 4, 'RB', 329.7, 0, 28);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (33, 'David Johnson', 3, 'RB', 325.7, 0, 27);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (34, 'Ezekiel Elliott', 9, 'RB', 303.1, 0, 23);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (35, 'Alvin Kamara', 2, 'RB', 291.2, 0, 21);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (36, 'Saquon Barkley', 9, 'RB', 281.7, 0, 19);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (37, 'Melvin Gordon', 4, 'RB', 265.9, 0, 16);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (38, 'Dalvin Cook', 8, 'RB', 265.6, 0, 16);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (39, 'Christian McCaffrey', 9, 'RB', 262.8, 0, 16);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (40, 'Leonard Fournette', 7, 'RB', 258.5, 0, 15);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (41, 'Kareem Hunt', 4, 'RB', 258.4, 0, 15);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (42, 'LeSean McCoy', 9, 'RB', 254.8, 0, 15);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (43, 'Devonta Freeman', 5, 'RB', 234.6, 0, 12);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (44, 'Jerick McKinnon', 9, 'RB', 230.2, 0, 11);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (45, 'Joe Mixon', 9, 'RB', 207.1, 0, 8);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (46, 'Royce Freeman', 9, 'RB', 203.2, 0, 8);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (47, 'Jordan Howard', 2, 'RB', 201.6, 0, 8);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (48, 'Kenyan Drake', 2, 'RB', 201.3, 0, 8);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (49, 'Alex Collins', 6, 'RB', 194, 0, 7);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (50, 'Derrick Henry', 4, 'RB', 185.7, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (51, 'Marshawn Lynch', 9, 'RB', 175.8, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (52, 'Mark Ingram II', 8, 'RB', 175.5, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (53, 'Rex Burkhead', 9, 'RB', 173.2, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (54, 'Dion Lewis', 9, 'RB', 172.5, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (55, 'Lamar Miller', 9, 'RB', 171.8, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (56, 'Jay Ajayi', 9, 'RB', 169.9, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (57, 'Duke Johnson Jr.', 9, 'RB', 166.8, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (58, 'Tevin Coleman', 6, 'RB', 163.7, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (59, 'Tarik Cohen', 9, 'RB', 161, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (60, 'Isaiah Crowell', 9, 'RB', 158.5, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (61, 'Chris Thompson', 9, 'RB', 157.3, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (62, 'Kerryon Johnson', 9, 'RB', 150.8, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (63, 'James White', 5, 'RB', 146.2, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (64, 'Carlos Hyde', 9, 'RB', 145.4, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (65, 'Marlon Mack', 9, 'RB', 144.5, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (66, 'Rashaad Penny', 9, 'RB', 141.4, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (67, 'Ronald Jones', 9, 'RB', 141.3, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (68, 'Chris Carson', 9, 'RB', 137.4, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (69, 'Theo Riddick', 9, 'RB', 134.5, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (70, 'Ty Montgomery', 9, 'RB', 134.2, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (71, 'Jamaal Williams', 5, 'RB', 132.1, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (72, 'Doug Martin', 9, 'RB', 130, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (73, 'Peyton Barber', 9, 'RB', 126.8, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (74, 'Giovani Bernard', 9, 'RB', 124.4, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (75, 'Javorius Allen', 9, 'RB', 117.5, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (76, 'Bilal Powell', 9, 'RB', 115.9, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (77, 'Sony Michel', 9, 'RB', 114.8, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (78, 'Adrian Peterson', 9, 'RB', 109.7, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (79, 'Devontae Booker', 9, 'RB', 107, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (80, 'Latavius Murray', 9, 'RB', 105, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (81, 'orey Clement', 9, 'RB', 101.7, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (82, 'Austin Ekeler', 9, 'RB', 99, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (83, 'T.J. Yeldon', 9, 'RB', 97.2, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (84, 'C.J. Anderson', 9, 'RB', 95.9, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (85, 'Darren Sproles', 9, 'RB', 94.4, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (86, 'Frank Gore', 9, 'RB', 92.4, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (87, 'Aaron Jones', 9, 'RB', 91.5, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (88, 'Matt Breida', 9, 'RB', 91.2, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (89, 'Elijah McGuire*', 9, 'RB', 90.6, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (90, 'Nyheim Hines', 9, 'RB', 90, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (91, 'Kenneth Dixon', 9, 'RB', 88.1, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (92, 'Chris Ivory', 9, 'RB', 86.5, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (93, 'Jordan Wilkins', 9, 'RB', 84.6, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (94, 'Antonio Brown', 9, 'WR', 322.7, 0, 27);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (95, 'Julio Jones', 9, 'WR', 292.4, 0, 22);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (96, 'DeAndre Hopkins', 8, 'WR', 281.6, 0, 20);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (97, 'Keenan Allen', 9, 'WR', 279.8, 0, 19);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (98, 'Michael Thomas', 2, 'WR', 279, 0, 19);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (99, 'Odell Beckham Jr.', 9, 'WR', 278.2, 0, 19);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (100, 'A.J. Green', 9, 'WR', 267.5, 0, 17);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (101, 'Davante Adams', 3, 'WR', 253.1, 0, 14);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (102, 'T.Y. Hilton', 2, 'WR', 242.2, 0, 12);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (103, 'Larry Fitzgerald', 9, 'WR', 241.4, 0, 12);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (104, 'Adam Thielen', 4, 'WR', 237.4, 0, 12);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (105, 'Mike Evans', 9, 'WR', 233.8, 0, 11);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (106, 'Tyreek Hill', 1, 'WR', 231.1, 0, 11);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (107, 'Stefon Diggs', 1, 'WR', 227.9, 0, 10);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (108, 'Demaryius Thomas', 9, 'WR', 227.4, 0, 10);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (109, 'Doug Baldwin', 6, 'WR', 225, 0, 10);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (110, 'Allen Robinson', 8, 'WR', 220.2, 0, 9);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (111, 'Amari Cooper', 1, 'WR', 219.2, 0, 9);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (112, 'Golden Tate', 9, 'WR', 217.1, 0, 9);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (113, 'Jarvis Landry', 2, 'WR', 209.8, 0, 8);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (114, 'Marvin Jones Jr.', 9, 'WR', 205.5, 0, 7);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (115, 'Josh Gordon', 2, 'WR', 201.3, 0, 7);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (116, 'JuJu Smith-Schuster', 3, 'WR', 200, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (117, 'Chris Hogan', 9, 'WR', 199.2, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (118, 'Corey Davis', 2, 'WR', 197, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (119, 'Brandin Cooks', 9, 'WR', 196.6, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (120, 'Michael Crabtree', 9, 'WR', 195.4, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (121, 'Marquise Goodwin', 9, 'WR', 191.4, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (122, 'Emmanuel Sanders', 9, 'WR', 191, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (123, 'Robert Woods', 9, 'WR', 190.6, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (124, 'Pierre Garcon', 9, 'WR', 190.6, 0, 6);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (125, 'Randall Cobb', 9, 'WR', 189.8, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (126, 'Sammy Watkins', 8, 'WR', 188.3, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (127, 'Sterling Shepard', 9, 'WR', 188.2, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (128, 'Robby Anderson', 9, 'WR', 187.9, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (129, 'Devin Funchess', 9, 'WR', 186.6, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (130, 'Jamison Crowder', 9, 'WR', 186.1, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (131, 'Cooper Kupp', 9, 'WR', 185, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (132, 'Jordy Nelson', 9, 'WR', 182.1, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (133, 'Kelvin Benjamin', 9, 'WR', 180.3, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (134, 'Kenny Stills', 9, 'WR', 179.1, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (135, 'Will Fuller V', 1, 'WR', 174, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (136, 'Mohamed Sanu', 9, 'WR', 172.4, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (137, 'Josh Doctson', 9, 'WR', 170.1, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (138, 'DeVante Parker', 7, 'WR', 169.4, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (139, 'Alshon Jeffery*', 9, 'WR', 168.9, 0, 5);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (140, 'Nelson Agholor', 9, 'WR', 167.3, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (141, 'Allen Hurns', 9, 'WR', 160.1, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (142, 'Julian Edelman', 1, 'WR', 159.6, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (143, 'Kenny Golladay', 9, 'WR', 158.9, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (144, 'Keelan Cole', 9, 'WR', 152.8, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (145, 'Paul Richardson', 9, 'WR', 147.2, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (146, 'John Ross', 9, 'WR', 146.8, 0, 4);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (147, 'Tyler Lockett', 9, 'WR', 146.4, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (148, 'Rishard Matthews', 9, 'WR', 145.5, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (149, 'Danny Amendola', 9, 'WR', 144.9, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (150, 'Cameron Meredith', 9, 'WR', 143.6, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (151, 'DeSean Jackson', 9, 'WR', 138, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (152, 'Anthony Miller', 9, 'WR', 137.3, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (153, 'Chris Godwin', 9, 'WR', 136.5, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (154, 'Ryan Grant', 9, 'WR', 128.5, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (155, 'Ted Ginn Jr.', 9, 'WR', 127.8, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (156, 'Donte Moncrief', 9, 'WR', 126.9, 0, 3);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (157, 'Calvin Ridley', 9, 'WR', 123.3, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (158, 'Cole Beasley', 9, 'WR', 122.6, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (159, 'DJ Moore', 9, 'WR', 122.6, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (160, 'Courtland Sutton', 9, 'WR', 120.8, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (161, 'Tyrell Williams', 9, 'WR', 120.4, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (162, 'Willie Snead', 9, 'WR', 119.8, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (163, 'John Brown', 9, 'WR', 118.7, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (164, 'Mike Williams', 9, 'WR', 118.5, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (165, 'Martavis Bryant', 9, 'WR', 116.5, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (166, 'Mike Wallace', 9, 'WR', 116.5, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (167, 'Travis Benjamin', 9, 'WR', 116, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (168, 'Quincy Enunwa', 9, 'WR', 115.9, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (169, 'James Washington', 9, 'WR', 115.3, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (170, 'Taywan Taylor', 9, 'WR', 113.8, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (171, 'Dede Westbrook', 9, 'WR', 113.7, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (172, 'Albert Wilson', 9, 'WR', 112.2, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (173, 'Michael Gallup', 9, 'WR', 111.5, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (174, 'Terrance Williams', 9, 'WR', 110.6, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (175, 'Christian Kirk', 9, 'WR', 107.4, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (176, 'Jermaine Kearse', 9, 'WR', 105, 0, 2);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (177, 'Chester Rogers', 9, 'WR', 101.9, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (178, 'Brandon Marshall', 9, 'WR', 94.8, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (179, 'Tyler Boyd', 9, 'WR', 94.8, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (180, 'Adam Humphries', 9, 'WR', 94, 0, 1);
INSERT INTO `mydb`.`Player` (`id`, `player_name`, `team_id`, `position`, `expected_points`, `salary`, `dollar_value`) VALUES (181, 'Taylor Gabriel', 9, 'WR', 92.3, 0, 1);

COMMIT;

