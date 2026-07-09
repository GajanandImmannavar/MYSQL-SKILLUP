-- show databases;

-- create database if not exists Products;

-- use Products;

-- create Table Orders(
--     ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
    
--     PRODUCT_NAME VARCHAR(100),
    
--     CATEGORY VARCHAR(50),
--     BRAND VARCHAR(50),

--     CUSTOMER_NAME VARCHAR(100),
--     CUSTOMER_CITY VARCHAR(50),

--     PRICE DECIMAL(10,2),
--     QUANTITY INT,

--     DISCOUNT_PERCENT DECIMAL(5,2) DEFAULT 0.00,
--     FINAL_AMOUNT DECIMAL(10,2),

--     PAYMENT_METHOD ENUM(
--         'UPI',
--         'CREDIT_CARD',
--         'DEBIT_CARD',
--         'NET_BANKING',
--         'COD'
--     ),

--     PAYMENT_STATUS ENUM(
--         'PAID',
--         'PENDING',
--         'FAILED',
--         'REFUNDED',
--         'UNPAID'

-- ) DEFAULT 'UNPAID',
-- PACK_STATUS ENUM(
--      'PACKED',
--      'NOT PACKED'
-- ) DEFAULT 'NOT PACKED',

-- DELIVERY_STATUS ENUM(
--     'ORDERED',
--     'PACKED',
--     'SHIPPED',
--     'OUT FOR DELIVERY',
--     'DELIVERED',
--     'CANCELLED',
--     'RETURNED'
-- ) DEFAULT 'ORDERED',

-- DELIVERY_PARTNER VARCHAR(50),

-- RATING INT CHECK(RATING BETWEEN 1 AND 5),

-- REVIEW ENUM(
--     'EXCELLENT',
--     'GOOD',
--     'AVERAGE',
--     'POOR',
--     'BAD'
-- ),
-- ORDER_DATE DATE,
-- PACKED_DATE DATE,
-- SHIPPED_DATE DATE,
-- DELIVERED_DATE DATE,
-- CANCELLED_DATE DATE,
-- RETURNED_DATE DATE
-- );

-- DESCRIBE Orders;

-- ALTER TABLE Orders
-- MODIFY COLUMN PACK_STATUS ENUM(
--     'PENDING',
--     'PACKED'
-- ) DEFAULT 'PENDING';

-- ALTER TABLE Orders
-- MODIFY COLUMN REVIEW TEXT;


-- INSERT INTO Orders (
-- PRODUCT_NAME, CATEGORY, BRAND, CUSTOMER_NAME, CUSTOMER_CITY, PRICE, QUANTITY, DISCOUNT_PERCENT, FINAL_AMOUNT, PAYMENT_METHOD, PAYMENT_STATUS,
-- PACK_STATUS, DELIVERY_STATUS, DELIVERY_PARTNER,RATING,REVIEW,ORDER_DATE, PACKED_DATE,SHIPPED_DATE, DELIVERED_DATE, CANCELLED_DATE,RETURNED_DATE
-- )VALUES

