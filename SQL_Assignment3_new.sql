--1. List all customers who live in Texas (use JOINs)

--2. Get all payments above $6.99 with the Customer's FullName

--3. Show all customers names who have made payments over $175(usesubqueries)

--4. List all customers that live in Nepal (use the citytable)

--5. Which staff member had the most transactions?

--6. How many movies of each rating arethere?

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)8. H


--1. List all customers who live in Texas (use JOINs)


select first_name , last_name 
from customer 
inner join address 
on customer.address_id =address.address_id 
where district ='Texas';


--2Get all payments above $6.99 with the Customer's FullName
SELECT customer.first_name, customer.last_name,payment.amount
FROM customer
INNER join payment
ON customer.customer_id = payment.customer_id
where amount > 6.99;


--3Show all customers names who have made payments over $175(usesubqueries)

SELECT customer.customer_id ,customer.first_name, customer.last_name, payment.amount
FROM customer
INNER JOIN payment
ON customer.customer_id =payment.customer_id
group by customer.customer_id, payment.amount 
having SUM(amount) >175.00
order by SUM(amount) desc;



--4 List all customers that live in Nepal (use the citytable)
select  * from customer 

select * from address 

select  * from city

select  * from country 
select * from payment 
where customer_id=341

select first_name, last_name , customer_id 
from customer 
full join address 
on customer.address_id= address.address_id
full join city 
on address.city_id= city.city_id
full join country 
on city.country_id =country.country_id
where country= 'Nepal'
group by customer_id ;



select * from payment
select * from amount

select * from store
select * from staff



--5. Which staff member had the most transactions?

Select staff_id, Count(*) as transaction_count
from payment
group by staff_id
order by transaction_count Desc
Limit 1;

--6. How many movies of each rating arethere?
--Note that , the moive table does not exist, I use film table instead
select * from film

Select rating, COUNT(*) 
from film 
group by rating;


--Show all customers who have made a single payment above $6.99


select customer.customer_id, customer.first_name ,customer.last_name, payment.amount 
from customer
inner join payment
on customer.customer_id=payment.customer_id
where payment.amount > 6.99;

--How many free rentals did our store give away
select count(*) as free_rentals
from payment
where amount=0



