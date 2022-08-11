--2. Display orderid,min quantity by orderid whose min quantity is greater than 30
select orderid,min(quantity)
from order_details Group By orderid
Having min(quantity)

--1. Display PRODUCTID, CATEGORYID, SUM UNITPRICE by Categoryid of the Product--
select productid, categoryid, sum(unitprice)
from products 
group by (categoryid,productid);

--3. Display productid,orderid,max of quantity by orderid of the orderdetails--
select productid,orderid,MAX(quantity)
over (partition by orderid)as sowmya
from order_details

--4. Create a view as served_regions to display employeeid,orderid and region--
create view served_regions as
SELECT employeeid,orderid,shipcity
from orders

--1.Display the common first_name of Staff and customers--
select first_name from staff
union
select first_name from customer
--2.Display customerID’s having same first_name--
select customer_id,first_name
from customer 
where

--3. Display the actors firstname,lastname of their film title ends with e.--
select first_name, last_name,title
from actor a inner join film_actor f1 
on a.actor_id = f1.actor_id inner join film f2
on f1.film_id = f2.film_id 
where title like 'E%'


--4.create view for the question 3 and get the count of actors acted in each film--
create view sowmya AS
select first_name, last_name,title
from actor a inner join film_actor f1 
on a.actor_id = f1.actor_id inner join film f2
on f1.film_id = f2.film_id

select title, count(*) from sowmya group by title











