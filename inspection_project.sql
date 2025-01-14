----Create tables-------

DROP TABLE IF EXISTS google_business;
DROP TABLE IF EXISTS business_inspections;
DROP TABLE IF EXISTS violations;

CREATE TABLE google_business
(
name VARCHAR(500),
address	VARCHAR(500),
gmap_id	VARCHAR(40),
latitude NUMERIC,	
longitude NUMERIC,	
category VARCHAR(350),	
avg_rating	NUMERIC,
num_of_reviews	SMALLINT,
MISC VARCHAR(1400)
);

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
program_name VARCHAR(100),
program_status	VARCHAR(100),
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
program_name VARCHAR(100),
program_status	VARCHAR(100),
record_id VARCHAR(20),
score SMALLINT,
service_code NUMERIC,
service_description	VARCHAR(70),
row_id VARCHAR(50)
);
SELECT * FROM google_business LIMIT 50;
UPDATE google_business SET address = LOWER(address);
UPDATE business_inspections SET facility_address = LOWER(facility_address);


