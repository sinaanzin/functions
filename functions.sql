create table country (id int primary key, country_name varchar(20), population int, area varchar(20));
insert into country (id,country_name,population,area)  values
(1,'USA', 33100, 9833517),
(2,'Canada', 3777, 9976140),
(3,'UK', 67888, 243610),
(4,'India', 138000, 3287263),
(5,'Australia', 256, 7692024),
(6,'Germany', 8370006, 357022),
(7,'France', 652000, 551695),
(8,'Japan', 1260000, 377975),
(9,'Brazil', 2120000, 8515767),
(10,'South Africa', 593000, 1219090),
(11,'Argentina', 567100, 9836756),
(12,'Wales', 890074, 9766100);

create table persons(id int primary key, fname varchar(20), lname varchar(20), population int ,
rating decimal(3,1), country_id int, FOREIGN KEY (Country_Id) REFERENCES Country(Id),country_name varchar(20) );
insert into persons (id,fname,lname,population,rating,country_id,country_name) values
(1, 'John', 'Doe', 50000000, 4.2, 1,'India'),
(2, 'Jane', 'Smith', 30000000, 3.5, 2,null),
(3, 'Emily', 'Jones', 20000000, 4.8, 3,null),
(4, 'Michael', 'Brown', 150000000, 4.1, 4,'USA'),
(5, 'Olivia', 'Taylor', 7000000, 4.6, 5,'India'),
(6, 'Sophia', 'Lee', 30000000, 4.7, 6,'Australia'),
(7, 'Liam', 'Wilson', 50000000, 4.0, 7,'France'),
(8, 'Ava', 'Johnson', 80000000, 3.9, 8,'South Africa'),
(9, 'Isabella', 'Davis', 100000000, 4.5, 9,null),
(10, 'Ethan', 'Martinez', 45000000, 4.3, 10,'South Africa'),
(11, 'Harris', null, 60000000, 3.2, 11,'India'),
(12, 'Mccalum', null, 12000000, 4.0, 12,null);

select * from country;
select * from persons;

alter table persons add DOB date;
update persons set DOB = '1985-06-15' where id = 1;
update persons set DOB = '1990-12-01' where id = 2;
update persons set DOB = '1988-03-22' where id = 3;
update persons set DOB = '1975-09-10' where id = 4;
update persons set DOB = '2000-07-30' where id = 5;
update persons set DOB= '1995-11-25' where id = 6;
update persons set DOB = '1980-05-14' where id = 7;
update persons set DOB = '1993-10-05' where id = 8;
update persons set DOB= '1982-04-19' where id = 9;
update persons set DOB = '1979-08-12' where id = 10;
update persons set DOB = '1981-09-10' where id = 11;
update persons set DOB = '1995-12-30' where id = 12;



DELIMITER $$

CREATE FUNCTION calculate_age(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE age INT;
SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE()) - 
CASE WHEN MONTH(dob) > MONTH(CURDATE()) OR (MONTH(dob) = MONTH(CURDATE()) AND DAY(dob) > DAY(CURDATE())) 
THEN 1 
ELSE 0 
END;
RETURN age;
END $$

DELIMITER ;

select fname,calculate_age(dob) as age from persons;

select country_name, char_length(country_name) as name_length from country;

select country_name,substring(country_name,1,3) as first_3 from country;

select country_name , lower(country_name) as lower_case from country;
select country_name , upper(country_name) as upper_case from country






