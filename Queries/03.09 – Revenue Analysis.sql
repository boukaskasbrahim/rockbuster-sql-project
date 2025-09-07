-- =========================================================
-- Rockbuster SQL Project
-- Exercise: 03.09 – Revenue Analysis
-- Purpose: Calculate revenue by country, city, and month
-- =========================================================

-- 1. Total revenue by country
SELECT co.country, SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer cu ON p.customer_id = cu.customer_id
JOIN address a  ON cu.address_id  = a.address_id
JOIN city ci    ON a.city_id      = ci.city_id
JOIN country co ON ci.country_id  = co.country_id
GROUP BY co.country
ORDER BY total_revenue DESC;

-- 2. Top 10 cities by revenue
SELECT ci.city, SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer cu ON p.customer_id = cu.customer_id
JOIN address a  ON cu.address_id  = a.address_id
JOIN city ci    ON a.city_id      = ci.city_id
GROUP BY ci.city
ORDER BY total_revenue DESC
LIMIT 10;

-- 3. Revenue by month
SELECT DATE_TRUNC('month', p.payment_date) AS month, 
       SUM(p.amount) AS total_revenue
FROM payment p
GROUP BY month
ORDER BY month;