-- ('iPhone 16','Electronics','Apple','Gajanand','Bangalore',
-- 79999.00,1,10.00,71999.10,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'Ekart',5,'Excellent product and super fast delivery.',
-- '2025-01-02','2025-01-03','2025-01-04','2025-01-06',
-- NULL,NULL),
-- ('Galaxy S24','Electronics','Samsung','Harshitha','Mysore',
-- 68999.00,1,5.00,65549.05,
-- 'CREDIT_CARD','PAID','PACKED','DELIVERED',
-- 'Blue Dart',4,'Good camera quality.',
-- '2025-01-05','2025-01-06','2025-01-07','2025-01-09',
-- NULL,NULL),
-- ('Boat Airdopes 311','Accessories','Boat','Adil','Hubli',
-- 1499.00,2,15.00,2548.30,
-- 'COD','UNPAID','PENDING','ORDERED',
-- NULL,NULL,NULL,
-- '2025-01-08',NULL,NULL,NULL,
-- NULL,NULL),
-- ('Dell Inspiron 15','Electronics','Dell','Rahul','Hyderabad',
-- 58999.00,1,8.00,54279.08,
-- 'DEBIT_CARD','PAID','PACKED','SHIPPED',
-- 'Delhivery',NULL,NULL,
-- '2025-01-10','2025-01-11','2025-01-12',NULL,
-- NULL,NULL),
-- ('Nike Running Shoes','Fashion','Nike','Priya','Bangalore',
-- 4999.00,1,20.00,3999.20,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'XpressBees',5,'Very comfortable shoes.',
-- '2025-01-12','2025-01-13','2025-01-14','2025-01-16',
-- NULL,NULL),
-- ('Sony Bravia 55 TV','Electronics','Sony','Arjun','Chennai',
-- 75999.00,1,12.00,66879.12,
-- 'NET_BANKING','FAILED','PENDING','CANCELLED',
-- NULL,NULL,NULL,
-- '2025-01-14',NULL,NULL,NULL,
-- '2025-01-15',NULL),
-- ('HP Pavilion Laptop','Electronics','HP','Sneha','Belagavi',
-- 62999.00,1,10.00,56699.10,
-- 'UPI','PAID','PACKED','OUT FOR DELIVERY',
-- 'DTDC',NULL,NULL,
-- '2025-01-15','2025-01-16','2025-01-17',NULL,
-- NULL,NULL),
-- ('Puma Sports T-Shirt','Fashion','Puma','Rohit','Pune',
-- 1499.00,3,25.00,3372.75,
-- 'COD','PENDING','PENDING','ORDERED',
-- NULL,NULL,NULL,
-- '2025-01-18',NULL,NULL,NULL,
-- NULL,NULL),
-- ('LG Washing Machine','Home Appliances','LG','Anjali','Mumbai',
-- 32999.00,1,18.00,27059.18,
-- 'CREDIT_CARD','REFUNDED','PACKED','RETURNED',
-- 'Ecom Express',2,'Product had a manufacturing defect.',
-- '2025-01-20','2025-01-21','2025-01-22','2025-01-24',
-- NULL,'2025-01-28'),
-- ('OnePlus 13','Electronics','OnePlus','Kiran','Delhi',
-- 54999.00,1,7.00,51149.07,
-- 'DEBIT_CARD','PAID','PACKED','DELIVERED',
-- 'Ekart',4,'Smooth performance and battery backup.',
-- '2025-01-22','2025-01-23','2025-01-24','2025-01-26',
-- NULL,NULL);

-- select * from Orders;


-- INSERT INTO Orders (
-- PRODUCT_NAME, CATEGORY, BRAND, CUSTOMER_NAME, CUSTOMER_CITY, PRICE, QUANTITY, DISCOUNT_PERCENT, FINAL_AMOUNT, PAYMENT_METHOD, PAYMENT_STATUS,
-- PACK_STATUS, DELIVERY_STATUS, DELIVERY_PARTNER,RATING,REVIEW,ORDER_DATE, PACKED_DATE,SHIPPED_DATE, DELIVERED_DATE, CANCELLED_DATE,RETURNED_DATE
-- )VALUES
--     ('Apple Watch Series 10','Electronics','Apple','Vikram','Bangalore',
-- 45999.00,1,10.00,41399.10,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'Ekart',5,'Excellent smartwatch with smooth performance.',
-- '2025-02-01','2025-02-02','2025-02-03','2025-02-05',
-- NULL,NULL),

-- ('Samsung Smart TV 43','Electronics','Samsung','Pooja','Mysore',
-- 38999.00,1,15.00,33149.15,
-- 'CREDIT_CARD','PAID','PACKED','DELIVERED',
-- 'Blue Dart',4,'Picture quality is very good.',
-- '2025-02-03','2025-02-04','2025-02-05','2025-02-08',
-- NULL,NULL),

