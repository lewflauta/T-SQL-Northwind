--some helpful utilities

-- create a stored procedure to see all the tables and their values
create proc tabledump
as
SELECT
    t.name AS table_name,
    c.name AS column_name,
	tp.name as data_type
FROM sys.tables t
INNER JOIN sys.columns c ON t.object_id = c.object_id
INNER JOIN sys.types tp ON c.user_type_id = tp.user_type_id
ORDER BY t.name, c.column_id;

--to run
--exec tabledump


--a query like this can help you get a more visual handle of databases and tables involved to create joins
select top 1 'categories c',*  from categories; select top 1 'products p',* from products; select top 1 'suppliers s', * from suppliers

--quick overview of a specific table
select top 1 * from products
