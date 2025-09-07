

-- List all tables in the Rockbuster database
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

-- View columns for the "customer" table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'customer';

-- View columns for the "film" table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'film';
