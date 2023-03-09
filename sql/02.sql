/*
 * Write a SQL query SELECT query that:
 * computes the country with the most customers in it. 
 */

WITH cust_count AS(
    SELECT country.country, count(distinct(customer.customer_id)) FROM country
    JOIN city USING(country_id)
    JOIN address USING(city_id)
    JOIN customer USING(address_id)
    GROUP BY country 
    ORDER BY count DESC)

SELECT country FROM cust_count
LIMIT 1;
