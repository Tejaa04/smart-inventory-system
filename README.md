<h1 align="center">📦 Smart Inventory & Stock Alert System</h1> <p align="center"> A MySQL database project that tracks products, suppliers and stock movements,<br> and automatically flags items that are <b>low</b> or <b>out of stock</b>. </p> <p align="center"> <img src="https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql&logoColor=white" alt="MySQL 8"> <img src="https://img.shields.io/badge/SQL-Joins%20%7C%20Views%20%7C%20Subqueries-orange" alt="SQL"> <img src="https://img.shields.io/badge/Tables-4-blue" alt="4 tables"> <img src="https://img.shields.io/badge/Sample%20Products-42-green" alt="42 products"> </p>
📖 Overview

This project models the inventory of a small IT/electronics retailer. It stores what is in stock, who supplies it, and every stock-in / stock-out event. A SQL view classifies each product as IN STOCK, LOW STOCK or OUT OF STOCK based on its reorder level, so restocking decisions can be made with a single query.

✨ Features
🗂️ Normalised schema with primary keys, foreign keys and CHECK constraints
🚦 Automatic stock alerts through the v_stock_status view
🔁 Stock movement history (IN / OUT) per product
💰 Inventory value calculation per product and per category
📊 12 ready-made analysis queries
♻️ Safe to re-run: the schema script only resets its own database
🧩 Database Design
contains
supplies
has
CATEGORIES
int
category_id
PK
varchar
category_name
PRODUCTS
int
product_id
PK
varchar
product_name
int
category_id
FK
int
supplier_id
FK
decimal
price
int
quantity
int
reorder_level
SUPPLIERS
int
supplier_id
PK
varchar
supplier_name
varchar
city
varchar
phone
STOCK_MOVEMENTS
int
movement_id
PK
int
product_id
FK
enum
movement_type
int
quantity
date
movement_date
varchar
notes
Table	Rows	Description
categories	8	Product categories
suppliers	10	Supplier name, city, phone
products	42	Price, quantity, reorder level
stock_movements	16	IN / OUT history
v_stock_status	view	Stock status and inventory value per product
🚦 Stock status logic
sql
CASE
    WHEN quantity = 0              THEN 'OUT OF STOCK'
    WHEN quantity <= reorder_level THEN 'LOW STOCK'
    ELSE 'IN STOCK'
END

With the sample data: 3 products are out of stock and 11 are low on stock.

🧠 SQL Concepts Demonstrated
Concept	Where
INNER JOIN / LEFT JOIN	Queries 2, 6, 8, 11
GROUP BY + HAVING	Queries 7, 9
Aggregates (SUM, COUNT, MAX)	Queries 6, 8, 12
Correlated subquery	Query 10
CASE expressions	View and query 12
Views	v_stock_status
Constraints (PK, FK, CHECK, UNIQUE, ENUM)	01_schema.sql
📁 Project Structure
smart-inventory-system/
├── 01_schema.sql            # Database, tables and view
├── 02_sample_data.sql       # Sample data + row-count check
├── 03_practice_queries.sql  # 12 analysis queries
└── README.md
🚀 Getting Started

Requirements: MySQL 8.0+ and MySQL Workbench (or any MySQL client).

Clone the repository
bash
   git clone https://github.com/<your-username>/smart-inventory-system.git
Open MySQL Workbench and connect to your local instance.
Run the scripts in this order:
01_schema.sql creates the database inventory_clean_db
02_sample_data.sql loads the data (expect 8 / 10 / 42 / 16 rows)
03_practice_queries.sql runs the example queries

Or from the command line:

bash
mysql -u root -p < 01_schema.sql
mysql -u root -p < 02_sample_data.sql
mysql -u root -p < 03_practice_queries.sql

⚠️ 01_schema.sql drops and recreates the tables inside inventory_clean_db. Run 02_sample_data.sql only once after it, otherwise you will get duplicate primary key errors.

🔍 Example Queries

Items that need restocking

sql
SELECT product_name, quantity, reorder_level
FROM products
WHERE quantity <= reorder_level
ORDER BY quantity ASC;

Inventory value by category

sql
SELECT c.category_name,
       SUM(p.quantity) AS total_units,
       SUM(p.price * p.quantity) AS total_inventory_value
FROM categories c
JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY total_inventory_value DESC;
🛠️ Troubleshooting
Problem	Fix
Error 1046: No database selected	Run the whole script; each file starts with USE inventory_clean_db;
Database not visible in Workbench	Right-click SCHEMAS → Refresh All
Duplicate primary key error	Sample data was already loaded; re-run 01_schema.sql first to reset
🔮 Future Improvements
Trigger that updates products.quantity automatically when a stock movement is inserted
Stored procedure for recording sales and restocks
Purchase orders table linked to suppliers
Simple Python/Flask dashboard on top of the database
👤 Author

Sai Teja Lakhinana GitHub: Teja Lakhinana
