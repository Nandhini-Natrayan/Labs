##### 1.Which actor has appeared in the most films?
use sakila;

select* from film_actor;
select * from actor;

select ac.first_name,ac.last_name,count(film_id) as count from actor as ac
inner join film_actor as film_ac
on ac.actor_id=film_ac.actor_id
group by film_ac.actor_id
order by count desc
limit 1;

#####2.Most active customer (the customer that has rented the most number of films)

select c.first_name,c.last_name,count(*) as Total from customer as c
inner join rental as r
on c.customer_id=r.customer_id
group by c.customer_id
order by total DESC
limit 1;

#####3.List number of films per category.

select count(film_id),c.name from film_category as film_ca
inner join category as c
on film_ca.category_id=c.category_id

group by c.category_id;

#####4.Display the first and last names, as well as the address, of each staff member.

select staff.first_name,staff.last_name,address.address from staff
inner join address
on staff.address_id=address.address_id;


#####5.get films titles where the film language is either English or italian, 
###and whose titles starts with letter "M" , sorted by title descending.

select film.title,language.name from film
inner join language
on film.language_id=language.language_id
WHERE title LIKE 'M%'
order by title DESC;

######6.Display the total amount rung up by each staff member in August of 2005.

select staff.first_name,staff.last_name,sum(amount) from staff
left join payment
on staff.staff_id=payment.staff_id
where payment.payment_date between '20050801' and '20050830'
group by payment.staff_id;

#####7.List each film and the number of actors who are listed for that film.

select film.title,count(actor_id) as total from film
inner join film_actor
on film.film_id=film_actor.film_id
group by film.film_id
order by total DESC
limit 10;

####8.Using the tables payment and customer and the JOIN command, 
###list the total paid by each customer. List the customers alphabetically by last name.

select c.first_name,c.last_name,sum(amount) from customer as c
inner join payment as p
on c.customer_id=p.customer_id
group by p.customer_id
order by last_name ASC
limit 10;

######9.Write sql statement to check if you can find any actor who never particiapted in any film.
select actor.first_name,actor.last_name from actor
left join film_actor
on actor.actor_id=film_actor.actor_id
where actor.actor_id is Null;

#####10.get the addresses that have NO customers, and ends with the letter "e"

select address.address from address
left join customer
on address.address_id=customer.address_id
where address2 is null and address like '%e';

##Optional: what is the most rented film?

select film.title from film
inner join inventory using (film_id)
inner join rental using (inventory_id)
group by film.title
order by count(rental_rate) DESC
limit 1;

