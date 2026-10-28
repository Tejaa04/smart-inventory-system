-- SMART INVENTORY PROJECT - SCHEMA
-- Uses a NEW database named inventory_clean_db.
-- This does not modify inventory_db or any of your other databases.
-- Safe to rerun: it resets tables ONLY inside inventory_clean_db.

CREATE DATABASE IF NOT EXISTS inventory_clean_db;
USE inventory_clean_db;

SET FOREIGN_KEY_CHECKS = 0;
DROP VIEW IF EXISTS v_stock_status;
DROP TABLE IF EXISTS stock_movements;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS categories;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(120) NOT NULL,
    city VARCHAR(80) NOT NULL,
    phone VARCHAR(25)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(120) NOT NULL,
    category_id INT NOT NULL,
    supplier_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    reorder_level INT NOT NULL DEFAULT 5,
    CONSTRAINT chk_product_price CHECK (price >= 0),
    CONSTRAINT chk_product_quantity CHECK (quantity >= 0),
    CONSTRAINT fk_product_category FOREIGN KEY (category_id)
        REFERENCES categories(category_id),
    CONSTRAINT fk_product_supplier FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id)
);

CREATE TABLE stock_movements (
    movement_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    movement_type ENUM('IN', 'OUT') NOT NULL,
    quantity INT NOT NULL,
    movement_date DATE NOT NULL,
    notes VARCHAR(255),
    CONSTRAINT chk_movement_quantity CHECK (quantity > 0),
    CONSTRAINT fk_movement_product FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE VIEW v_stock_status AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.price,
    p.quantity,
    p.reorder_level,
    CASE
        WHEN p.quantity = 0 THEN 'OUT OF STOCK'
        WHEN p.quantity <= p.reorder_level THEN 'LOW STOCK'
        ELSE 'IN STOCK'
    END AS stock_status,
    (p.price * p.quantity) AS inventory_value
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- After running, select inventory_clean_db in the SCHEMAS panel and refresh.
