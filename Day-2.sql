--1.Display the total amount paid by each customer in the payment table
select first_name,customer.customer_id, sum (payment.amount) as total_amount
from customer
inner join payment on 
customer.customer_id=payment.customer_id
group by customer.customer_id
order by total_amount;


--2. display customer lastname, firstname whose customerid is 400 to 500

select customer_id,first_name, last_name
from customer 
where customer_id between 400 and 500;

--3. Display the film details of the language – English
select * from language;

select title,description, length, rating,  name 
from film
inner join language
on film.language_id = language.language_id
where name = 'English';


--4. Display address details of the country Australia

select address, address2, district, postal_code, country,city
from country
inner join city on country.country_id=city.country_id
inner join address on 
city.city_id= address.city_id
where country = 'Australia';

select employees.firstname, 
--Display Employee firstname,Customerid whose customer postalcode 
starts with 5 or 8--



select employees.firstname, 
customers.customerid from 
employees inner join orders 
on orders.employeeid = 
employees.employeeid
inner join customers ON 
customers.customerid = 
orders.customerid
where customers.postalcode 
like '5%' or
customers.postalcode like '8%'
customers.postalcode like '8%'


Display maxof unitprices for all the categories of the products


select categoryname, max(unitprice) as max_unitprice
from categories
inner join products on products.categoryid=categories.categoryid
group by categories.categoryid
order by max_unitprice;



--Display all productnames whose categoryname is Seafood or 
Beverages--


select categoryname, productname
from categories
left join products on
categories.categoryid=products.categoryid
where categoryname like '%Seafood%' or categoryname like '%Beverages%'



--4. Display ordereid,quantity of orderdetails for the category - cheeses--


select orderid, quantity,categoryname
from order_details
join products on order_details.productid=products.productid
join categories on products.categoryid=categories.categoryid
where description like '%Cheeses';
