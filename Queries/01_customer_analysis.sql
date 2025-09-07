-- =========================================================
-- Rockbuster SQL Project
-- File: 01_customer_analysis.sql
-- Purpose: Basic customer profiling (counts, by country/city,
--          by store, and simple active flag)
-- Schema: DVD Rental / Rockbuster
-- =========================================================

-- 1) Total number of customers
SELECT COUNT(*) AS total_customers
FROM customer;

-- 2) Customers by country (descending)
SELECT co.country,
       COUNT(cu.customer_id) AS customers
FROM customer cu
JOIN address a  ON cu.address_id = a.address_id
JOIN city ci    ON a.city_id     = ci.city_id
JOIN country co ON ci.country_id = co.country_id
GROUP BY co.country
ORDER BY customers DESC, co.country ASC;

-- 3) Top 20 cities by number of customers
SELECT ci.city,
       co.country,
       COUNT(cu.customer_id) AS customers
FROM customer cu
JOIN address a  ON cu.address_id = a.address_id
JOIN city ci    ON a.city_id     = ci.city_id
JOIN country co ON ci.country_id = co.country_id
GROUP BY ci.city, co.country
ORDER BY customers DESC, ci.city ASC
LIMIT 20;

-- 4) Customers per store
SELECT s.store_id,
       COUNT(c.customer_id) AS customers
FROM customer c
JOIN store s ON c.store_id = s.store_id
GROUP BY s.store_id
ORDER BY customers DESC, s.store_id;

-- 5) Active vs inactive customers (basic engagement view)
-- If your schema uses customer.active (0/1), use this:
SELECT 
  SUM(CASE WHEN c.active = 1 THEN 1 ELSE 0 END) AS active_customers,
  SUM(CASE WHEN c.active = 0 THEN 1 ELSE 0 END) AS inactive_customers
FROM customer c;

-- 6) Countries with at least 50 customers (threshold example)
SELECT co.country,
       COUNT(cu.customer_id) AS customers
FROM customer cu
JOIN address a  ON cu.address_id = a.address_id
JOIN city ci    ON a.city_id     = ci.city_id
JOIN country co ON ci.country_id = co.country_id
GROUP BY co.country
HAVING COUNT(cu.customer_id) >= 50
ORDER BY customers DESC, co.country ASC;

-- 7) Share of total customers by country (percentage)
WITH by_country AS (
  SELECT co.country,
         COUNT(cu.customer_id) AS customers
  FROM customer cu
  JOIN address a  ON cu.address_id = a.address_id
  JOIN city ci    ON a.city_id     = ci.city_id
  JOIN country co ON ci.country_id = co.country_id
  GROUP BY co.country
)
SELECT country,
       customers,
       ROUND(100.0 * customers / SUM(customers) OVER (), 2) AS pct_of_total
FROM by_country
ORDER BY customers DESC, country ASC;

