use d03lab;

CREATE TABLE booking_status
(
booking_status_code INT PRIMARY KEY,
booking_status_description VARCHAR(50)
);

create table customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(30) NOT NULL,
    customer_details VARCHAR(100),
    gender ENUM('male','female','other'),
    email_address VARCHAR(20) UNIQUE NOT NULL,
    phone_number BIGINT UNIQUE NOT NULL,
    address_line_1 VARCHAR(50),
    address_line_2 VARCHAR(50),
    address_line_3 VARCHAR(50),
    town VARCHAR(20),
    county VARCHAR(20),
    country VARCHAR(20)
);

CREATE TABLE manufacturer
(
manufacturer_code INT PRIMARY KEY,  
manufacturer_name VARCHAR(20) NOT NULL, 
manufacturer_details VARCHAR(50)
);

CREATE TABLE model(
model_code INT PRIMARY KEY,
daily_hire_rate INT,
model_name VARCHAR(15) NOT NULL, 
FOREIGN KEY(model_code) REFERENCES manufacturer(manufacturer_code) 
);

CREATE TABLE vehicle_category
(
vehicle_category_code INT PRIMARY KEY,
vehicle_category_description VARCHAR(30)
);

CREATE TABLE vehicle
(
reg_number VARCHAR(10) PRIMARY KEY,
model_code INT NOT NULL,
vehicle_cat INT NOT NULL,
daily_hire_rate INT,
monthly_due_date DATE, 
engine_size SMALLINT,
FOREIGN KEY(model_code) REFERENCES model(model_code),
FOREIGN KEY(vehicle_cat) REFERENCES vehicle_category(vehicle_category_code)
);

CREATE TABLE booking
(
booking_Id INT PRIMARY KEY AUTO_INCREMENT, 
reg_Number VARCHAR(10) UNIQUE NOT NULL,
customer_Id INT,
date_from DATE NOT NULL,
date_to DATE NOT NULL,
confirmation_letter_sent_yn ENUM("YES","NO"),
payment_received_yn ENUM("YES","NO"),
FOREIGN KEY(booking_Id) REFERENCES booking_status(booking_status_code) ON DELETE CASCADE,
FOREIGN KEY(customer_Id) REFERENCES customer(customer_id),
FOREIGN KEY(reg_Number) REFERENCES vehicle(reg_Number),
CONSTRAINT CHK_DATE CHECK (date_from < date_to),
CONSTRAINT CHK_REGNO CHECK (length(reg_Number) IN (10))
);



