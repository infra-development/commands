CREATE DATABASE IF NOT EXISTS `sakila`;

CREATE TABLE IF NOT EXISTS `sakila`.`Runner` (
    `runner_id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(45) NOT NULL,
    `last_name` VARCHAR(45) NOT NULL,
    `age` INT NOT NULL,
  PRIMARY KEY (`runner_id`)
);

CREATE TABLE IF NOT EXISTS `sakila`.`Performance` (
    `performance_id` INT NOT NULL AUTO_INCREMENT,
    `distance_miles` INT NOT NULL,
    `time_minutes` INT NOT NULL,
    `runner_id` INT NOT NULL,
  PRIMARY KEY (`performance_id`),
  INDEX `fk_Performance_Runner1_idx` (`runner_id` ASC),
  CONSTRAINT `fk_Performance_Runner1`
    FOREIGN KEY (`runner_id`)
    REFERENCES `sakila`.`Runner` (`runner_id`)
);

