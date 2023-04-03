###Review the tables in the database.
use sakila;

###Explore tables by selecting all columns from each table or using the in built review features for your client.
select * from sakila.actor;

##Select one column from a table. Get film titles.

select title from sakila.film;

#####Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, 
##but this is a good time to think about how you might get that information in the future.

select distinct(name) as language from sakila.language;

###5.1 Find out how many stores does the company have?

select * from store;
select count(store_id) from store;

###5.2 Find out how many employees staff does the company have?

select * from staff;
select count(staff_id) from staff;

##5.3 Return a list of employee first names only?

select first_name from staff;