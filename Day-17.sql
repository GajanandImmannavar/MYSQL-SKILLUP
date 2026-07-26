-- use Joins;

-- INSERT INTO Categories (Category_Name)
-- VALUES
-- ('ELECTRONICS'),
-- ('FURNITURE'),
-- ('CLOTHING'),
-- ('GROCERY'),
-- ('SPORTS'),
-- ('BOOKS'),ss
-- ('TOYS'),
-- ('BEAUTY'),
-- ('HOME_APPLIANCES'),
-- ('STATIONERY');

-- select * from categories;



-- INSERT INTO Supplier
-- (Supplier_Name, Supplier_City, Phone, Email)
-- VALUES
-- ('Tech World Distributors', 'BENGALURU', '9876501001', 'techworld@gmail.com'),
-- ('Furniture Hub', 'MYSURU', '9876501002', 'furniturehub@gmail.com'),
-- ('Fashion Point', 'DELHI', '9876501003', 'fashionpoint@gmail.com'),
-- ('Fresh Mart Suppliers', 'CHENNAI', '9876501004', 'freshmart@gmail.com'),
-- ('Sports Zone', 'MUMBAI', '9876501005', 'sportszone@gmail.com'),
-- ('Book Planet', 'HYDERABAD', '9876501006', 'bookplanet@gmail.com'),
-- ('Toy Kingdom', 'PUNE', '9876501007', 'toykingdom@gmail.com'),
-- ('Beauty Care Pvt Ltd', 'NOIDA', '9876501008', 'beautycare@gmail.com'),
-- ('Home Essentials', 'KOCHI', '9876501009', 'homeessentials@gmail.com'),
-- ('Office Stationers', 'KOLKATA', '9876501010', 'officestationers@gmail.com');

-- INSERT INTO Inventory
-- (Product_Name, Category_ID, Supplier_ID, Brand, Price, Stock, Rating, Product_Status)
-- VALUES
-- ('iPhone 16',               1, 1, 'Apple',        85000.00, 25, 5, 'AVAILABLE'),
-- ('Galaxy S25',              1, 1, 'Samsung',      72000.00, 40, 4, 'AVAILABLE'),
-- ('Wooden Sofa',             2, 2, 'IKEA',         35000.00, 18, 5, 'AVAILABLE'),
-- ('Office Chair',            2, 2, 'Godrej',       12000.00, 50, 4, 'AVAILABLE'),
-- ('Men T-Shirt',             3, 3, 'Nike',          1800.00,100, 4, 'AVAILABLE'),
-- ('Rice Bag',                4, 4, 'India Gate',   2500.00,120, 5, 'AVAILABLE'),
-- ('Cricket Bat',             5, 5, 'SS',           8500.00, 22, 5, 'AVAILABLE'),
-- ('Java Programming',        6, 6, 'Pearson',       950.00, 35, 5, 'AVAILABLE'),
-- ('Remote Control Car',      7, 7, 'Funskool',     2500.00, 28, 4, 'AVAILABLE'),
-- ('Face Wash',               8, 8, 'Nivea',         450.00, 60, 4, 'AVAILABLE'),
-- ('Microwave Oven',          9, 9, 'LG',          18000.00, 12, 5, 'AVAILABLE'),
-- ('Notebook Pack',          10,10, 'Classmate',    350.00,200, 5, 'AVAILABLE'),
-- ('MacBook Air',             1, 1, 'Apple',      115000.00, 10, 5, 'AVAILABLE'),
-- ('Dining Table',            2, 2, 'Nilkamal',    22000.00, 15, 4, 'AVAILABLE'),
-- ('Football',                5, 5, 'Nike',         2200.00, 40, 4, 'AVAILABLE');



-- INSERT INTO Customer
-- (Customer_Name, Gender, City, Phone, Email, Join_Date)
-- VALUES
-- ('Aarav Sharma',   'MALE',   'BENGALURU', '9876502001', 'aarav@gmail.com',   '2025-01-10'),
-- ('Ananya Rao',     'FEMALE', 'MYSURU',    '9876502002', 'ananya@gmail.com',  '2025-02-15'),
-- ('Rahul Verma',    'MALE',   'DELHI',     '9876502003', 'rahul@gmail.com',   '2025-03-12'),
-- ('Sneha Patil',    'FEMALE', 'CHENNAI',   '9876502004', 'sneha@gmail.com',   '2025-04-18'),
-- ('Kiran Kumar',    'MALE',   'MUMBAI',    '9876502005', 'kiran@gmail.com',   '2025-05-20'),
-- ('Pooja Singh',    'FEMALE', 'HYDERABAD', '9876502006', 'pooja@gmail.com',   '2025-06-25'),
-- ('Rohit Desai',    'MALE',   'PUNE',      '9876502007', 'rohit@gmail.com',   '2025-07-14'),
-- ('Kavya Shetty',   'FEMALE', 'NOIDA',     '9876502008', 'kavya@gmail.com',   '2025-08-09'),
-- ('Vikram Joshi',   'MALE',   'KOCHI',     '9876502009', 'vikram@gmail.com',  '2025-09-11'),
-- ('Meera Nair',     'FEMALE', 'KOLKATA',   '9876502010', 'meera@gmail.com',   '2025-10-05');




