	-- create database
    create database evoting;
	-- use database
    use evoting;
	-- create table voter and voter_seq table is created for auto increment non int primary key
    CREATE TABLE voter_seq(voter_card_number INT NOT NULL AUTO_INCREMENT PRIMARY KEY);
	CREATE TABLE voter(voter_card_number VARCHAR(10) NOT NULL PRIMARY KEY DEFAULT '0', name VARCHAR(30) NOT NULL, gender VARCHAR(6) NOT NULL, dob VARCHAR(10) NOT NULL,email VARCHAR(30) NOT NULL, address VARCHAR(50) NOT NULL, password VARCHAR(8) NOT NULL, userCreatedDate VARCHAR(20) NOT NULL);
	-- trigger creating for auto increment primary key of voter table
    DELIMITER $$CREATE TRIGGER voter_insert BEFORE INSERT ON voter FOR EACH ROW BEGIN   INSERT INTO voter_seq VALUES (NULL);   SET NEW.voter_card_number = CONCAT('FVAV', LPAD(LAST_INSERT_ID(), 6,'0')); END$$ DELIMITER ;
	-- contact table create
    CREATE TABLE contact(name VARCHAR(30) NOT NULL,email VARCHAR(30) NOT NULL,message VARCHAR(60) NOT NULL);
	--create admin table used same technique as voter table
    CREATE TABLE admin_seq(adminId INT NOT NULL AUTO_INCREMENT PRIMARY KEY);
	CREATE TABLE admin(adminId VARCHAR(10) NOT NULL PRIMARY KEY DEFAULT '0', name VARCHAR(30) NOT NULL, password VARCHAR(8) NOT NULL);
    DELIMITER $$CREATE TRIGGER admin_insert BEFORE INSERT ON admin FOR EACH ROW BEGIN   INSERT INTO admin_seq VALUES (NULL);   SET NEW.adminId = CONCAT('FVAA', LPAD(LAST_INSERT_ID(), 6,'0')); END$$ DELIMITER ;
	--insert record into admin
    INSERT INTO admin(name, password) VALUES ('vikas pawar','Vikas@11');
    
    SET SQL_SAFE_UPDATES = 0;
    
   CREATE TABLE candidate (
  candidate_id INT AUTO_INCREMENT PRIMARY KEY,
  candidate_name VARCHAR(255) NOT NULL,
  candidate_gender VARCHAR(10) NOT NULL,
  candidate_address VARCHAR(255) NOT NULL,
  candidate_photo VARCHAR(255) NOT NULL,
  vote_count INT default'0'
);

ALTER TABLE candidate
ADD COLUMN voter_card_number VARCHAR(10),
ADD FOREIGN KEY (voter_card_number) REFERENCES voter (voter_card_number),
ADD UNIQUE KEY (voter_card_number);
