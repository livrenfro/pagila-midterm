/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query SELECT query that:
 * Lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 * (You may choose to either include or exclude the movie 'AMERICAN CIRCUS' in the results.)
 */

WITH amer_circus AS(
    SELECT first_name, last_name, actor_id FROM actor
    JOIN film_actor USING(actor_id)
    JOIN film USING(film_id)
    WHERE film.title LIKE 'AMERICAN CIRCUS'),

joined AS(
    SELECT film_actor.film_id FROM amer_circus
    JOIN film_actor USING(actor_id)
    GROUP BY film_actor.film_id
    HAVING COUNT(amer_circus.last_name) >= 2)

SELECT title from film
JOIN joined USING(film_id)
ORDER BY title;

