-- =========================================================
-- Rockbuster SQL Project
-- File: 02_film_inventory.sql
-- Purpose: Explore Rockbuster film inventory and availability
-- =========================================================

-- 1) Total number of films in inventory
SELECT COUNT(*) AS total_films
FROM inventory;

-- 2) Number of copies available per film
SELECT f.title,
       COUNT(i.inventory_id) AS copies_available
FROM film f
JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.title
ORDER BY copies_available DESC
LIMIT 20;

-- 3) Count films by rating
SELECT f.rating,
       COUNT(f.film_id) AS film_count
FROM film f
GROUP BY f.rating
ORDER BY film_count DESC;

-- 4) Count films by language
SELECT l.name AS language,
       COUNT(f.film_id) AS film_count
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name
ORDER BY film_count DESC;

-- 5) Number of films per rental duration
SELECT f.rental_duration,
       COUNT(f.film_id) AS film_count
FROM film f
GROUP BY f.rental_duration
ORDER BY rental_duration;

-- 6) Average replacement cost by rating
SELECT f.rating,
       ROUND(AVG(f.replacement_cost), 2) AS avg_replacement_cost
FROM film f
GROUP BY f.rating
ORDER BY avg_replacement_cost DESC;
