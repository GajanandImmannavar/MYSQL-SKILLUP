show databases;

create DATABASE IF NOT EXISTS Day8;

USE Day8;

CREATE TABLE Product (
    PRODUCT_ID INT PRIMARY KEY AUTO_INCREMENT,
    PRODUCT_NAME VARCHAR(100),
    CATEGORY ENUM('ELECTRONICS','FURNITURE','CLOTHING','GROCERY','SPORTS'),
    BRAND VARCHAR(100),
    PRICE DECIMAL(10,2),
    STOCK INT,
    RATING INT CHECK(RATING BETWEEN 1 AND 5),
    SUPPLIER_CITY VARCHAR(100),
    WARRANTY_YEARS INT,
    PRODUCT_STATUS ENUM('AVAILABLE','OUT_OF_STOCK','DISCONTINUED'),
    LAUNCH_DATE DATE
);


INSERT INTO Product
(PRODUCT_NAME, CATEGORY, BRAND, PRICE, STOCK, RATING, SUPPLIER_CITY, WARRANTY_YEARS, PRODUCT_STATUS, LAUNCH_DATE)
VALUES
('iPhone 16','ELECTRONICS','Apple',85000,25,5,'BENGALURU',2,'AVAILABLE','2026-01-10'),
('Galaxy S25','ELECTRONICS','Samsung',72000,40,4,'CHENNAI',2,'AVAILABLE','2026-02-15'),
('OnePlus 14','ELECTRONICS','OnePlus',56000,35,5,'HYDERABAD',2,'AVAILABLE','2026-03-12'),
('Dell Inspiron','ELECTRONICS','Dell',68000,18,4,'PUNE',3,'AVAILABLE','2025-11-01'),
('HP Pavilion','ELECTRONICS','HP',64000,12,3,'DELHI',2,'AVAILABLE','2025-10-20'),
('Sony TV','ELECTRONICS','Sony',95000,10,5,'MUMBAI',3,'AVAILABLE','2025-08-18'),
('LG Refrigerator','ELECTRONICS','LG',42000,8,4,'NOIDA',5,'AVAILABLE','2025-06-12'),
('Wooden Sofa','FURNITURE','IKEA',35000,15,5,'MYSURU',1,'AVAILABLE','2024-09-05'),
('Office Chair','FURNITURE','Godrej',8500,50,4,'BENGALURU',2,'AVAILABLE','2025-01-18'),
('Dining Table','FURNITURE','Nilkamal',22000,20,4,'PUNE',2,'AVAILABLE','2024-11-11'),
('King Bed','FURNITURE','Durian',45000,7,5,'CHENNAI',5,'AVAILABLE','2025-07-15'),
('Bookshelf','FURNITURE','IKEA',12000,18,3,'HYDERABAD',1,'AVAILABLE','2025-05-08'),
('Men T-Shirt','CLOTHING','Nike',1800,100,4,'DELHI',0,'AVAILABLE','2026-01-01'),
('Women Jacket','CLOTHING','Adidas',4200,60,5,'MUMBAI',0,'AVAILABLE','2025-12-15'),
('Jeans','CLOTHING','Levis',3500,80,4,'BENGALURU',0,'AVAILABLE','2025-11-25'),
('Sports Shoes','CLOTHING','Puma',6500,45,5,'PUNE',0,'AVAILABLE','2026-02-10'),
('Rice Bag','GROCERY','IndiaGate',2500,120,5,'MYSURU',0,'AVAILABLE','2025-03-20'),
('Cooking Oil','GROCERY','Fortune',1800,90,4,'CHENNAI',0,'AVAILABLE','2025-02-14'),
('Tea Powder','GROCERY','Tata',600,150,5,'BENGALURU',0,'AVAILABLE','2024-12-01'),
('Coffee Powder','GROCERY','Nescafe',850,130,4,'HYDERABAD',0,'AVAILABLE','2025-01-30'),
('Cricket Bat','SPORTS','SS',8500,22,5,'DELHI',1,'AVAILABLE','2025-06-22'),
('Football','SPORTS','Nike',2200,40,4,'MUMBAI',1,'AVAILABLE','2025-08-18'),
('Badminton Racket','SPORTS','Yonex',4200,35,5,'BENGALURU',2,'AVAILABLE','2025-10-01'),
('Gym Dumbbells','SPORTS','Kore',6800,28,4,'PUNE',2,'AVAILABLE','2024-09-09'),
('Treadmill','SPORTS','PowerMax',52000,5,5,'NOIDA',3,'AVAILABLE','2025-04-14'),
('Smart Watch','ELECTRONICS','Apple',48000,0,5,'BENGALURU',2,'OUT_OF_STOCK','2025-12-20'),
('Bluetooth Speaker','ELECTRONICS','JBL',8500,0,4,'CHENNAI',1,'OUT_OF_STOCK','2025-11-18'),
('Microwave Oven','ELECTRONICS','IFB',18000,0,3,'HYDERABAD',2,'OUT_OF_STOCK','2024-10-25'),
('Winter Coat','CLOTHING','Zara',7800,0,5,'DELHI',0,'DISCONTINUED','2023-12-12'),
('Study Table','FURNITURE','Godrej',14500,0,4,'MYSURU',2,'DISCONTINUED','2024-02-05');


