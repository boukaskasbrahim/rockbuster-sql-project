-- =========================================================
-- Rockbuster SQL Project
-- Exercise: 03.10 – Management KPIs
-- Purpose: Executive-friendly KPIs (customers, revenue, markets)
-- =========================================================

-- 1) Top 10 customers by total revenue
SELECT 
  c.customer_id,
  c.first_name,
  c.last_name,
  SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 10;

-- 2) Average revenue per customer
SELECT AVG(customer_total) AS avg_revenue_per_customer
FROM (
  SELECT c.customer_id, SUM(p.amount) AS customer_total
  FROM customer c
  JOIN payment p ON p.customer_id = c.customer_id
  GROUP BY c.customer_id
) t;

-- 3) Most profitable countries (Top 5)
SELECT 
  co.country,
  SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer cu ON p.customer_id = cu.customer_id
JOIN address a  ON cu.address_id  = a.address_id
JOIN city ci    ON a.city_id      = ci.city_id
JOIN country co ON ci.country_id  = co.country_id
GROUP BY co.country
ORDER BY total_revenue DESC
LIMIT 5;

-- 4) Revenue by month (trend)
SELECT 
  DATE_TRUNC('month', p.payment_date) AS month,
  SUM(p.amount) AS total_revenue
FROM payment p
GROUP BY month
ORDER BY month;

-- 5) Customers per store
SELECT 
  s.store_id,
  COUNT(c.customer_id) AS customers
FROM customer c
JOIN store s ON c.store_id = s.store_id
GROUP BY s.store_id
ORDER BY customers DESC, s.store_id;

-- 6) Active customers (basic engagement KPI)
-- If your schema has customer.active (0/1), use this WHERE:
--   WHERE c.active = 1
SELECT 
  COUNT(*) AS active_customers
FROM customer c
WHERE c.active = 1;