-- ('Lenovo IdeaPad Slim 5','Electronics','Lenovo','Ajay','Hubli',
-- 56999.00,1,12.00,50159.12,
-- 'NET_BANKING','PAID','PACKED','SHIPPED',
-- 'Delhivery',NULL,NULL,
-- '2025-02-05','2025-02-06','2025-02-07',NULL,
-- NULL,NULL),

-- ('Adidas Running Shoes','Fashion','Adidas','Neha','Bangalore',
-- 5999.00,2,20.00,9598.40,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'XpressBees',5,'Very comfortable for running.',
-- '2025-02-07','2025-02-08','2025-02-09','2025-02-11',
-- NULL,NULL),

-- ('Boat Stone Speaker','Electronics','Boat','Manoj','Mumbai',
-- 2999.00,1,5.00,2849.05,
-- 'COD','UNPAID','PENDING','ORDERED',
-- NULL,NULL,NULL,
-- '2025-02-09',NULL,NULL,NULL,
-- NULL,NULL),

-- ('LG Refrigerator 260L','Home Appliances','LG','Keerthi','Chennai',
-- 42999.00,1,10.00,38699.10,
-- 'DEBIT_CARD','FAILED','PENDING','CANCELLED',
-- NULL,NULL,NULL,
-- '2025-02-10',NULL,NULL,NULL,
-- '2025-02-11',NULL),

-- ('Sony Wireless Headphones','Electronics','Sony','Abhishek','Hyderabad',
-- 8999.00,1,8.00,8279.08,
-- 'UPI','PAID','PACKED','OUT FOR DELIVERY',
-- 'DTDC',NULL,NULL,
-- '2025-02-12','2025-02-13','2025-02-14',NULL,
-- NULL,NULL),

-- ('Puma Hoodie','Fashion','Puma','Kavya','Belagavi',
-- 2499.00,2,25.00,3748.50,
-- 'COD','PENDING','PENDING','ORDERED',
-- NULL,NULL,NULL,
-- '2025-02-14',NULL,NULL,NULL,
-- NULL,NULL),

-- ('Dell Gaming Monitor','Electronics','Dell','Suresh','Pune',
-- 18999.00,1,15.00,16149.15,
-- 'CREDIT_CARD','REFUNDED','PACKED','RETURNED',
-- 'Ecom Express',2,'Screen flickering issue.',
-- '2025-02-16','2025-02-17','2025-02-18','2025-02-20',
-- NULL,'2025-02-24'),

-- ('OnePlus Buds 3','Accessories','OnePlus','Divya','Delhi',
-- 5499.00,2,10.00,9898.20,
-- 'DEBIT_CARD','PAID','PACKED','DELIVERED',
-- 'Ekart',4,'Good sound quality and battery life.',
-- '2025-02-18','2025-02-19','2025-02-20','2025-02-22',
-- NULL,NULL);

-- INSERT INTO Orders (
-- PRODUCT_NAME, CATEGORY, BRAND, CUSTOMER_NAME, CUSTOMER_CITY, PRICE, QUANTITY, DISCOUNT_PERCENT, FINAL_AMOUNT, PAYMENT_METHOD, PAYMENT_STATUS,
-- PACK_STATUS, DELIVERY_STATUS, DELIVERY_PARTNER,RATING,REVIEW,ORDER_DATE, PACKED_DATE,SHIPPED_DATE, DELIVERED_DATE, CANCELLED_DATE,RETURNED_DATE
-- )VALUES ('Apple iPad Air M3','Electronics','Apple','Nikhil','Bangalore',
-- 64999.00,1,10.00,58499.10,
-- 'CREDIT_CARD','PAID','PACKED','DELIVERED',
-- 'Blue Dart',5,'Excellent display and battery life.',
-- '2025-03-01','2025-03-02','2025-03-03','2025-03-05',
-- NULL,NULL),

