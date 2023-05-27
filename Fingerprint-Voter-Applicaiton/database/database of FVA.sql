	-- create database
    create database evoting;
	-- use database
    use evoting;
	-- create table voter and voter_seq table is created for auto increment non int primary key
    CREATE TABLE voter_seq(voter_card_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY);
	CREATE TABLE voter(voter_card_number VARCHAR(10) NOT NULL PRIMARY KEY DEFAULT '0', name VARCHAR(30) NOT NULL, gender VARCHAR(6) NOT NULL, dob VARCHAR(10) NOT NULL,email VARCHAR(30) NOT NULL, address VARCHAR(50) NOT NULL, password VARCHAR(8) NOT NULL, userCreatedDate VARCHAR(20) NOT NULL);
	-- trigger creating for auto increment primary key of voter table
    DELIMITER $$CREATE TRIGGER voter_insert BEFORE INSERT ON voter FOR EACH ROW BEGIN   INSERT INTO voter_seq VALUES (NULL);   SET NEW.voter_card_number = CONCAT('FVA', LPAD(LAST_INSERT_ID(), 7,'0')); END$$ DELIMITER ;

