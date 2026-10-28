-- SMART INVENTORY PROJECT - SAMPLE DATA
-- Run only after 01_schema.sql.
USE inventory_clean_db;

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Computer Components'),
(2, 'Computer Accessories'),
(3, 'Storage Devices'),
(4, 'Office Equipment'),
(5, 'Networking'),
(6, 'Printers and Scanners'),
(7, 'Cables and Power'),
(8, 'Gaming Accessories');

INSERT INTO suppliers (supplier_id, supplier_name, city, phone) VALUES
(1, 'ByteWorks Supplies', 'Hyderabad', '040-555-0101'),
(2, 'Digital Depot', 'Bengaluru', '080-555-0102'),
(3, 'StorageHub India', 'Chennai', '044-555-0103'),
(4, 'Office Essentials', 'Pune', '020-555-0104'),
(5, 'CarryTech', 'Mumbai', '022-555-0105'),
(6, 'NetConnect India', 'Mumbai', '022-555-0106'),
(7, 'PrintTech Solutions', 'Hyderabad', '040-555-0107'),
(8, 'CableWorld', 'Chennai', '044-555-0108'),
(9, 'GameGear India', 'Bengaluru', '080-555-0109'),
(10, 'TechSource India', 'Pune', '020-555-0110');

INSERT INTO products
(product_id, product_name, category_id, supplier_id, price, quantity, reorder_level) VALUES
(1, 'Wireless Mouse', 2, 1, 650.00, 25, 8),
(2, 'USB Keyboard', 2, 1, 850.00, 18, 6),
(3, 'Portable SSD 1TB', 3, 3, 8200.00, 9, 4),
(4, 'Hard Drive 2TB', 3, 3, 5900.00, 6, 5),
(5, 'Office Desk Lamp', 4, 4, 1100.00, 19, 6),
(6, 'Ergonomic Chair', 4, 4, 8900.00, 5, 4),
(7, 'Laptop Backpack', 2, 5, 1600.00, 12, 5),
(8, 'Wi-Fi Router', 5, 6, 2800.00, 14, 6),
(9, 'Gigabit Switch 8-Port', 5, 6, 1900.00, 3, 5),
(10, 'Laser Printer', 6, 7, 12500.00, 4, 5),
(11, 'Inkjet Printer', 6, 7, 6200.00, 11, 4),
(12, 'Document Scanner', 6, 7, 8900.00, 0, 3),
(13, 'Ethernet Cable 5m', 7, 8, 250.00, 42, 15),
(14, 'Ethernet Cable 20m', 7, 8, 650.00, 9, 10),
(15, 'UPS 600VA', 7, 8, 3200.00, 7, 5),
(16, 'Surge Protector', 7, 8, 850.00, 2, 8),
(17, 'Gaming Mouse', 8, 9, 2100.00, 16, 6),
(18, 'Gaming Keyboard', 8, 9, 3500.00, 6, 6),
(19, 'Gaming Headset', 8, 9, 2900.00, 0, 4),
(20, 'Mouse Pad XL', 8, 9, 750.00, 22, 8),
(21, 'Webcam 1080p', 1, 10, 3100.00, 5, 6),
(22, 'USB-C Hub', 2, 10, 1700.00, 13, 5),
(23, 'USB-C Cable', 7, 8, 400.00, 31, 12),
(24, '65W Laptop Charger', 7, 8, 2200.00, 8, 5),
(25, 'Bluetooth Adapter', 5, 6, 550.00, 1, 5),
(26, 'Wi-Fi Range Extender', 5, 6, 1800.00, 10, 5),
(27, 'RAM 16GB DDR4', 1, 10, 3200.00, 17, 8),
(28, 'RAM 32GB DDR5', 1, 10, 7800.00, 3, 4),
(29, 'Graphics Tablet', 1, 10, 4600.00, 2, 3),
(30, 'HDMI Cable 2m', 7, 8, 350.00, 0, 10),
(31, 'DisplayPort Cable', 7, 8, 700.00, 15, 8),
(32, 'Mechanical Keyboard', 8, 9, 4200.00, 7, 5),
(33, 'Webcam Cover', 2, 2, 180.00, 40, 10),
(34, 'Laptop Stand', 2, 2, 950.00, 14, 5),
(35, 'NVMe SSD 1TB', 3, 3, 7600.00, 8, 4),
(36, 'Thermal Paste', 1, 1, 350.00, 20, 8),
(37, 'Power Bank 20000mAh', 7, 2, 2400.00, 6, 5),
(38, 'Bluetooth Speaker', 2, 2, 1800.00, 11, 4),
(39, 'Gaming Controller', 8, 9, 3200.00, 4, 5),
(40, 'All-in-One Printer', 6, 7, 14800.00, 3, 4),
(41, 'USB Wi-Fi Adapter', 5, 6, 900.00, 18, 6),
(42, 'Cable Organizer Kit', 7, 8, 300.00, 24, 10);

INSERT INTO stock_movements
(product_id, movement_type, quantity, movement_date, notes) VALUES
(1, 'IN', 30, '2026-09-01', 'Opening stock'),
(1, 'OUT', 5, '2026-09-05', 'Customer orders'),
(3, 'IN', 12, '2026-09-02', 'Supplier delivery'),
(3, 'OUT', 3, '2026-09-08', 'Customer orders'),
(8, 'IN', 20, '2026-09-03', 'New router shipment'),
(9, 'OUT', 2, '2026-09-09', 'Sold to business customer'),
(12, 'OUT', 3, '2026-09-10', 'Scanner sales'),
(13, 'IN', 50, '2026-09-11', 'Cable restock'),
(16, 'OUT', 6, '2026-09-12', 'Store sales'),
(17, 'IN', 15, '2026-09-13', 'Gaming accessory shipment'),
(19, 'OUT', 4, '2026-09-14', 'Headset sales'),
(21, 'IN', 10, '2026-09-15', 'Webcam shipment'),
(25, 'OUT', 4, '2026-09-16', 'Adapter sales'),
(27, 'IN', 20, '2026-09-17', 'RAM shipment'),
(30, 'OUT', 10, '2026-09-18', 'Cable sales'),
(39, 'IN', 8, '2026-09-19', 'Controller shipment');

-- Verify the imported row counts. Expected: 8 categories, 10 suppliers, 42 products, 16 movements.
SELECT 'categories' AS table_name, COUNT(*) AS row_count FROM categories
UNION ALL SELECT 'suppliers', COUNT(*) FROM suppliers
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'stock_movements', COUNT(*) FROM stock_movements;