-- ('Samsung Galaxy Buds 3','Accessories','Samsung','Shreya','Mysore',
-- 9999.00,1,12.00,8799.12,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'Ekart',4,'Comfortable to wear and good sound.',
-- '2025-03-02','2025-03-03','2025-03-04','2025-03-06',
-- NULL,NULL),

-- ('HP Laser Printer','Electronics','HP','Mahesh','Hubli',
-- 18999.00,1,8.00,17479.08,
-- 'NET_BANKING','PAID','PACKED','SHIPPED',
-- 'Delhivery',NULL,NULL,
-- '2025-03-04','2025-03-05','2025-03-06',NULL,
-- NULL,NULL),

-- ('Nike Backpack','Fashion','Nike','Asha','Belagavi',
-- 2499.00,2,15.00,4248.30,
-- 'COD','UNPAID','PENDING','ORDERED',
-- NULL,NULL,NULL,
-- '2025-03-05',NULL,NULL,NULL,
-- NULL,NULL),

-- ('Sony Soundbar','Electronics','Sony','Ramesh','Hyderabad',
-- 14999.00,1,10.00,13499.10,
-- 'DEBIT_CARD','PAID','PACKED','OUT FOR DELIVERY',
-- 'DTDC',NULL,NULL,
-- '2025-03-07','2025-03-08','2025-03-09',NULL,
-- NULL,NULL),

-- ('LG Microwave Oven','Home Appliances','LG','Deepa','Chennai',
-- 12999.00,1,20.00,10399.20,
-- 'CREDIT_CARD','REFUNDED','PACKED','RETURNED',
-- 'Ecom Express',2,'Heating issue after one week.',
-- '2025-03-08','2025-03-09','2025-03-10','2025-03-12',
-- NULL,'2025-03-18'),

-- ('Dell Wireless Mouse','Accessories','Dell','Santosh','Pune',
-- 999.00,3,5.00,2847.15,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'Ekart',5,'Works perfectly.',
-- '2025-03-10','2025-03-11','2025-03-12','2025-03-13',
-- NULL,NULL),

-- ('Boat Rockerz 450','Electronics','Boat','Meghana','Mumbai',
-- 1999.00,2,10.00,3598.20,
-- 'COD','PENDING','PENDING','ORDERED',
-- NULL,NULL,NULL,
-- '2025-03-12',NULL,NULL,NULL,
-- NULL,NULL),

-- ('Adidas Cricket Kit','Sports','Adidas','Vinay','Delhi',
-- 7999.00,1,18.00,6559.18,
-- 'DEBIT_CARD','FAILED','PENDING','CANCELLED',
-- NULL,NULL,NULL,
-- '2025-03-14',NULL,NULL,NULL,
-- '2025-03-15',NULL),

-- ('OnePlus Nord CE 5','Electronics','OnePlus','Swathi','Bangalore',
-- 27999.00,1,10.00,25199.10,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'XpressBees',4,'Good performance for the price.',
-- '2025-03-15','2025-03-16','2025-03-17','2025-03-19',
-- NULL,NULL);

-- INSERT INTO Orders (
-- PRODUCT_NAME, CATEGORY, BRAND, CUSTOMER_NAME, CUSTOMER_CITY, PRICE, QUANTITY, DISCOUNT_PERCENT, FINAL_AMOUNT, PAYMENT_METHOD, PAYMENT_STATUS,
-- PACK_STATUS, DELIVERY_STATUS, DELIVERY_PARTNER,RATING,REVIEW,ORDER_DATE, PACKED_DATE,SHIPPED_DATE, DELIVERED_DATE, CANCELLED_DATE,RETURNED_DATE
-- )VALUES('MacBook Air M4','Electronics','Apple','Rakesh','Bangalore',
-- 99999.00,1,8.00,91999.08,
-- 'CREDIT_CARD','PAID','PACKED','DELIVERED',
-- 'Blue Dart',5,'Super fast laptop with excellent battery life.',
-- '2025-04-01','2025-04-02','2025-04-03','2025-04-05',
-- NULL,NULL),