select * from product;

SQL Revision Challenge – Products Table
Problem 1 ⭐ (Easy)

Business Scenario

The sales manager wants to review products that:

belong to the Electronics category,
have a price between ₹40,000 and ₹90,000,
are currently Available.

Display:

Product Name
Brand
Price
Rating

Sort by:

Price (Highest first)
Product Name (A–Z)

Topics Covered

SELECT
WHERE
AND
BETWEEN
ORDER BY


select Product_Name , Brand,  Price, Rating

from Product 

where Category = "Electronics"
      and Price Between 40000 and 90000
     and PRODUCT_STATUS = "Available"

    order by Price desc, Product_Name asc;


Problem 2 ⭐

Business Scenario

Find all products supplied from cities whose names start with B.

Display:

Product Name
Supplier City
Price

Sort alphabetically by city.

Topics Covered

SELECT
WHERE
LIK
ORDER BY

SELECT Product_Name, Supplier_City, Price
FROM Product
WHERE Supplier_City LIKE 'B%'
ORDER BY Supplier_City ASC;


Problem 3 ⭐

Business Scenario

Display all products where:

Rating is 4 or 5
Stock is greater than 20

Display:

Product Name
Rating
Stock

Sort by Rating (Highest first).

Topics Covered

SELECT
WHERE
AND
ORDER BY


SELECT Product_Name, Rating, Stock
FROM Product
WHERE Rating IN (4, 5)
  AND Stock > 20
ORDER BY Rating DESC;



Problem 4 ⭐

Business Scenario

The warehouse manager wants products that:

belong to Furniture or Sports
have a price less than ₹30,000

Display:

Product Name
Category
Price

Sort by Category.

Topics Covered

SELECT
WHERE
OR
ORDER BY

select Product_Name, Category, Price
from Product
where CATEGORY = "Furniture"  and 
      Price < 30000
order by Category ;



Problem 5 ⭐

Business Scenario

Show all products whose brand name contains the letter A.

Display:

Product Name
Brand

Sort alphabetically by Brand.

Topics Covered

LIKE
ORDER BY

SELECT Product_Name, Brand
FROM Product
WHERE Brand LIKE '%A%'
ORDER BY Brand ASC;


Problem 6 ⭐⭐

Business Scenario

Find products that:

have a warranty between 2 and 5 years
are Available
have a rating of at least 4

Display:

Product Name
Warranty Years
Rating

Sort by Warranty Years.

Topics Covered

WHERE
BETWEEN
AND
ORDER BY

SELECT Product_Name, Warranty_Years, Rating
FROM Product
WHERE Warranty_Years BETWEEN 2 AND 5
  AND Product_Status = 'AVAILABLE'
  AND Rating >= 4
ORDER BY Warranty_Years ASC;

Problem 7 ⭐⭐

Business Scenario

Display all unique brands that sell Electronics products.

Sort alphabetically.

Topics Covered

DISTINCT
WHERE
ORDER BY


SELECT DISTINCT Brand
FROM Product
WHERE Category = 'ELECTRONICS'
ORDER BY Brand ASC;

Problem 8 ⭐⭐

Business Scenario

Find products whose names end with "er".

Display:

Product Name
Price

Sort by Price.

Topics Covered

LIKE
ORDER BY

select Product_Name, Price
from Product 
where Product_Name like "%er"
order by Price;

Problem 9 ⭐⭐

Business Scenario

Display products that:

are Out of Stock
cost more than ₹10,000

Display:

Product Name
Price
Product Status

Sort by Price (Highest first).

Topics Covered

WHERE
AND
ORDER BY

select Product_Name, Price, Product_Status
from Product
where PRICE > 10000 and Product_Status = 'OUT_OF_STOCK'
order by  Price desc;

Problem 10 ⭐⭐

Business Scenario

Find products launched between 2025-01-01 and 2025-12-31.

Display:

Product Name
Launch Date
Category

Sort by Launch Date.

Topics Covered

BETWEEN
DATE
ORDER BY


select Product_Name,Launch_Date,Category
from Product
where Launch_Date between '2025-01-01' and '2025-12-31'
order by Launch_date;