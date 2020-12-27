-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `project` ;

-- -----------------------------------------------------
-- Table `project`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`product` (
  `product_id` VARCHAR(20) NOT NULL,
  `product_type_code` VARCHAR(20) NOT NULL,
  `product_price` INT NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`customer` (
  `customer_id` VARCHAR(20) NOT NULL,
  `email_login` VARCHAR(20) NOT NULL,
  `password_login` VARCHAR(20) NOT NULL,
  `favorite_product_id` VARCHAR(20) NULL DEFAULT NULL,
  `point` INT NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `favorite_product_id` (`favorite_product_id` ASC) VISIBLE,
  CONSTRAINT `customer_ibfk_1`
    FOREIGN KEY (`favorite_product_id`)
    REFERENCES `project`.`product` (`product_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`customer_payment_method`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`customer_payment_method` (
  `customer_payment_method_id` VARCHAR(20) NOT NULL,
  `payment_method_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`customer_payment_method_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`custumer_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`custumer_order` (
  `order_id` VARCHAR(20) NOT NULL,
  `customer_id` VARCHAR(20) NOT NULL,
  `customer_payment_method_id` VARCHAR(20) NOT NULL,
  `date_order_place` DATE NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `customer_id` (`customer_id` ASC) VISIBLE,
  INDEX `customer_payment_method_id` (`customer_payment_method_id` ASC) VISIBLE,
  CONSTRAINT `custumer_order_ibfk_1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `project`.`customer` (`customer_id`),
  CONSTRAINT `custumer_order_ibfk_2`
    FOREIGN KEY (`customer_payment_method_id`)
    REFERENCES `project`.`customer_payment_method` (`customer_payment_method_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`customer_order_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`customer_order_products` (
  `order_id` VARCHAR(20) NOT NULL,
  `product_id` VARCHAR(20) NOT NULL,
  `quantity` INT NULL DEFAULT 1,
  `comment` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `product_id` (`product_id` ASC) VISIBLE,
  CONSTRAINT `customer_order_products_ibfk_1`
    FOREIGN KEY (`order_id`)
    REFERENCES `project`.`custumer_order` (`order_id`)
    ON DELETE CASCADE,
  CONSTRAINT `customer_order_products_ibfk_2`
    FOREIGN KEY (`product_id`)
    REFERENCES `project`.`product` (`product_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`data_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`data_history` (
  `count_id` INT NOT NULL AUTO_INCREMENT,
  `temp_customer_id` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`count_id`),
  INDEX `temp_customer_id` (`temp_customer_id` ASC) VISIBLE,
  CONSTRAINT `data_history_ibfk_1`
    FOREIGN KEY (`temp_customer_id`)
    REFERENCES `project`.`customer` (`customer_id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `project`.`discount_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `project`.`discount_code` (
  `code` VARCHAR(20) NOT NULL,
  `discount_type` INT NOT NULL,
  `percent_discount` INT NULL DEFAULT NULL,
  `discount_value` INT NULL DEFAULT NULL,
  `company_name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `project` ;

-- -----------------------------------------------------
-- procedure add_favorite
-- -----------------------------------------------------

DELIMITER $$
USE `project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_favorite`(in pro_id varchar(20), in cus_id varchar(20))
begin
	update Customer set favorite_product_id=pro_id where customer_id=cus_id;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure edit_product_infor
-- -----------------------------------------------------

DELIMITER $$
USE `project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `edit_product_infor`(in pro_id varchar(20), in pro_price int, in pro_new_name varchar(20))
begin
	update product set product.product_id=pro_new_name, product.product_price=pro_price where product.product_id=pro_id;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure get_point
-- -----------------------------------------------------

DELIMITER $$
USE `project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_point`(in cus_id varchar(20))
begin
	select * from customer where customer.customer_id=cus_id;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insert_customer_order_products
-- -----------------------------------------------------

DELIMITER $$
USE `project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_customer_order_products`(in temp_order_id varchar(20), in pro_id varchar(20), in pro_quantity int, in temp_comment text)
begin
	insert into customer_order_products values(temp_order_id, pro_id, pro_quantity, temp_comment);
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insert_customer_orderid
-- -----------------------------------------------------

DELIMITER $$
USE `project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_customer_orderid`(in order_id varchar(20), in cus_id varchar(20), in payment_id varchar(20), in date_input date)
begin
	insert into Custumer_order values(order_id, cus_id, payment_id, date_input);
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insert_product
-- -----------------------------------------------------

DELIMITER $$
USE `project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_product`(in pro_price int, in pro_type_code varchar(20), in pro_id varchar(20))
begin
	insert into product values(pro_id, pro_type_code, pro_price);
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure login
-- -----------------------------------------------------

DELIMITER $$
USE `project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in email varchar(20), in pass varchar(20))
Select * from Customer where email_login=email and password_login=pass;$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure reduce_product
-- -----------------------------------------------------

DELIMITER $$
USE `project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `reduce_product`(in pro_id varchar(20))
begin
	delete from product where product.product_id=pro_id;
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure sign_up
-- -----------------------------------------------------

DELIMITER $$
USE `project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sign_up`(in cus_id varchar(20), in email_login varchar(20), in pass_login varchar(20))
begin
	insert into customer(customer_id, email_login, password_login) values(cus_id, email_login, pass_login);
end$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure update_point
-- -----------------------------------------------------

DELIMITER $$
USE `project`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_point`(in cus_id varchar(20), in new_point int)
begin
	UPDATE customer SET customer.point=new_point WHERE customer_id=cus_id;
end$$

DELIMITER ;
USE `project`;

DELIMITER $$
USE `project`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `project`.`add_point`
AFTER INSERT ON `project`.`custumer_order`
FOR EACH ROW
begin
	insert into data_history(temp_customer_id) values (NEW.customer_id);
end$$

USE `project`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `project`.`add_point_event`
AFTER INSERT ON `project`.`data_history`
FOR EACH ROW
begin
	update customer set customer.point=customer.point+1 where customer.customer_id=NEW.temp_customer_id;
end$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
