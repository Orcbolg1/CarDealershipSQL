# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          CarDealership                                   #
# ---------------------------------------------------------------------- #

-- Drop the database if it exists
DROP DATABASE IF EXISTS carDealership;

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS carDealership;

-- Switch to the newly created database
USE carDealership;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #

-- ---------------------------------------------------------------------- #
-- Add table "Dealership"                                                 #
-- ---------------------------------------------------------------------- #
CREATE TABLE `dealerships` (
    `Dealership_id` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(50) NOT NULL,
    `Address` VARCHAR(50),
    `Phone` VARCHAR(12)
);


-- ---------------------------------------------------------------------- #
-- Add table "Vehicles"                                                   #
-- ---------------------------------------------------------------------- #
CREATE TABLE `vehicles` (
    `Make` VARCHAR(30) NOT NULL,
	`Model` VARCHAR(30) NOT NULL,
	`Color` VARCHAR (30) NOT NULL,
	`VIN` VARCHAR (30)  NOT NULL,
	`Sold` BOOLEAN ,
	`Price` DOUBLE NOT NULL,
CONSTRAINT `PK_vehicles` PRIMARY KEY (`VIN`)
);

-- ---------------------------------------------------------------------- #
-- Add table "Inventory"                                                  #
-- ---------------------------------------------------------------------- #
CREATE TABLE inventory (
	`Dealership_id` INT,
    `VIN` VARCHAR(30),
    FOREIGN KEY (`VIN`) REFERENCES `vehicles` (`VIN`),
    FOREIGN KEY (`Dealership_id`) REFERENCES `dealerships` (`Dealership_id`),
    `quantity` INT,
    PRIMARY KEY (`Dealership_id`, `VIN`)
);