-- ('Samsung Galaxy Watch 7','Electronics','Samsung','Lavanya','Mysore',
-- 28999.00,1,10.00,26099.10,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'Ekart',4,'Very good fitness tracking features.',
-- '2025-04-02','2025-04-03','2025-04-04','2025-04-06',
-- NULL,NULL),

-- ('Lenovo Legion 5','Electronics','Lenovo','Praveen','Hubli',
-- 89999.00,1,15.00,76499.15,
-- 'NET_BANKING','PAID','PACKED','SHIPPED',
-- 'Delhivery',NULL,NULL,
-- '2025-04-04','2025-04-05','2025-04-06',NULL,
-- NULL,NULL),

-- ('Nike Football','Sports','Nike','Akash','Belagavi',
-- 1499.00,2,5.00,2848.10,
-- 'COD','UNPAID','PENDING','ORDERED',
-- NULL,NULL,NULL,
-- '2025-04-05',NULL,NULL,NULL,
-- NULL,NULL),

-- ('Sony PlayStation 5','Electronics','Sony','Bhavana','Hyderabad',
-- 54999.00,1,5.00,52249.05,
-- 'DEBIT_CARD','PAID','PACKED','OUT FOR DELIVERY',
-- 'DTDC',NULL,NULL,
-- '2025-04-07','2025-04-08','2025-04-09',NULL,
-- NULL,NULL),

-- ('LG Air Conditioner 1.5 Ton','Home Appliances','LG','Naveen','Chennai',
-- 45999.00,1,12.00,40479.12,
-- 'CREDIT_CARD','REFUNDED','PACKED','RETURNED',
-- 'Ecom Express',1,'Cooling issue. Requested return.',
-- '2025-04-08','2025-04-09','2025-04-10','2025-04-12',
-- NULL,'2025-04-18'),

-- ('Dell Mechanical Keyboard','Accessories','Dell','Sanjana','Pune',
-- 3499.00,2,10.00,6298.20,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'Ekart',5,'Excellent keyboard for programming.',
-- '2025-04-10','2025-04-11','2025-04-12','2025-04-14',
-- NULL,NULL),

-- ('Boat Smart Ring','Electronics','Boat','Karthik','Mumbai',
-- 7999.00,1,20.00,6399.20,
-- 'COD','PENDING','PENDING','ORDERED',
-- NULL,NULL,NULL,
-- '2025-04-12',NULL,NULL,NULL,
-- NULL,NULL),

-- ('Adidas Gym Bag','Sports','Adidas','Monika','Delhi',
-- 2499.00,1,15.00,2124.15,
-- 'DEBIT_CARD','FAILED','PENDING','CANCELLED',
-- NULL,NULL,NULL,
-- '2025-04-14',NULL,NULL,NULL,
-- '2025-04-15',NULL),

-- ('OnePlus Pad 2','Electronics','OnePlus','Siddharth','Bangalore',
-- 42999.00,1,10.00,38699.10,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'XpressBees',4,'Excellent tablet for daily use.',
-- '2025-04-15','2025-04-16','2025-04-17','2025-04-19',
-- NULL,NULL);

-- INSERT INTO Orders (
-- PRODUCT_NAME, CATEGORY, BRAND, CUSTOMER_NAME, CUSTOMER_CITY, PRICE, QUANTITY, DISCOUNT_PERCENT, FINAL_AMOUNT, PAYMENT_METHOD, PAYMENT_STATUS,
-- PACK_STATUS, DELIVERY_STATUS, DELIVERY_PARTNER,RATING,REVIEW,ORDER_DATE, PACKED_DATE,SHIPPED_DATE, DELIVERED_DATE, CANCELLED_DATE,RETURNED_DATE
-- )VALUES
-- ('Apple AirPods Pro 2','Electronics','Apple','Amit','Mangalore',
-- 24999.00,1,10.00,22499.10,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'Ekart',5,'Amazing sound quality and noise cancellation.',
-- '2025-05-01','2025-05-02','2025-05-03','2025-05-05',
-- NULL,NULL),

