
--1 1. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
select categoryname,description
from categories 
order by Categoryname


--2 Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
select contactname, companyname, contacttitle,phone
from customers
order by phone
  

--3 select * from employees
--Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastnamerespectively and HireDate from the employees table sorted from the newest to the oldest employee.
select upper(firstname) as FirstName, upper(lastname) from employees

select concat(upper(left(firstname,1)) , upper(lastname) as LastName, hiredate
from employees
order by hiredate desc

select concat(upper(firstname,1)),
lower(right(firstname,length(firstname)-1)))
from employees
  

--4 exec sp_help orders
--Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sortedby Freight in descending order.
  
select top 10 orderid, orderdate, shippeddate, customerid, freight
from orders order by freight desc
  

--5 select top 1 * from customers
--5. Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.

select lower(customerid) as ID
from customers

  
--6 select * from suppliers
-- Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the Country in descending order then by CompanyName in ascending order.

select companyname, fax, phone, country, homepage
from suppliers
order by country desc,companyname
  

--7. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.
--7 select top 1 * from customers
  
select companyname, contactname
from customers
where city = 'Buenos Aires'

  
--8. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
--8 select * from products
  
select productname, unitprice, quantityperunit, unitsinstock
from products
where unitsinstock = 0

--9. Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
--9 select top 1 * from customers

select contactname, address, city
from customers
where country not in ('Germany','Mexico','Spain')
order by city


--10. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
--10 select top 1 * from orders

select orderdate, shippeddate, customerid, freight
from orders 
where orderdate > 1996-05-21 
order by orderdate desc


--11. Create a report showing FirstName, LastName, Country from the employees not from United States.

select firstname, lastname, country
from employees
where country <> 'USA'
  

--12. Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later,than the required date.
--12 select top 1 * from orders
  
select employeeid, orderid, customerid, requireddate
from orders
where shippeddate > requireddate

--13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
--13 select top 1 * from customers

select city, companyname, contactname
from customers
where city like 'a%' or city like 'b%'

  
--14 select top 1 * from orders
--14. Create a report showing all the even numbers of OrderID from the orders table.
  
select orderid
from orders
where orderid % 2 = 0
  

--15. Create a report that shows all the orders where the freight cost more than $500.
select freight
from orders
where freight > 500

--16. Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder.
--16 select top 1 * from products
select productname, unitsinstock, unitsonorder, reorderlevel
from products
where unitsinstock < reorderlevel


--17. Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.
--17 select top 1 * from customers
select companyname, contactname, phone, fax
from customers
where fax is null

--18. Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
--18 select  * from employees
select firstname, lastname
from employees
where reportsto is null

--19. Create a report showing all the odd numbers of OrderID from the orders table.
select orderid
from orders
where orderid % 2 <> 0

--20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
select city, companyname, contactname, fax
from customers
where fax is null
order by contactname

--21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName.
select city, companyname, contactname
from customers
where city like '%l%'
order by contactname

--22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
select firstname,lastname, birthdate
from employees
where birthdate >= '1950-01-01' and birthdate <= '1960-01-01'

--23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
select firstname, lastname, year(birthdate) as year
from employees

  
--24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order. HINT: you will need to use a Groupby statement.
--24 select * from orders order by customerid
--groupby statement
select orderid, count(orderid) as 'numberOfOrders'
from [dbo].[Order Details Extended]
group by orderid
order by numberoforders desc

--25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
--25 select * from suppliers    select * from products
SELECT s.SupplierID, p.ProductName, S.CompanyName
FROM suppliers s
JOIN products p
ON s.SupplierID = p.SupplierID
WHERE s.CompanyName IN ('Exotic Liquids','Specialty Biscuits, Ltd.','Escargots Nouveaux')
ORDER BY s.SupplierID;


--26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124".
select shippostalcode, orderid, orderdate, requireddate, shippeddate, shipaddress
from orders
where shippostalcode like '98124%'

--27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.
select contactname, contacttitle, companyname
from customers
where contacttitle not like '%Sales%'