-- ---------------------------------------------------------------------- #
-- Add table "Sales Contract"                                             #
-- ---------------------------------------------------------------------- #
CREATE TABLE `sale_contract` (
    `contract_id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `VIN` VARCHAR(30),
    `sale_date` DATE DEFAULT(CURRENT_DATE),
    `Salesprice` DOUBLE NOT NULL,
    FOREIGN KEY (`VIN`) REFERENCES `vehicles` (`VIN`)
);


-- ---------------------------------------------------------------------- #
-- Add table "Lease Contract"                                             #
-- ---------------------------------------------------------------------- #
CREATE TABLE `lease_contract` (
    `lease_id` INT AUTO_INCREMENT PRIMARY KEY,
    `VIN` VARCHAR(30),
    `first name` VARCHAR(50) NOT NULL,
    `last name` VARCHAR(50) NOT NULL,
    `lease_start_date` DATE,
    `lease_end_date` DATE,
    `monthly_payment` DOUBLE NOT NULL,
    `security_deposit` DOUBLE NOT NULL,
     FOREIGN KEY (`VIN`) REFERENCES `vehicles` (`VIN`)
);


# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #
INSERT INTO `dealerships` (`name`, `address`, `phone`)
VALUES
  ('ABC Motors', '123 Main St', '555-1234'),
  ('XYZ Cars', '456 Oak St', '555-5678'),
  ('Quick Auto Sales', '789 Elm St', '555-9876'),
  ('City Autos', '101 Pine Ave', '555-4567'),
  ('Sunny Car Dealers', '202 Sunflower Blvd', '555-7890'),
  ('Greenfield Motors', '303 Meadow Ln', '555-2345');

  
# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #
  
INSERT INTO `vehicles` (`Make`, `Model`, `Color`, `VIN`, `Sold`, `Price`, `Dealership_id`)
VALUES
  ('Toyota', 'Camry', 'Blue', '1TXYM345', FALSE, 25000.00, 1),
  ('Honda', 'Civic', 'Red', '2HGBB123', TRUE, 22000.00, 2),
  ('Ford', 'Mustang', 'Yellow', '1FABP456', FALSE, 35000.00, 3),
  ('Chevrolet', 'Silverado', 'Black', '1GCDC789', FALSE, 40000.00, 4),
  ('Nissan', 'Altima', 'White', '1NABCDEF', TRUE, 28000.00, 5),
  ('BMW', 'X5', 'Silver', '5UXJL345', FALSE, 50000.00, 2),
  ('Mercedes-Benz', 'C-Class', 'Gray', 'WDDW456', FALSE, 45000.00, 3),
  ('Audi', 'Q5', 'Green', 'WA1AFBCD', TRUE, 48000.00, 1),
  ('Hyundai', 'Elantra', 'Purple', '5NPDH678', FALSE, 23000.00, 2),
  ('Kia', 'Sorento', 'Orange', '5XYPZ901', TRUE, 32000.00, 5),
  ('Tesla', 'Model 3', 'Blue', '5YJSA456', FALSE, 60000.00, 1),
  ('Subaru', 'Outback', 'Brown', '4S4BS678', FALSE, 28000.00, 2),
  ('Mazda', 'CX-5', 'Red', 'JM3KF123', TRUE, 30000.00, 3),
  ('Volvo', 'XC90', 'White', 'YV4A1234', FALSE, 55000.00, 4),
  ('Lexus', 'RX', 'Black', '2T2BZ789', FALSE, 48000.00, 5),
  ('Jeep', 'Wrangler', 'Green', '1C4BJ567', TRUE, 32000.00, 1),
  ('Volkswagen', 'Golf', 'Silver', 'WVWZZZ01', FALSE, 22000.00, 2),
  ('Buick', 'Enclave', 'Gold', '5GADRB23', FALSE, 38000.00, 3),
  ('Chrysler', 'Pacifica', 'Purple', '2C4RC456', TRUE, 36000.00, 4),
  ('Infiniti', 'QX60', 'Gray', '5N1DL567', FALSE, 47000.00, 5);
  
# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #
INSERT INTO `inventory` (`VIN`, `Dealership_id`, `quantity`)
VALUES
  ('1TXYM345', 1, 5),
  ('2HGBB123', 2, 3),
  ('1FABP456', 3, 8),
  ('1GCDC789', 4, 2),
  ('1NABCDEF', 5, 10),
  ('5UXJL345', 1, 4),
  ('WDDW456', 2, 6),
  ('WA1AFBCD', 3, 7),
  ('5NPDH678', 4, 3),
  ('5XYPZ901', 5, 9),
  ('5YJSA456', 1, 2),
  ('4S4BS678', 2, 5),
  ('JM3KF123', 3, 4),
  ('YV4A1234', 4, 6),
  ('2T2BZ789', 5, 1),
  ('1C4BJ567', 1, 3),
  ('WVWZZZ01', 2, 8),
  ('5GADRB23', 3, 2),
  ('2C4RC456', 4, 7),
  ('5N1DL567', 5, 4);
  
# ---------------------------------------------------------------------- #
# Add info into "Sales Contract"                                         #
# ---------------------------------------------------------------------- #

INSERT INTO `sale_contract` (`first_name`, `last_name`, `VIN`, `sale_date`, `Salesprice`)
VALUES
  ('John', 'Doe', '1TXYM345', '2023-01-01', 20000.00),
  ('Jane', 'Smith', '2HGBB123', '2023-02-15', 25000.00),
  ('Bob', 'Johnson', '1FABP456', '2023-03-10', 18000.00),
  ('Alice', 'Williams', '1GCDC789', '2023-04-20', 30000.00),
  ('Charlie', 'Brown', '1NABCDEF', '2023-05-05', 22000.00),
  ('Eva', 'Davis', '5UXJL345', '2023-06-18', 28000.00),
  ('Frank', 'Miller', 'WDDW456', '2023-07-03', 32000.00),
  ('Grace', 'Taylor', 'WA1AFBCD', '2023-08-22', 27000.00),
  ('Harry', 'Harris', '5NPDH678', '2023-09-14', 19000.00),
  ('Ivy', 'Turner', '5XYPZ901', '2023-10-30', 35000.00),
  ('Jack', 'Robinson', '5YJSA456', '2023-11-12', 23000.00),
  ('Kelly', 'White', '4S4BS678', '2023-12-05', 26000.00),
  ('Leo', 'Garcia', 'JM3KF123', '2024-01-20', 29000.00),
  ('Mia', 'King', 'YV4A1234', '2024-02-08', 24000.00),
  ('Noah', 'Turner', '2T2BZ789', '2024-03-25', 31000.00),
  ('Olivia', 'Hall', '1C4BJ567', '2024-04-09', 20000.00),
  ('Paula', 'Davis', 'WVWZZZ01', '2024-05-15', 33000.00),
  ('Quincy', 'Adams', '5GADRB23', '2024-06-28', 27000.00),
  ('Ryan', 'White', '2C4RC456', '2024-07-10', 18000.00),
  ('Samantha', 'Smith', '5N1DL567', '2024-08-14', 25000.00);
  
# ---------------------------------------------------------------------- #
# Add info into "Lease Contract"                                         #
# ---------------------------------------------------------------------- #

INSERT INTO `lease_contract` (`first_name`, `last_name`, `VIN`, `lease_start_date`, `lease_end_date`, `monthly_payment`, `security_deposit`)
VALUES
  ('Amy', 'Anderson', '1TXYM345', '2023-01-01', '2024-01-01', 300.00, 500.00),
  ('Benjamin', 'Baker', '2HGBB123', '2023-02-01', '2024-02-01', 350.00, 600.00),
  ('Catherine', 'Clark', '1FABP456', '2023-03-01', '2024-03-01', 320.00, 550.00),
  ('David', 'Dawson', '1GCDC789', '2023-04-01', '2024-04-01', 400.00, 700.00),
  ('Emma', 'Evans', '1NABCDEF', '2023-05-01', '2024-05-01', 380.00, 650.00),
  ('Felix', 'Fisher', '5UXJL345', '2023-06-01', '2024-06-01', 420.00, 720.00),
  ('Grace', 'Green', 'WDDW456', '2023-07-01', '2024-07-01', 360.00, 600.00),
  ('Henry', 'Hill', 'WA1AFBCD', '2023-08-01', '2024-08-01', 340.00, 580.00),
  ('Isabel', 'Ivory', '5NPDH678', '2023-09-01', '2024-09-01', 310.00, 550.00),
  ('James', 'Jones', '5XYPZ901', '2023-10-01', '2024-10-01', 380.00, 650.00),
  ('Karen', 'Keller', '5YJSA456', '2023-11-01', '2024-11-01', 400.00, 700.00),
  ('Leo', 'Lopez', '4S4BS678', '2023-12-01', '2024-12-01', 340.00, 580.00),
  ('Mia', 'Martinez', 'JM3KF123', '2024-01-01', '2025-01-01', 320.00, 550.00),
  ('Nathan', 'Nelson', 'YV4A1234', '2024-02-01', '2025-02-01', 420.00, 720.00),
  ('Olivia', 'Owens', '2T2BZ789', '2024-03-01', '2025-03-01', 360.00, 600.00),
  ('Patrick', 'Perez', '1C4BJ567', '2024-04-01', '2025-04-01', 380.00, 650.00),
  ('Quinn', 'Quintana', 'WVWZZZ01', '2024-05-01', '2025-05-01', 400.00, 700.00),
  ('Rachel', 'Rodriguez', '5GADRB23', '2024-06-01', '2025-06-01', 340.00, 580.00),
  ('Samuel', 'Scott', '2C4RC456', '2024-07-01', '2025-07-01', 320.00, 550.00),
  ('Taylor', 'Thomas', '5N1DL567', '2024-08-01', '2025-08-01', 420.00, 720.00);