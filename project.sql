project 1
-- find the employees details whose postalcode is 98401
##where
select * from employees
where postalcode='98401'

--list down the employee name in acending order--
##order by
SELECT firstname||''||lastname
from  employees
ORDER BY firstname,lastname;



-- find the employees whose city starts with 'UK'--
##like
select firstname,lastname,country
from employees 
where country like 'UK%'

##delete
---- The DELETE command is used to delete existing records in a table.
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';

##distinct
The SELECT DISTINCT statement is used to return only distinct (different) values.
SELECT DISTINCT Country FROM Customers;

## NULL function

---NULL is used in SQL to indicate that a value doesn't exist in the database.

SELECT ProductName, UnitPrice * (UnitsInStock + UnitsOnOrder)
FROM Products;

PROJECT-2
##INNER JOIN
--1.Display the total amount paid by each customer in the payment table
select first_name,customer.customer_id, sum (payment.amount) as total_amount
from customer
inner join payment on 
customer.customer_id=payment.customer_id
group by customer.customer_id
order by total_amount;
##left outer join 
left outer join is a method of combining tables. The result includes unmatched rows from only the table that is specified before the LEFT OUTER JOIN clause. 
-- Get all customers and their orders.
SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate
FROM Customers
    LEFT OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CompanyName;

##
right JOIN
Returns ALL rows from right table with MATCHING rows in left table.
Returns NULL for the left side when there is no match.
-- Get all orders and the relevant customers.
SELECT Orders.OrderID, Customers.CompanyName, Orders.OrderDate
FROM Orders
    RIGHT OUTER JOIN Customers ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CompanyName;
##full JOIN
Returns ALL rows from left side and ALL from right side.
--Combines the results of both LEFT and RIGHT joins.
-- Get all orders and all customers, combined.

##self JOIN
SELECT
    






