----Create tables-------

DROP TABLE IF EXISTS google_business;
CREATE TABLE google_business
(
name VARCHAR(500),
address	VARCHAR(500),
gmap_id	VARCHAR(40),	
category VARCHAR(350),	
avg_rating	NUMERIC,
num_of_reviews	SMALLINT,
MISC VARCHAR(1400)
);

DROP TABLE IF EXISTS business_inspections;
CREATE TABLE business_inspections
(
serial_number VARCHAR(15),	
activity_date VARCHAR(50),
facility_name VARCHAR(100),
score SMALLINT,
grade CHAR(1),
service_code NUMERIC,
service_description	VARCHAR(70),
employee_id	VARCHAR(15),
facility_address VARCHAR(200),
facility_city VARCHAR(25),
facility_id	VARCHAR(25),
facility_state CHAR(2),
facility_zip VARCHAR(15),	
owner_id VARCHAR(30),
owner_name VARCHAR(100),
pe_description	VARCHAR(100),
program_element_pe	SMALLINT,
record_id VARCHAR(20)
);

DROP TABLE IF EXISTS violations;
CREATE TABLE violations
(
serial_number VARCHAR(15),	
activity_date VARCHAR(50),
facility_name VARCHAR(100),
violation_code VARCHAR(10),
violation_description VARCHAR(150),
violation_status VARCHAR(75),
points NUMERIC,
grade CHAR(1),
facility_address VARCHAR(200),
facility_city VARCHAR(25),
facility_id	VARCHAR(25),
facility_state CHAR(2),
facility_zip VARCHAR(15),
employee_id VARCHAR(30),
owner_id VARCHAR(30),
owner_name VARCHAR(100),
pe_description	VARCHAR(100),
program_element_pe	SMALLINT,
record_id VARCHAR(20),
score SMALLINT,
service_code NUMERIC,
service_description	VARCHAR(70),
row_id VARCHAR(50)
);
--- preview data and set constraints

--- google_business

SELECT * FROM google_business LIMIT 5;
SELECT COUNT(*) FROM google_business;
--- the gmap_id will be our primary key to connect to reviews later on
--- let's ensure there are no duplicates 

SELECT gmap_id,count(gmap_id)
FROM google_business
GROUP BY gmap_id
HAVING count(gmap_id) > 1;

--- there are no duplicates so we can declare a primary key 

ALTER TABLE google_business
ADD PRIMARY KEY(gmap_id);

--- business_inspections 

SELECT * FROM business_inspections LIMIT 5;

--- the serial number should be our primary key to connect to violations

ALTER TABLE business_inspections
ADD PRIMARY KEY(serial_number);

--- violations

SELECT * FROM violations LIMIT 5;

--- our serial_number in violations references that in business_inspections 
--- first ensure that all serial_number in violations exist in business_inspections
SELECT DISTINCT(serial_number)
FROM violations
WHERE serial_number not in 
(SELECT DISTINCT(serial_number) FROM business_inspections);

ALTER TABLE violations
ADD CONSTRAINT fk_serial
FOREIGN KEY(serial_number)
REFERENCES business_inspections(serial_number);

