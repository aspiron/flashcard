SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';



CREATE SCHEMA IF NOT EXISTS `flashcard` DEFAULT CHARACTER SET utf8 ;

USE `flashcard` ;



-- -----------------------------------------------------

-- Table `flashcard`.`users`
-- 

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `flashcard`.`users` (

  `id` INT(11) NOT NULL AUTO_INCREMENT ,

  `username` VARCHAR(255) NOT NULL ,

  `role` VARCHAR(255) NOT NULL ,

  `active` ENUM('0','1') NOT NULL ,

  PRIMARY KEY (`id`) )

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8;





-- -----------------------------------------------------

-- Table `flashcard`.`quest_draft`
-- 
-- 

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `flashcard`.`quest_draft` (

  `id` INT(11) NOT NULL AUTO_INCREMENT ,

  `name` VARCHAR(255) NOT NULL ,

  `text` TEXT NOT NULL ,

  `active` ENUM('0','1') NOT NULL ,

  `teacher_id` INT(11) NOT NULL ,

  PRIMARY KEY (`id`) ,

  INDEX `fk_quest_draft_users1_idx` (`user_id` ASC) ,

  CONSTRAINT `fk_quest_draft_users1`

    FOREIGN KEY (`user_id` )

    REFERENCES `flashcard`.`users` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB

DEFAULT CHARACTER SET = utf8;





-- -----------------------------------------------------

-- Table `flashcard`.`group`
-- 

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `flashcard`.`group` (

  `id` INT(11) NOT NULL AUTO_INCREMENT ,

  `name` VARCHAR(200) NULL ,

  `active` ENUM('0','1') NULL ,

  `user_id` INT(11) NOT NULL ,

  PRIMARY KEY (`id`) ,

  INDEX `fk_group_users1_idx` (`user_id` ASC) ,

  CONSTRAINT `fk_group_users1`

    FOREIGN KEY (`user_id` )

    REFERENCES `flashcard`.`users` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `flashcard`.`group_quest`
-- 

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `flashcard`.`group_quest` (

  `id` INT(11) NOT NULL AUTO_INCREMENT ,

  `active` ENUM('0','1') NULL ,

  `quest_id` INT(11) NOT NULL ,

  PRIMARY KEY (`id`) ,

  INDEX `fk_group_quest_quest_draft1_idx` (`quest_id` ASC) ,

  CONSTRAINT `fk_group_quest_quest_draft1`

    FOREIGN KEY (`quest_id` )

    REFERENCES `flashcard`.`quest_draft` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `flashcard`.`group_students`
-- 

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `flashcard`.`group_students` (

  `id` INT(11) NOT NULL AUTO_INCREMENT ,

  `user_id` VARCHAR(200) NULL ,

  `active` ENUM('0','1') NULL ,

  `group_id` INT(11) NOT NULL ,

  PRIMARY KEY (`id`) ,

  INDEX `fk_group_students_users_idx` (`users_id` ASC) ,

  INDEX `fk_group_students_group1_idx` (`group_id` ASC) ,

  CONSTRAINT `fk_group_students_users`

    FOREIGN KEY (`users_id` )

    REFERENCES `flashcard`.`users` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION,

  CONSTRAINT `fk_group_students_group1`

    FOREIGN KEY (`group_id` )

    REFERENCES `flashcard`.`group` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;





-- -----------------------------------------------------

-- Table `flashcard`.`group_quest_answers`
-- 

-- -----------------------------------------------------

CREATE  TABLE IF NOT EXISTS `flashcard`.`group_quest_answers` (

  `id` INT(11) NOT NULL AUTO_INCREMENT ,

  `active` ENUM('0','1') NULL ,

  `answer` TEXT NULL ,

  `group_quest_id` INT(11) NOT NULL ,

  `user_id` INT(11) NOT NULL ,

  PRIMARY KEY (`id`) ,

  INDEX `fk_group_quest_answers_group_quest1_idx` (`group_quest_id` ASC) ,

  INDEX `fk_group_quest_answers_users1_idx` (`user_id` ASC) ,

  CONSTRAINT `fk_group_quest_answers_group_quest1`

    FOREIGN KEY (`group_quest_id` )

    REFERENCES `flashcard`.`group_quest` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION,

  CONSTRAINT `fk_group_quest_answers_users1`

    FOREIGN KEY (`user_id` )

    REFERENCES `flashcard`.`users` (`id` )

    ON DELETE NO ACTION

    ON UPDATE NO ACTION)

ENGINE = InnoDB;



USE `flashcard` ;





SET SQL_MODE=@OLD_SQL_MODE;

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;






-- sequelize model:create --name users --attributes id:integer, username:string,role:string,password:string,active:string
-- sequelize model:create --name quest_draft --attributes id:integer, title:string,text:string,teacher_id:integer,active:string
-- sequelize model:create --name group --attributes id:integer, name:string,teacher_id:integer,active:string
-- sequelize model:create --name group_quest --attributes id:integer, teacher_id:integer,active:string
-- sequelize model:create --name group_students --attributes id:integer, user_id:integer, group_id:integer, active:string
-- sequelize model:create --name group_quest_answers --attributes id:integer, teacher_id:integer, user_id:integer, group_quest_id:integer,answer:string,active:string
-- sequelize-auto -o "./server/models" -d flashcard -h localhost -u root -p 3306 -x 1234 -e mysql