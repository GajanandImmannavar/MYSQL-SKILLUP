show databases;

use Joins;

show tables;

🏢 Business Scenario

The sales manager wants to review all customers and their purchasing activity.

Prepare a report showing:

Customer Name
Customer City
Order ID
Payment Method
Payment Status
Requirements
Show every customer, even customers who have never placed an order.
If a customer has orders, show only PAID orders.
Customers without any PAID order must still appear.
Sort by:
Customer City (A → Z)
Customer Name (A → Z)
Order ID (Ascending)
⚠️ Important

Think carefully about this requirement:

Every customer must remain in the result.

And:

Only PAID orders should be attached to them.

So decide whether the Payment_Status condition belongs in ON or WHERE.

select Customer.Customer_name, Customer.City,
       Orders.Order_Id, Orders.Payment_Method, 
       Orders.Payment_Status 
from Customer
LEFT JOIN Orders
on Customer.Customer_Id = Orders.Customer_ID
and Orders.Payment_Status = 'PAID'
order by Customer.City asc,Customer.Customer_Name asc,
         Orders.Order_ID asc;


🔄 Revision Problem — Don't solve yet

The purchasing manager wants to see all suppliers, including suppliers who currently have no available products.

Display:

Supplier Name
Supplier City
Product Name
Product Price

If a supplier has products, show only products that:

are AVAILABLE
cost more than ₹10,000

Sort by Supplier City, then Supplier Name.





select Inventory.Product_Name, Inventory.Price,
       Supplier.Supplier_Name, Supplier.Supplier_City
from Supplier
LEFT JOIN Inventory
on Inventory.Supplier_Id = Supplier.Supplier_Id
and Inventory.Product_Status='AVAILABLE' and Inventory.Price > 10000
order by Supplier.Supplier_City asc, Supplier.Supplier_Name asc; 


Display:

Category Name
Product Name
Brand
Rating

Only attach products that:

have Rating ≥ 4
are AVAILABLE
belong to Electronics, Furniture, or Sports

Sort by Category Name and Product Name.



select Categories.Category_Name, 
       Inventory.Product_Name,
       Inventory.Brand, 
       Inventory.Rating
from Categories
left JOIN Inventory
on Categories.Category_ID = Inventory.Category_ID
AND Inventory.Rating >=4 
and Inventory.Product_Status ="AVAILABLE"
and Category_Name in ('Electronics','Furniture', 'Sports')
order by Categories.Category_Name,
         Inventory.Product_Name;




