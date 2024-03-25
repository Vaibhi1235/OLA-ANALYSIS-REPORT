create database ola;
use ola;
CREATE TABLE custumer ( 
custumer_id INT PRIMARY KEY , 
custumer_name VARCHAR(50), 
location VARCHAR(50), 
destination VARCHAR(50),
fair INT);
CREATE TABLE driver (driver_id INT PRIMARY KEY ,custumer_id INT , FOREIGN KEY (custumer_id) REFERENCES custumer(custumer_id)
ON DELETE CASCADE
ON UPDATE CASCADE,
salary INT NOT NULL,
model VARCHAR(50));
CREATE TABLE booking ( booking_id int not null , driver_id INT , FOREIGN KEY (driver_id) REFERENCES driver (driver_id)
ON DELETE CASCADE 
ON UPDATE CASCADE,
city VARCHAR(50));
INSERT INTO custumer VALUES
(101,"vaibhavi","chakan","hadapsar",200),
(102,"vaibhav","nigdi","punestation",300),
(103,"vaibhi","sangvi","nigdi",200),
(104,"vishal","talegaon","lonavala",400),
(105,"rashmi","lonavala","pune",300);
INSERT INTO driver VALUES 
(101,101,300,"verna"),
(102,102,500,"aura"),
(103,103,900,"innova"),
(104,104,300,"creta"),
(105,105,400,"alto");
INSERT INTO booking VALUES
(1,101,"pune"),
(2,102,"pune"),
(3,103,"pune"),
(4,104,"gramin"),
(5,105,"gramin");
ALTER TABLE booking ADD COLUMN gender VARCHAR(30);
UPDATE booking SET gender="female" WHERE booking_id IN (101,103,105);
UPDATE booking SET gender ="male" WHERE booking_id IN (102,104);
ALTER TABLE booking CHANGE COLUMN booking_id booking_no INT;
SELECT fair, count(custumer_id) FROM custumer GROUP BY fair HAVING max(fair)>100;
SELECT * FROM custumer WHERE custumer_name LIKE("v%");
USE ola;
SELECT custumer_name FROM custumer WHERE custumer_id IN (SELECT custumer_id FROM driver WHERE driver_id=101);
USE ola;
select custumer.custumer_name , driver.driver_id FROM custumer CROSS JOIN driver;
CREATE TABLE ride ( 
driver_id INT PRIMARY KEY ,
 ride_date date , 
 ride_canceldate date);
 INSERT INTO ride VALUES
 (101,"2024-03-04","2024-01-04"),
 (102,"2024-03-08","2024-01-12"),
 (103,"2024-03-18","2024-01-19"),
 (104,"2024-03-19","2023-02-18"),
 (105,"2024-02-18","2023-09-19"),
 (106,"2024-03-22","2023-10-12"),
 (107,"2024-02-21","2023-11-23"),
 (108,"2024-03-22","2023-12-21"),
 (109,"2024-02-21","2023-12-12"),
 (110,"2024-01-22","2023-12-18");
 SELECT NOW();
 SELECT DATE_FORMAT(NOW(),'%Y-%M-%D');
 SELECT custumer_name AS rider FROM custumer;
 SELECT custumer_name FROM custumer where fair >200 ORDER BY custumer_name DESC LIMIT 1 OFFSET 1 ;
 SELECT custumer_name,count(custumer_id) FROM custumer GROUP BY custumer_name HAVING max(fair)>200;
 INSERT INTO custumer (custumer_name) SELECT model FROM driver WHERE driver_id=1;
 SELECT custumer_name FROM custumer WHERE custumer_id IN ( SELECT custumer_id FROM driver WHERE model= "innova");
 SELECT custumer.custumer_name, driver.model FROM custumer cross join driver;
 SELECT custumer.custumer_name ,custumer.fair, driver.model FROM custumer RIGHT JOIN driver ON custumer.custumer_id=driver.driver_id;
 SELECT * FROM custumer;
 SELECT * FROM driver;
 SELECT * FROM booking;
 SET SQL_SAFE_UPDATES=0;
 UPDATE booking SET gender= "female" WHERE booking_no IN(101,103,105);
 UPDATE booking SET gender ="male" WHERE booking_no IN (102,104,106);
 ALTER TABLE ride ADD COLUMN profit INT NOT NULL;
 ALTER TABLE ride ADD COLUMN loss INT NOT NULL;
 ALTER TABLE ride CHANGE COLUMN  profit earning INT NOT NULL;
 ALTER TABLE ride CHANGE COLUMN loss expenses INT NOT NULL;
 UPDATE ride SET earning = 1000 WHERE driver_id IN (101,103,106,104,105);
 UPDATE ride SET earning =500 WHERE driver_id IN (102,107,108,109,110);
 UPDATE ride SET expenses = 500 WHERE driver_id = 103;
 UPDATE ride SET expenses =1000 WHERE driver_id IN (102,107,108,109,110);
SELECT *,(earning-expenses) AS profit_or_loss FROM ride WHERE earning- expenses <0;
select distinct custumer_name FROM custumer;
select * from custumer order by fair desc limit 1 offset 1;
 