-- =========================================================
-- Rockbuster SQL Project
-- Exercise: 03.07 – Film Analysis
-- Purpose: Analyze film rentals and inventory
-- =========================================================

-- 1. Most rented films
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r    ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 10;

-- 2. Average rental duration by film
SELECT f.title, AVG(f.rental_duration) AS avg_rental_duration
FROM film f
GROUP BY f.title
ORDER BY avg_rental_duration DESC
LIMIT 10;

-- 3. Number of films by rating
SELECT f.rating, COUNT(*) AS film_count
FROM film f
GROUP BY f.rating
ORDER BY film_count DESC;
