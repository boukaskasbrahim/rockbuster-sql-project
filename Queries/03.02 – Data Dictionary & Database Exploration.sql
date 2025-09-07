-- =========================================================
-- Rockbuster SQL Project
-- Exercise: 03.02 – Data Dictionary & Database Exploration
-- Purpose: Explore database schema, list tables, and review columns
-- =========================================================

-- 1) List all tables in the public schema
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

-- 2) List all columns for the customer table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'customer'
ORDER BY ordinal_position;

-- 3) List all columns for the film table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'film'
ORDER BY ordinal_position;

-- 4) List all columns for the payment table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'payment'
ORDER BY ordinal_position;

-- 5) List all columns for the rental table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'rental'
ORDER BY ordinal_position;

-- 6) List all columns for the store table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'store'
ORDER BY ordinal_position;

-- 7) Quick preview of the first 10 customers
SELECT *
FROM customer
LIMIT 10;

-- 8) Quick preview of the first 10 films
SELECT *
FROM film
LIMIT 10;

-- 9) Quick preview of the first 10 payments
SELECT *
FROM payment
LIMIT 10;