--28. Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle";
select lastname, firstname, city
from employees
where city not like '%seattle%'


--29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.
--29 select * from customers
select companyname, contacttitle, city, country
from customers
where City like 'Mexico' or (country like 'spain') and city not like 'madrid'


--30. Create a select statement that outputs the following:
  --Nancy Dabolio can be reached at x5467
select concat(firstname, lastname,' can be reached at x',extension) as 'contactinfo'
from employees

--31. Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
select contactname
from customers
where contactname not like '_B%'
--32. Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.
--32 select top 1 * from products
select ceiling(unitprice) as average, unitsinstock as totalstock, unitsinstock * ceiling(unitprice) as 'maxorder'
from products

--33. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table.
--33 select top 1 * from products; select top 1 * from suppliers; select top 1 * from categories;
select p.supplierid, s.companyname, c.categoryname, p.productname, p.unitprice
from products p
join suppliers s
on s.supplierid = p.supplierid
join categories c
on p.categoryid = c.categoryid


--34. Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped by CustomerID. HINT: you will need to use a Groupby and a Having statement.
--34 select top 1 * from orders
-- GROUPBY AND HAVING
select customerid, sum(freight) as sumOfFreight
from orders
group by customerid
having sum(freight) > 200


--35. Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and
-- customers table with discount given on every purchase.
--35 select top 1 * from [dbo].[Order Details Extended]; select top 1 * from orders; select top 1 * from customers;
select o.orderid, contactname, unitprice, quantity, discount
from [dbo].[Order Details Extended] O
join orders i
on O.orderid = i.orderid
join customers c
on i.customerid = c.customerid
where discount != '0'


select *
from [dbo].[Order Details Extended] O
join orders i
on O.orderid = i.orderid
join customers c
on i.customerid = c.customerid
where discount != '0'
--36. Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of
--who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin.
--36 --selfjoin select * from employees
select e.employeeid, e.lastname, e.firstname as employee, m.lastname as managerLastname, m.firstname as managerfirstname
from employees e
join employees m
on e.reportsto = m.employeeid


--37. Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice
--and MaximumPrice respectively.
--37 select top 1 * from products
select avg(unitprice) as averageprice, min(unitprice) as minimumprice, max(unitprice) as maximumprice
from products


--38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City,
--Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View.
--38 select top 1 * from customers; select top 1 * from orders
create view customerinfo
as
select c.customerid, c.companyname, c.contactname, c.contacttitle, c.address, c.city, c.country, c.phone, o.orderdate, o.requireddate, o.shippeddate
from customers c
join orders o
on c.customerid = o.customerid

select *
from customerinfo


--39. Change the name of the view you created from customerinfo to customer details.
exec sp_rename 'customerinfo', 'customer details'

select * from [customer details]


--40. Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description,
--QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and
--categories tables. HINT: Create a View
--40 select top 1 * from suppliers; select top 1 * from products; select top 1 * from categories 
create view productdetails
as
select p.productid, s.companyname, p.productname, c.categoryname, c.description, p.quantityperunit, p.unitprice, p.unitsinstock, p.unitsonorder, p.reorderlevel, p.discontinued
from suppliers s
join products p
on s.supplierid = p.supplierid
join categories c
on p.categoryid = c.categoryid

select * from productdetails


--41. Drop the customer details view.
--42. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
--43. Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create
--a Table, use the LIKE Statement and INSERT INTO statement.
--44. Create a select statement that outputs the following from the shippers_duplicate Table:
--45. Create a report that shows the CompanyName and ProductName from all product in the Seafood category.
--46. Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
--47. Delete the shippers_duplicate table.
--48. Create a select statement that ouputs the following from the employees table.
--NB: The age might differ depending on the year you are attempting this query.
 
--49. Create a report that the CompanyName and total number of orders by customer renamed as number of orders since Decemeber 31, 1994. Show number of Orders greater than 10.
--50. Create a select statement that ouputs the following from the product table


