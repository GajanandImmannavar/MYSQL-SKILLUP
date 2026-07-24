create database IF NOT EXISTS Joins;




create table Customer(
    Customer_Id int PRIMARY key AUTO_INCREMENT,
    Customer_Name varchar(100) Not Null,
    Gender  ENUM ('Male','Female') not Null,
    City varchar(100) Not Null,
    Phone varchar(15) UNIQUE,
    Email varchar(100) UNIQUE,
    Join_Date Date Not Null
);

desc Customer;



create table Categories(Category_ID int Primary key Auto_INCREMENT, 
                       Category_Name Varchar(100) UNIQUE);

desc Categories;


alter table Categories modify Category_Name varchar(100)not null;




create table Supplier(
    Supplier_Id int Primary key Auto_Increment,
    Supplier_Name varchar(100) not null,
    Supplier_City varchar(100) not null,
    Phone Varchar(100) UNIQUE,
    Email varchar(100) UNIQUE
);


desc Supplier;

create table Inventory (
    Product_Id  int Primary Key  AUTO_INCREMENT,
    Product_Name varchar(100) Not NULL,
    Category_Id int not null,
    Supplier_Id int Not Null,
    Brand varchar(100) Not Null,
    Price DECIMAL(10,2)Not Null,
    Stock int Not null,
    Rating int ,
    PrOduct_Status ENUM('AVAILABLE','OUT_OF_STOCK','DISCONTINUED') not null DEFAULT 'Available',
    FOREIGN key (Category_Id) REFERENCES Categories(Category_ID),
    FOREIGN KEY (Supplier_Id) REFERENCES Supplier(Supplier_ID) 
);

desc Inventory;

alter Table Inventory modify Product_Status ENUM('AVAILABLE','OUT_OF_STOCK','DISCONTINUED') not Null DEFAULT 'AVAILABLE';


CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    Order_Date DATE NOT NULL,
    Payment_Method ENUM('UPI','CARD','CASH','NET_BANKING') NOT NULL,
    Payment_Status ENUM('PAID','PENDING','FAILED')
        NOT NULL DEFAULT 'PENDING',

    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

SHOW TABLES;