-- INSERT INTO Orders
-- (Customer_ID, Product_ID, Quantity, Order_Date, Payment_Method, Payment_Status)
-- VALUES
-- (1, 1, 1, '2025-10-01', 'CARD', 'PAID'),
-- (2, 3, 2, '2025-10-02', 'UPI', 'PAID'),
-- (3, 5, 3, '2025-10-03', 'CASH', 'PAID'),
-- (4, 7, 1, '2025-10-04', 'UPI', 'PENDING'),
-- (5, 13, 1, '2025-10-05', 'CARD', 'PAID'),
-- (6, 15, 2, '2025-10-06', 'NET_BANKING', 'PAID'),
-- (7, 8, 1, '2025-10-07', 'UPI', 'FAILED'),
-- (8, 10, 4, '2025-10-08', 'CARD', 'PAID'),
-- (9, 12, 5, '2025-10-09', 'CASH', 'PAID'),
-- (10, 14, 1, '2025-10-10', 'NET_BANKING', 'PENDING'),
-- (1, 2, 2, '2025-10-11', 'UPI', 'PAID'),
-- (2, 4, 1, '2025-10-12', 'CARD', 'PAID'),
-- (3, 6, 3, '2025-10-13', 'UPI', 'FAILED'),
-- (4, 9, 2, '2025-10-14', 'CASH', 'PAID'),
-- (5, 11, 1, '2025-10-15', 'NET_BANKING', 'PAID'),
-- (6, 1, 1, '2025-10-16', 'CARD', 'PAID'),
-- (7, 5, 2, '2025-10-17', 'UPI', 'PENDING'),
-- (8, 3, 1, '2025-10-18', 'CARD', 'PAID'),
-- (9, 15, 2, '2025-10-19', 'NET_BANKING', 'PAID'),
-- (10, 13, 1, '2025-10-20', 'UPI', 'PAID');

-- show tables;


-- 🏢 Business Scenario

-- The sales manager wants a report showing:

-- Customer Name
-- Order ID
-- Order Date

-- for every order placed.



-- SELECT Customer_Name, Order_Id, Order_Date
-- FROM Customer
-- JOIN Orders
-- ON Customer.Customer_ID = Orders.Customer_ID;



-- 🏢 Business Scenario

-- The sales manager wants to prepare a report showing which products each customer purchased.

-- He needs the following information:

-- Customer Name
-- Product Name
-- Order Date

-- The report should include only customers who have placed orders.

-- Sort the report by:

-- Customer Name (A–Z)
-- Order Date (Oldest to Newest)



-- SELECT Customer.Customer_Name,
--        Inventory.Product_Name,
--        Orders.Order_Date
-- FROM Customer
-- JOIN Orders
-- ON Customer.Customer_ID = Orders.Customer_ID
-- JOIN Inventory
-- ON Orders.Product_ID = Inventory.Product_ID
-- WHERE Inventory.Product_Status = 'AVAILABLE'
-- ORDER BY Customer.Customer_Name ASC,
--          Orders.Order_Date ASC;


-- 🏢 Main Problem (Core Learning)

-- Business Scenario

-- The customer support team wants a report showing every order along with the customer who placed it.

-- Display:

-- Customer Name
-- Order ID

-- Sort by:

-- Customer Name (A–Z)





-- Select Customer.Customer_Name, Orders.Order_Id
-- from Customer
-- join Orders
-- on Customer.Customer_Id = Orders.Customer_Id
-- order by Customer.Customer_Name asc;


-- 🔄 Revision Problem

-- This section revises previous topics while practicing JOIN.

-- Business Scenario

-- The sales manager wants the names of customers who:

-- placed orders using UPI
-- have Payment_Status = 'PAID'

-- Display only:

-- Customer Name

-- Remove duplicate names.

-- Sort alphabetically.

-- Concepts Revised
-- ✅ INNER JOIN
-- ✅ WHERE
-- ✅ DISTINCT
-- ✅ ORDER BY

-- select distinct Customer.Customer_Name
-- from Customer
-- join Orders
-- on Customer.Customer_Id = Orders.Customer_Id
-- where Payment_Method = "UPI" and Payment_Status = 'Paid'
-- order by Customer.Customer_Name;



-- 📊 SQL Execution Trace
-- Customer Table

-- ↓

-- JOIN Orders

-- ↓

-- ON Customer.Customer_ID = Orders.Customer_ID

-- ↓

-- Virtual Table

-- ↓

-- WHERE Payment_Method = 'UPI'
--       AND Payment_Status = 'PAID'

-- ↓

-- SELECT DISTINCT Customer_Name

-- ↓

-- ORDER BY Customer_Name ASC

-- ↓

-- Final Output






