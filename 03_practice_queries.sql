-- SMART INVENTORY PROJECT - PRACTICE QUERIES
USE inventory_clean_db;

-- 1. View every product
SELECT * FROM products ORDER BY product_id;

-- 2. Products with category and supplier names (INNER JOIN)
SELECT p.product_name, c.category_name, s.supplier_name, p.price, p.quantity
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id
ORDER BY p.product_name;

-- 3. Stock status using the view
SELECT * FROM v_stock_status ORDER BY stock_status, product_name;

-- 4. Low stock or out of stock
SELECT product_name, quantity, reorder_level
FROM products
WHERE quantity <= reorder_level
ORDER BY quantity ASC;

-- 5. Products in selected categories (IN)
SELECT product_name, category_id, price
FROM products
WHERE category_id IN (3, 5, 8);

-- 6. Product count by category (GROUP BY)
SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM categories c
LEFT JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY product_count DESC;

-- 7. Categories with at least 5 products (HAVING)
SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM categories c
JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
HAVING COUNT(p.product_id) >= 5
ORDER BY product_count DESC;

-- 8. Total units and inventory value by category
SELECT c.category_name,
       SUM(p.quantity) AS total_units,
       SUM(p.price * p.quantity) AS total_inventory_value
FROM categories c
JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY total_inventory_value DESC;

-- 9. Suppliers supplying 3 or more products
SELECT s.supplier_name, COUNT(p.product_id) AS products_supplied
FROM suppliers s
JOIN products p ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.supplier_name
HAVING COUNT(p.product_id) >= 3
ORDER BY products_supplied DESC;

-- 10. Most expensive product in each category (subquery)
SELECT p.product_name, p.category_id, p.price
FROM products p
WHERE p.price = (
    SELECT MAX(p2.price)
    FROM products p2
    WHERE p2.category_id = p.category_id
)
ORDER BY p.category_id;

-- 11. Stock movement history
SELECT sm.movement_date, p.product_name, sm.movement_type,
       sm.quantity, sm.notes
FROM stock_movements sm
JOIN products p ON p.product_id = sm.product_id
ORDER BY sm.movement_date DESC;

-- 12. Overall stock summary
SELECT COUNT(*) AS product_types,
       SUM(quantity) AS total_units,
       SUM(price * quantity) AS total_inventory_value,
       SUM(CASE WHEN quantity = 0 THEN 1 ELSE 0 END) AS out_of_stock_products,
       SUM(CASE WHEN quantity > 0 AND quantity <= reorder_level THEN 1 ELSE 0 END) AS low_stock_products
FROM products;
