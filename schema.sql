CREATE DATABASE IF NOT EXISTS northstar_pos CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE northstar_pos;
CREATE TABLE IF NOT EXISTS products (
 product_id INT AUTO_INCREMENT PRIMARY KEY, sku VARCHAR(50) UNIQUE NOT NULL,
 name VARCHAR(150) NOT NULL, category VARCHAR(80) NOT NULL, price DECIMAL(10,2) NOT NULL,
 stock_quantity INT NOT NULL DEFAULT 0, low_stock_threshold INT NOT NULL DEFAULT 5,
 active BOOLEAN NOT NULL DEFAULT TRUE, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS customers (
 customer_id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(120) NOT NULL, phone VARCHAR(30),
 email VARCHAR(150), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS sales (
 sale_id INT AUTO_INCREMENT PRIMARY KEY, receipt_no VARCHAR(40) UNIQUE NOT NULL,
 customer_id INT NULL, subtotal DECIMAL(10,2) NOT NULL, tax DECIMAL(10,2) DEFAULT 0,
 discount DECIMAL(10,2) DEFAULT 0, total DECIMAL(10,2) NOT NULL,
 payment_method ENUM('CASH','MPESA','CARD') NOT NULL, amount_paid DECIMAL(10,2) NOT NULL,
 change_due DECIMAL(10,2) DEFAULT 0, sold_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL);
CREATE TABLE IF NOT EXISTS sale_items (
 sale_item_id INT AUTO_INCREMENT PRIMARY KEY, sale_id INT NOT NULL, product_id INT NOT NULL,
 quantity INT NOT NULL, unit_price DECIMAL(10,2) NOT NULL, line_total DECIMAL(10,2) NOT NULL,
 FOREIGN KEY(sale_id) REFERENCES sales(sale_id) ON DELETE CASCADE,
 FOREIGN KEY(product_id) REFERENCES products(product_id));
INSERT IGNORE INTO products(sku,name,category,price,stock_quantity,low_stock_threshold) VALUES
('NS-001','Classic T-Shirt','Clothing',1200,34,5),('NS-002','Premium Hoodie','Clothing',3500,12,5),
('NS-003','Running Shoes','Footwear',8500,8,3),('NS-004','Canvas Backpack','Accessories',2800,19,5),
('NS-005','Wireless Earbuds','Electronics',4200,6,3),('NS-006','Smart Watch','Electronics',6500,4,3),
('NS-007','Denim Jacket','Clothing',5200,3,3),('NS-008','Sports Shorts','Clothing',2200,27,5);
