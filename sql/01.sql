/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 *
 * Write a SQL query that lists the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 * 4) have never been rented by anyone with an 'F' in their address (at the street, city, or country level).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */


-- title from film
-- actor names from actor 
-- customer name from customer
-- address, city, country names from address, city, country

-- part 1
SELECT title FROM film
WHERE title NOT LIKE '%F%'

EXCEPT
-- part 2
SELECT title FROM film 
JOIN film_actor USING(film_id)
JOIN actor USING(actor_id)
WHERE actor.first_name LIKE '%F%' 
OR actor.last_name LIKE '%F%'

EXCEPT
-- part 3, 4
SELECT title FROM film 
JOIN inventory USING(film_id)
JOIN rental USING(inventory_id)
JOIN customer USING(customer_id)
JOIN address USING(address_id)
JOIN city USING(city_id)
JOIN country USING(country_id) 
WHERE customer.first_name LIKE '%F%' 
OR customer.last_name LIKE '%F%'
OR address.address LIKE '%F%'
OR address.address2 LIKE '%F%'
OR city.city LIKE '%F%'
OR country.country LIKE '%F%';


