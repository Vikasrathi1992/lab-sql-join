USE sakila;

## 1.List number of films per category.
select * from film_category;
select * from category;

Select fc.category_id , c.name , count(film_id) as Number_of_films 
from film_category fc 
join
category c on fc.category_id = c.category_id
group by 1,2;

## 2.Display the first and last names, as well as the address, of each staff member.
select * from staff;
select * from address;

select s.first_name , s.last_name , a.address
from staff s
left join
address a on s.address_id = a.address_id;

## 3.Display the total amount rung up by each staff member in August of 2005.
select * from payment;

select p.staff_id ,s.first_name , s.last_name , sum(p.amount) as total_amount 
from payment p
join
staff s ON p.staff_id = s.staff_id
where p.payment_date like '2005-08%'
group by 1,2,3;

## 4.List each film and the number of actors who are listed for that film.
select * from film;
select * from actor;
select * from film_actor;

select f.film_id , f.title , a.first_name , count(af.actor_id ) as Number_of_actors
from film f
join
film_actor af ON f.film_id = af.film_id
join 
actor a ON af.actor_id = a.actor_id
group by 1,2,3
order by 1;

## 5.Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select * from payment;
select * from customer;

select c.customer_id ,c.first_name, c.last_name , sum(p.amount) as total_money_paid
from payment p
join
customer c ON p.customer_id = c.customer_id
group by 1,2,3
order by 3 ;