-- In the table actor, which are the actors whose last names are not repeated? 
	-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
	-- These three actors have the same last name. So we do not want to include this last name in our output. 
	-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

select last_name, count(last_name)
from sakila.actor
group by last_name
having count(last_name) = 1
order by last_name;

-- Which last names appear more than once? 
	-- We would use the same logic as in the previous question but this time we want to include the last names of the actors 
	-- where the last name was present more than once

select last_name, count(last_name)
from sakila.actor
group by last_name
having count(last_name) > 1
order by last_name;   
    
-- Using the rental table, find out how many rentals were processed by each employee.

select staff_id, count(rental_id)
from sakila.rental
group by staff_id
order by count(rental_id);

-- Using the film table, find out how many films were released each year.
select release_year, count(title)
from sakila.film
group by release_year
order by count(title);

-- Using the film table, find out for each rating how many films were there.
select rating, count(title)
from sakila.film
group by rating
order by count(title);

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating, round(avg(length), 2) as avg_length
from sakila.film
group by rating
order by avg_length;

-- Which kind of movies (rating) have a mean duration of more than two hours?
select rating, round(avg(length), 2) as avg_length
from sakila.film
group by rating
having round(avg(length), 2)/60 > 2;




