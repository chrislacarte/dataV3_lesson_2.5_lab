USE sakila;

-- 1 Select all the actors with the first name ‘Scarlett’
SELECT 
* 
FROM
sakila.actor 
WHERE 
first_name LIKE 'Scarlett%';

-- 2 How many films (movies) are available for rent  

-- lets see the data first 
-- SELECT * FROM inventory;

-- if there is a dictinct id in inventory, means there is a movie to rent:
SELECT 
COUNT(DISTINCT(film_id)) 
FROM 
sakila.inventory;
-- 2a how many films have been rented?
-- If there is an id created on rental_id, has been rented, so we count how many rental_ids:
SELECT 
COUNT(rental_id)
FROM 
sakila.rental;


-- 3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.
-- We select by title and length and we want only the first value
SELECT MIN(length)
AS min_duration
FROM sakila.film;

SELECT MAX(length)
AS max_duration
FROM sakila.film;



-- SELECT *
-- FROM 
--     (SELECT
--         'max_duration' AS '',
--         sakila.film.title,
--         sakila.film.length
--     FROM 
--         sakila.film
--     ORDER BY
--         sakila.film.length desc
--     LIMIT 1
--     ) AS T1
-- UNION 
-- SELECT * 
-- FROM
--     (SELECT
--         'min_duration' AS '',
--         sakila.film.title AS min_duration,
--         sakila.film.length
--     FROM 
--         sakila.film
--     ORDER BY
--         sakila.film.length asc
--         LIMIT 1
--     ) AS T2;
    
    
-- 4 What's the average movie duration expressed in format (hours, minutes)?

SELECT 
convert(avg(length),time) as "hours:minutes" 
FROM 
sakila.film;

-- 5 How many distinct (different) actors' last names are there?
SELECT 
COUNT(distinct(last_name))
FROM
actor;

-- 6 Since how many days has the company been operating (check DATEDIFF() function)? table rental , rent
SELECT 
datediff(max(rental_date),min(rental_date)) AS days 
FROM 
sakila.rental;

-- 7 rental info with additional columns month and weekday. Get 20 results.
SELECT 
*, 
date_format(CONVERT(left(rental_date,23),date), '%M') AS 'Month',
date_format(CONVERT(left(rental_date,23),date), '%W') AS 'Weekday'
FROM 
sakila.rental 
LIMIT 20;

-- 8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT
    *, 
    date_format(CONVERT(left(rental_date,23),date), '%M') AS 'Month',
    date_format(CONVERT(left(rental_date,23),date), '%W') AS 'Weekday',
CASE
WHEN date_format(CONVERT(left(rental_date,23),date), '%W') =  'Monday' then 'workday'
WHEN date_format(CONVERT(left(rental_date,23),date), '%W') =  'Tuesday' then 'workday'
WHEN date_format(CONVERT(left(rental_date,23),date), '%W') = 'Wednesday' then 'workday'
WHEN date_format(CONVERT(left(rental_date,23),date), '%W') =  'Thursday' then 'workday'
WHEN date_format(CONVERT(left(rental_date,23),date), '%W') =  'Friday' then 'workday'
ELSE 'weekend'
END AS 'day'
FROM sakila.rental LIMIT 20;


-- 9 Get release years.
SELECT
DISCTINCT(release_year)
FROM 
sakila.film;


-- 10 Get all films with ARMAGEDDON in the title.
SELECT 
* 
FROM 
sakila.film 
WHERE 
title 
LIKE '%ARMAGEDDON%';


-- 11 Get all films which title ends with APOLLO.
SELECT 
* 
FROM 
sakila.film 
WHERE 
title LIKE '%APOLLO';


-- 12 Get 10 the longest films.

SELECT 
film.title, film.length 
FROM 
sakila.film 
ORDER BY length DESC LIMIT 20;

-- 13 How many films include Behind the Scenes content?
SELECT 
COUNT(*) 
FROM 
sakila.film 
WHERE 
special_features LIKE '%Behind the Scenes%';


