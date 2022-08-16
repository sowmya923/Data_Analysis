DVD RENTAL

--2.Display the max amount paid by each customer
select  concat (first_name ||' '|| last_name) as name,  max(Amount)
from customer c inner join payment p on c.customer_id = p.customer_id
group by (concat (first_name ||' '|| last_name))
order by (concat (first_name ||' '|| last_name))

-----3.Display customers full name whose rental duration is more than 5 days

select  concat (first_name ||' '|| last_name) as full_name, 
extract (day  from (return_date - rental_date)) as rental_duration from customer c inner join rental r 
on c.customer_id = r.customer_id
where extract (day  from (return_date - rental_date)) > 5

--4.Rank the films based on their rental duration
select title, rental_duration, rank()
over ( order by rental_duration)
from film

----5.Display the customer firstname who live in Afghanistan and India
select first_name, country from customer , country
where country like  'Afghanistan' or country like 'India'

----Display the max payment amount of each customer,
----customerid and paymentid details
select concat (last_name ||' '|| first_name), c.customer_id, p.payment_id, max(amount) as max_amount
from customer c inner join payment p on c.customer_id = p.customer_id
group by 
(concat (last_name ||' '|| first_name), c.customer_id, p.payment_id)

------- Display the min payment amount of each customer and firstname
select first_name , min(amount) as min_amount FROM
customer c inner join payment p on c.customer_id = p.customer_id
group by first_name

-----Display the inventory count based on storied and 
---filmid in all possible combinations





----Display the payment ids of the cities starts with B and ends with n
select payment_id, city from address s inner join city c ON
s.city_id=c.city_id inner join customer c1 on c1.address_id = s.address_id
inner join payment p on p.customer_id = c1.customer_id
where city like 'B%n'
[10:41 am, 14/08/2022] Srinath Reddy: ----display the customerid’s count for each region
select region, count(customerid) as total_count
from customers
group by region
order by region

------display the orderid's of the customers in the region 'BC'

select orderid from orders
where shipregion = 'BC'

----display the Employeeid,address, 
----details whose customer's address starts with B
select a.address, e.employeeid 
from customers a inner join employees e on a.city = e.city
where a.address like 'B%'

----display the categorynames 
----4.whose product's total unitsinstock is greater than 500

select c.categoryname , sum(unitsinstock) as total_unitsinstock
from categories c inner join products p on c.categoryid = p.categoryid
group by c.categoryname
having sum(unitsinstock)>500
---- 5.display Employee Complete name and their regionIds
select regionid, concat(firstname||''||lastname) as completename 
from employees,region

----6.display CompanyName of supplier whose country contains 'an'
select companyname, country
from suppliers
where country like '%an%'

------7. display the number of orderids for each productid
select productid, count(orderid) as number_orderids from order_details 
group by productid
order by productid

----8.display the number of orderids for each productid whose orders 
----count is between 20 and 40

select productid, count(orderid) as number_orderids from order_details
group by productid
having count(orderid) BETWEEN 20 and 40;

---9.display employee full name whose customer name ends with a 
---using string function
select b.contactname,
concat(a.firstname||' '|| a.lastname)
from employees a , customers b 
where right(b.contactname, 1) = 'a'

----10.display the customerids who is not living in Germany

select customerid
from customers
where country <> 'Germany'

----11.display PRODUCTID, CATEGORYID, MIN UNITPRICE by Categoryid of the Products

select productid, categoryid, min(unitprice) 
over (partition by categoryid) as min_unitprice
from products

---display the lastname of the employees who is having 
---same hiredate but different hireyear


----display the lastname of the employees 
----who is having same hiredate but different hireyear


----13.Display the Customer’s contact name whose orders are shipped within 15 days

select c.contactname, (extract(day from o.shippeddate - o.orderdate)) 
as shipped
from customers c inner join orders o 
on c.customerid = o.customerid
where extract (day from o.shippeddate - o.orderdate) < 15


select 
extract(day from shippeddate - orderdate) from orders

----15.Display the max unitsinstock by supplierid,categoryid with all combinations
			
SELECT
    supplierid, categoryid,
    max(unitsinstock)
FROM
    products
GROUP BY
    GROUPING SETS (
        (supplierid,categoryid),
        (supplierid),
        (categoryid),
        ()
 );
 
 

 