-- ('Samsung Refrigerator 320L','Home Appliances','Samsung','Nisha','Bangalore',
-- 35999.00,1,12.00,31679.12,
-- 'CREDIT_CARD','PAID','PACKED','DELIVERED',
-- 'Blue Dart',4,'Spacious and energy efficient.',
-- '2025-05-03','2025-05-04','2025-05-05','2025-05-08',
-- NULL,NULL),

-- ('HP Victus Gaming Laptop','Electronics','HP','Ganesh','Hubli',
-- 72999.00,1,15.00,62049.15,
-- 'NET_BANKING','PAID','PACKED','SHIPPED',
-- 'Delhivery',NULL,NULL,
-- '2025-05-05','2025-05-06','2025-05-07',NULL,
-- NULL,NULL),

-- ('Nike Sports Cap','Fashion','Nike','Chaitra','Mysore',
-- 999.00,2,5.00,1898.10,
-- 'COD','UNPAID','PENDING','ORDERED',
-- NULL,NULL,NULL,
-- '2025-05-06',NULL,NULL,NULL,
-- NULL,NULL),

-- ('Sony Bluetooth Speaker','Electronics','Sony','Mahendra','Pune',
-- 6999.00,1,10.00,6299.10,
-- 'DEBIT_CARD','PAID','PACKED','OUT FOR DELIVERY',
-- 'DTDC',NULL,NULL,
-- '2025-05-08','2025-05-09','2025-05-10',NULL,
-- NULL,NULL),

-- ('LG Dishwasher','Home Appliances','LG','Shilpa','Hyderabad',
-- 38999.00,1,8.00,35879.08,
-- 'CREDIT_CARD','REFUNDED','PACKED','RETURNED',
-- 'Ecom Express',2,'Not satisfied with cleaning performance.',
-- '2025-05-10','2025-05-11','2025-05-12','2025-05-14',
-- NULL,'2025-05-20'),

-- ('Dell USB-C Dock','Accessories','Dell','Kiran','Chennai',
-- 8999.00,1,10.00,8099.10,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'Ekart',5,'Very useful docking station.',
-- '2025-05-12','2025-05-13','2025-05-14','2025-05-16',
-- NULL,NULL),

-- ('Boat Smart Watch','Electronics','Boat','Varun','Belagavi',
-- 3499.00,2,20.00,5598.40,
-- 'COD','PENDING','PENDING','ORDERED',
-- NULL,NULL,NULL,
-- '2025-05-15',NULL,NULL,NULL,
-- NULL,NULL),

-- ('Adidas Track Pants','Fashion','Adidas','Snehal','Mumbai',
-- 2999.00,2,15.00,5098.30,
-- 'DEBIT_CARD','FAILED','PENDING','CANCELLED',
-- NULL,NULL,NULL,
-- '2025-05-18',NULL,NULL,NULL,
-- '2025-05-19',NULL),

-- ('OnePlus Watch 3','Electronics','OnePlus','Rohan','Delhi',
-- 19999.00,1,10.00,17999.10,
-- 'UPI','PAID','PACKED','DELIVERED',
-- 'XpressBees',4,'Stylish design with good battery backup.',
-- '2025-05-20','2025-05-21','2025-05-22','2025-05-24',
-- NULL,NULL);

-- SELECT * from orders;

-- select * from orders where payment_status = 'paid';

-- select * from orders 
-- where price >= 50000;


-- select  product_name
-- from orders where price < 5000;



-- select * from orders where
-- payment_status = 'paid'
-- and price >= 50000;


-- select * from orders 
-- where payment_status = 'paid'
-- and pack_status = 'packed'

-- select * from   orders 
-- where delivery_status = 'cancelled'
-- or delivery_status = 'returned';











