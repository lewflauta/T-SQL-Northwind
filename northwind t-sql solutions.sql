
--1
select categoryname,description
from categories 
order by Categoryname


--2
select contactname, companyname, contacttitle,phone
from customers
order by phone

--3 select * from employees
select upper(firstname) as FirstName, upper(lastname) from employees

select concat(upper(left(firstname,1)) , upper(lastname) as LastName, hiredate
from employees
order by hiredate desc

select concat(upper(firstname,1)),
lower(right(firstname,length(firstname)-1)))
from employees

--4 exec sp_help orders
select top 10 orderid, orderdate, shippeddate, customerid, freight
from orders order by freight desc

--5 select top 1 * from customers
select lower(customerid) as ID
from customers

--6 select * from suppliers
select companyname, fax, phone, country, homepage
from suppliers
order by country desc,companyname

--7 select top 1 * from customers
select companyname, contactname
from customers
where city = 'Buenos Aires'

--8 select * from products
select productname, unitprice, quantityperunit, unitsinstock
from products
where unitsinstock = 0

--9 select top 1 * from customers
select contactname, address, city
from customers
where country not in ('Germany','Mexico','Spain')
order by city

--10 select top 1 * from orders
select orderdate, shippeddate, customerid, freight
from orders 
where orderdate > 1996-05-21 
order by orderdate desc

--11 
select firstname, lastname, country
from employees
where country <> 'USA'

--12 select top 1 * from orders
select employeeid, orderid, customerid, requireddate
from orders
where shippeddate > requireddate

--13 select top 1 * from customers
select city, companyname, contactname
from customers
where city like 'a%' or city like 'b%'

--14 select top 1 * from orders
select orderid
from orders
where orderid % 2 = 0

--15 
select freight
from orders
where freight > 500

--16 select top 1 * from products
select productname, unitsinstock, unitsonorder, reorderlevel
from products
where unitsinstock < reorderlevel

--17 select top 1 * from customers
select companyname, contactname, phone, fax
from customers
where fax is null

--18 select  * from employees
select firstname, lastname
from employees
where reportsto is null

--19
select orderid
from orders
where orderid % 2 <> 0

--20
select city, companyname, contactname, fax
from customers
where fax is null
order by contactname

--21
select city, companyname, contactname
from customers
where city like '%l%'
order by contactname

--22
select firstname,lastname, birthdate
from employees
where birthdate >= '1950-01-01' and birthdate <= '1960-01-01'

--23
select firstname, lastname, year(birthdate) as year
from employees

--24 select * from orders order by customerid
--groupby statement
select orderid, count(orderid) as 'numberOfOrders'
from [dbo].[Order Details Extended]
group by orderid
order by numberoforders desc

--25 select * from suppliers    select * from products
SELECT s.SupplierID, p.ProductName, S.CompanyName
FROM suppliers s
JOIN products p
ON s.SupplierID = p.SupplierID
WHERE s.CompanyName IN ('Exotic Liquids','Specialty Biscuits, Ltd.','Escargots Nouveaux')
ORDER BY s.SupplierID;

--26
select shippostalcode, orderid, orderdate, requireddate, shippeddate, shipaddress
from orders
where shippostalcode like '98124%'

--27 
select contactname, contacttitle, companyname
from customers
where contacttitle not like '%Sales%'

--28
select lastname, firstname, city
from employees
where city not like '%seattle%'


--29 select * from customers
select companyname, contacttitle, city, country
from customers
where City like 'Mexico' or (country like 'spain') and city not like 'madrid'


--30
select concat(firstname, lastname,' can be reached at x',extension) as 'contactinfo'
from employees

--31
select contactname
from customers
where contactname not like '_B%'

--32 select top 1 * from products
select ceiling(unitprice) as average, unitsinstock as totalstock, unitsinstock * ceiling(unitprice) as 'maxorder'
from products

--33 select top 1 * from products; select top 1 * from suppliers; select top 1 * from categories;
select p.supplierid, s.companyname, c.categoryname, p.productname, p.unitprice
from products p
join suppliers s
on s.supplierid = p.supplierid
join categories c
on p.categoryid = c.categoryid


--34 select top 1 * from orders
-- GROUPBY AND HAVING
select customerid, sum(freight) as sumOfFreight
from orders
group by customerid
having sum(freight) > 200

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

--36 --selfjoin select * from employees
select e.employeeid, e.lastname, e.firstname as employee, m.lastname as managerLastname, m.firstname as managerfirstname
from employees e
join employees m
on e.reportsto = m.employeeid

--37 select top 1 * from products
select avg(unitprice) as averageprice, min(unitprice) as minimumprice, max(unitprice) as maximumprice
from products

--38 select top 1 * from customers; select top 1 * from orders
create view customerinfo
as
select c.customerid, c.companyname, c.contactname, c.contacttitle, c.address, c.city, c.country, c.phone, o.orderdate, o.requireddate, o.shippeddate
from customers c
join orders o
on c.customerid = o.customerid

select *
from customerinfo


--39 
exec sp_rename 'customerinfo', 'customer details'

select * from [customer details]

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
