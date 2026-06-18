-- Makes sure table exists 
Drop table if exists Customers;
Drop table if exists Products;
Drop table if exists Orders;

-- Customers Table
create table if not exists Customers(
  CustomerID integer primary key AUTOINCREMENT,
  name text not null,
  region integer not null
  );

-- Customers and Region 
insert into Customers(name, region) values ("Harry Potter",1);
insert into Customers(name, region) values ("Hermione Granger",2); 
insert into Customers(name, region) values ("Ronald Weasley",3); 
insert into Customers(name, region) values ("Hedwig",1); 
insert into Customers(name, region) values ("Albus Dumbeldoor",2);
insert into Customers(name, region) values ("Rubeus Hagrid",3);
insert into Customers(name, region) values ("Lord Voldemort",1);
insert into Customers(name, region) values ("Draco Malfoy",2);
insert into Customers(name, region) values ("Severus Snape",3);
insert into Customers(name, region) values ("Luna Lovegood",1);
insert into Customers(name, region) values ("Dobby",2);
insert into Customers(name, region) values ("Cedric Diggory",3);
insert into Customers(name, region) values ("Fleur Delacour",1);
insert into Customers(name, region) values ("Peeves",2);
insert into Customers(name, region) values ("Sirius Black",3);
insert into Customers(name, region) values ("Minerva McGonagall",1);
insert into Customers(name, region) values ("Remus Lupin",2);
insert into Customers(name, region) values ("Moaning Myrtle",3);

-- Products Table
create table if not exists Products(
  ProductID integer primary key AUTOINCREMENT,
  name text not null,
  description text not null,
  cost numeric 
  );

-- Products (Description and Cost)
insert into Products(name,description,cost) values ("Firebolt", "The fastest broom in the wizzarding world", 500.50);
insert into Products(name,description,cost) values ("Remembrall", "Turns red when you forgot something", 14.14);
insert into Products(name,description,cost) values ("Omnioculars", "A more powerful version of Muggle binoculars", 10.10);
insert into Products(name,description,cost) values ("Time Turner", "More than one innocent life can be saved", 49.95);

-- Orders Table
create table if not exists Orders (
  OrderID integer Primary key AUTOINCREMENT,
  CustomerID integer,
  ProductID integer,
  QTY numeric,
  Price numeric,
  foreign key (CustomerID) REFERENCES Customers(CustomerID),
  foreign key (ProductID) REFERENCES Products(ProductID)
  );

-- Orders (QTY & Price)
insert into orders(CustomerID, ProductID, QTY, Price) values (1, 1, 4, 700.95);
insert into orders(CustomerID, ProductID, QTY, Price) values (2, 2, 3, 16.95);
insert into orders(CustomerID, ProductID, QTY, Price) values (3, 3, 2, 20.20);
insert into orders(CustomerID, ProductID, QTY, Price) values (4, 4, 1, 59.23);
insert into orders(CustomerID, ProductID, QTY, Price) values (5, 1, 2, 700.95);
insert into orders(CustomerID, ProductID, QTY, Price) values (6, 2, 3, 16.95);
insert into orders(CustomerID, ProductID, QTY, Price) values (7, 3, 4, 20.20);
insert into orders(CustomerID, ProductID, QTY, Price) values (8, 4, 3, 59.23);
insert into orders(CustomerID, ProductID, QTY, Price) values (9, 1, 2, 700.95);
insert into orders(CustomerID, ProductID, QTY, Price) values (10, 2, 1, 16.95);
insert into orders(CustomerID, ProductID, QTY, Price) values (11, 3, 2, 20.20);
insert into orders(CustomerID, ProductID, QTY, Price) values (12, 4, 3, 59.23);
insert into orders(CustomerID, ProductID, QTY, Price) values (13, 1, 4, 700.95);
insert into orders(CustomerID, ProductID, QTY, Price) values (14, 2, 3, 16.95);
insert into orders(CustomerID, ProductID, QTY, Price) values (15, 3, 2, 20.20);
insert into orders(CustomerID, ProductID, QTY, Price) values (16, 4, 1, 59.23);
insert into orders(CustomerID, ProductID, QTY, Price) values (17, 1, 4, 700.95);
insert into orders(CustomerID, ProductID, QTY, Price) values (18, 2, 3, 16.95);

