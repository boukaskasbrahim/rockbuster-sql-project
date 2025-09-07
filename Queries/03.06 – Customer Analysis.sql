-- =========================================================
-- Rockbuster SQL Project
-- Exercise: 03.06 – Customer Analysis
-- Purpose: Analyze customer distribution by country and city
-- =========================================================

-- 1. Total number of customers
SELECT COUNT(*) AS total_customers
FROM customer;

-- 2. Top 10 countries by number of customers
SELECT co.country, COUNT(cu.customer_id) AS total_customers
FROM customer cu
JOIN address a  ON cu.address_id = a.address_id
JOIN city ci    ON a.city_id     = ci.city_id
JOIN country co ON ci.country_id = co.country_id
GROUP BY co.country
ORDER BY total_customers DESC
LIMIT 10;

-- 3. Top 10 cities by number of customers
SELECT ci.city, COUNT(cu.customer_id) AS total_customers
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ci   ON a.city_id     = ci.city_id
GROUP BY ci.city
ORDER BY total_customers DESC
LIMIT 10;
