###1.Write a query to display for each store its store ID, city, and country.

use sakila;

select store.store_id,city.city,country.country from store
inner join address using (address_id)
inner join city using (city_id)
inner join country using (country_id)
group by store.store_id
limit 2;

####2.Write a query to display how much business, in dollars, each store brought in.

select store.store_id, SUM(amount)
from store
inner join staff
on store.store_id = staff.store_id
inner join payment p 
on p.staff_id = staff.staff_id
group by store.store_id
order by SUM(amount);

##3.What is the average running time(length) of films by category?

select category.name,AVG(film.length) from film
inner join film_category using (film_id)
inner join category using (category_id)
group by category.name;

###4.Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)

select category.name,AVG(film.length) as avg from film
inner join film_category using (film_id)
inner join category using (category_id)
group by category.name
order by avg desc
limit 5;

####5.Display the top 5 most frequently(number of times) rented movies in descending order.

select film.title from film
inner join inventory using (film_id)
inner join rental using (inventory_id)
group by film.title
order by count(rental_rate) DESC
limit 5;

###6.List the top five genres in gross revenue in descending order.
select category.name,sum(payment.amount) as amount from category
join film_category using (category_id)
join inventory using (film_id)
join rental using (inventory_id)
join payment using (rental_id)
group by category.name
order by amount desc
limit 5;

####7.Is "Academy Dinosaur" available for rent from Store 1?

select store.store_id,film.title from film
join inventory using (film_id)
join store using (store_id)
order by film.title ASC
limit 1;