-- Prints 1st table
-- Prints all Customers from Region 2 and 3
select * from Customers
	where region = 2 or region = 3
    order by name 
    ;

-- Prints 2nd table
-- Prints everything from Products Table 
select * from Products;

-- Prints 3rd table
-- Prints the Customer and Product that is < 12 and in Region 1
select c.name as Customer, p.name as Product, qty as QTY, cost as Cost, price as Price, ROUND(price * QTY,2) as Total
 	from Orders as o
 	join Customers as c on o.customerID = c.customerID 
    join Products as p on o.productID = p.productID
    -- Where Region = 1
    -- Where Cost < 12
    where Cost < 12 and Region = 1 -- Prints only Omnioculars since their cost is 10.10 Galleons 
    Order by Total Desc
 ;

-- Prints 4th table
-- Prints all customers first order
select c.name as Customer, (p.name) as Product, qty as QTY, ROUND(cost,2) as Cost, ROUND(price,2) as Price, ROUND(price * QTY,2) as Total
 	from Orders as o
 	join Customers as c on o.customerID = c.customerID 
    join Products as p on o.productID = p.productID
    ;
-- Prints 5th table
-- 
select c.name as Customer, count(p.name) as Product, sum(qty) as QTY, round(avg(cost),2) as Cost, sum(price) as Price, sum(ROUND(price * QTY,2)) as Total
 	from Orders as o
 	join Customers as c on o.customerID = c.customerID 
    join Products as p on o.productID = p.productID
    group by c.name
    order by Total Desc
    ;

-- Prints 6th table
-- Prints the total QTY in desc order
select count(c.name) as Orders, p.name as Product, sum(qty) as QTY
 	from Orders as o
 	join Customers as c on o.customerID = c.customerID 
    join Products as p on o.productID = p.productID
    group by p.name
    order by QTY desc 
    ;

-- Prints 7th table
-- Makes the most profitable item
select count(c.name) as Orders, p.name as Product, ROUND(sum(ROUND((price-cost)*qty,2)),2) as Total
 	from Orders as o
 	join Customers as c on o.customerID = c.customerID 
    join Products as p on o.productID = p.productID
    group by p.name
    order by Total desc 
    ;    

-- Prints 8th table
-- Ranking of top customers by total sales in region 1
select c.name as Customers, ROUND(sum(price*qty),2) as TotalSales 
	from Orders as o
 	join Customers as c on o.customerID = c.customerID 
    join Products as p on o.productID = p.productID
    where Region = 1
    group by c.name
    order by TotalSales desc 
    ;

-- Prints 9th table
-- Ranking of regions by profitability 
Select region as Region, ROUND((price - cost) * sum(QTY) ,2) as Profit
	from Orders as o
 	join Customers as c on o.customerID = c.customerID 
    join Products as p on o.productID = p.productID
    group by Region
    order by Profit desc 
    ;

-- Prints 10th table
-- Top profit in regions 1 & 3
Select region as Region, ROUND((price - cost) * sum(QTY) ,2) as Profit, c.name as Customers
	from Orders as o
 	join Customers as c on o.customerID = c.customerID 
    join Products as p on o.productID = p.productID
    where Region = 1 or Region = 3
    group by c.name
    order by Profit desc
    ; 

-- Prints 11th table
-- Raw difference between the price and cost and give the poduct that makes the least amount of profit in a sell
Select region as Region, ROUND((price - cost) * sum(QTY),2) as Profit, p.name as Product
	from Orders as o
 	join Customers as c on o.customerID = c.customerID 
    join Products as p on o.productID = p.productID
    group by Product
    order by Profit 
