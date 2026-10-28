Smart Inventory & Stock Alert System

A MySQL project that models a small electronics/IT retail inventory: products, categories, suppliers, stock movements, and an automatic stock-status view (IN STOCK / LOW STOCK / OUT OF STOCK).

Database design
Table	Purpose
categories	Product categories (8 rows)
suppliers	Supplier name, city, phone (10 rows)
products	Price, quantity, reorder level, with FKs to category and supplier (42 rows)
stock_movements	IN/OUT history per product (16 rows)
v_stock_status (view)	Joins everything and computes stock_status and inventory_value

Integrity is enforced with primary/foreign keys, NOT NULL, UNIQUE, and CHECK constraints (price >= 0, quantity >= 0, movement quantity > 0).

SQL concepts demonstrated

INNER/LEFT JOIN, GROUP BY, HAVING, IN, CASE, subqueries, aggregate functions, views, ENUM, constraints.

Files
01_schema.sql - creates the inventory_clean_db database, tables and view
02_sample_data.sql - inserts sample data and prints row counts
03_practice_queries.sql - 12 example queries (low stock, inventory value by category, top supplier, etc.)
How to run (MySQL Workbench)
Connect to your local MySQL instance.
Open and run 01_schema.sql.
Open and run 02_sample_data.sql. Expected counts: 8 categories, 10 suppliers, 42 products, 16 stock movements.
Open 03_practice_queries.sql and run the queries.

Note: 01_schema.sql drops and recreates the tables inside inventory_clean_db only. Run 02_sample_data.sql once after it; running it twice causes duplicate primary key errors.

Tech

MySQL 8, MySQL Workbench
