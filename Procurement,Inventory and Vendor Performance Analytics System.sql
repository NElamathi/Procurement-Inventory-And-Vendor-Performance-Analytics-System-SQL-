CREATE DATABASE Procurement_Inventory_Analytics;
USE Procurement_Inventory_Analytics;
CREATE TABLE Vendors(
vendor_id INT PRIMARY KEY,
vendor_name VARCHAR(100) NOT NULL,
contact_person VARCHAR(50) NOT NULL,
phone VARCHAR(50) UNIQUE,
email VARCHAR(50) unique,
city VARCHAR (50) NOT NULL
);
DESC vendors;

CREATE TABLE categories(
category_id INT PRIMARY KEY,
category_name VARCHAR(50) NOT NULL,
DESCRIPTION VARCHAR(100)
);
DESC categories;
 CREATE TABLE products(
 product_id INT PRIMARY KEY,
 product_name VARCHAR(100) NOT NULL,
 category_id INT,
 vendor_id INT,
 unit_price DECIMAL NOT NULL,
FOREIGN KEY (category_id) REFERENCES Categories(category_id),
FOREIGN KEY (vendor_id) REFERENCES Vendors(vendor_id)
 );
DESC products;
CREATE TABLE warehouses(
warehouse_id INT PRIMARY KEY,
warehouse_name VARCHAR(100) NOT NULL,
city VARCHAR(100) NOT NULL,
manager_name VARCHAR(100) NOT NULL,
capacity INT
);
DESC warehouses;
CREATE TABLE inventory(
inventory_id INT PRIMARY KEY,
product_id INT,
warehouse_id INT,
current_stock INT NOT NULL,
reorder_level INT NOT NULL,
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);
DESC inventory;
CREATE TABLE Purchase_orders(
po_id INT PRIMARY KEY,
vendor_id INT,
product_id INT,
quantity INT NOT NULL,
order_date DATE NOT NULL,
total_amount DECIMAL(10,2) NOT NULL,
status VARCHAR(50),
FOREIGN KEY (vendor_id) REFERENCES vendors(vendor_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);
DESC Purchase_orders;
CREATE TABLE deliveries(
delivery_id INT PRIMARY KEY,
po_id INT,
expected_date DATE NOT NULL,
delivery_date DATE NOT NULL,
delivery_status VARCHAR(50) NOT NULL,
FOREIGN KEY (po_id) REFERENCES purchase_orders(po_id)
);
DESC deliveries;
INSERT INTO categories(category_id,category_name,description)
values
(101, 'Electronics', 'Electronic office and business equipment'),
(102, 'Computer Accessories', 'Computer peripherals and accessories'),
(103, 'Office Supplies', 'General office stationery and supplies'),
(104, 'Packaging Materials', 'Materials used for product packaging'),
(105, 'Safety Equipment', 'Workplace safety products'),
(106, 'Cleaning Supplies', 'Cleaning and maintenance products'),
(107, 'Electrical Supplies', 'Electrical components and equipment'),
(108, 'Storage Equipment', 'Shelving and warehouse storage products'),
(109, 'Furniture', 'Office furniture and workplace equipment'),
(110, 'Networking Equipment', 'Network devices and connectivity equipment');
select*from categories;
INSERT INTO vendors
(vendor_id, vendor_name, contact_person, phone, email, city)
VALUES
(201, 'TechSource Solutions', 'Arun Kumar', 98765-01321, 'arun@techsource.com', 'Chennai'),
(202, 'Prime Office Supplies', 'Ravi', 99465-41232, 'ravi@primeoffice.com', 'Bangalore'),
(203, 'Global Electronics', 'Pavithra', 88765-11004, 'pavithra@globalelectronics.com', 'Hyderabad'),
(204, 'SafeWork India', 'Karthik', 76549-45769, 'karthik@safework.com', 'Chennai'),
(205, 'PackRight Industries', 'Dhivya', 97665-87650, 'divya@packright.com', 'Coimbatore'),
(206, 'CleanPro Supplies', 'Rajesh', 88765-10105, 'rajesh@cleanpro.com', 'Madurai'),
(207, 'ElectroMart', 'Priya Mani', 99651-90052, 'priya@electromart.com', 'Bangalore'),
(208, 'StorageMax', 'Vijay', 84765-76898, 'vijay@storagemax.com', 'Chennai'),
(209, 'FurniTech Solutions', 'Lakshmi Devi', 92347-45689, 'lakshmi@furnitech.com', 'Hyderabad'),
(210, 'NetConnect Systems', 'Rahul', 97865-87689, 'rahul@netconnect.com', 'Bangalore'),
(211, 'OfficeHub Traders', 'Anitha S', 96367-02341, 'anitha@officehub.com', 'Chennai'),
(212, 'Industrial Supplies Co', 'Mohan', '94567-01012', 'mohan@industrialsupplies.com', 'Coimbatore'),
(213, 'Digital World', 'Naveen Kumar', 99651-78900, 'naveen@digitalworld.com', 'Hyderabad'),
(214, 'Metro Packaging', 'Swetha sri', 84386-08714, 'swetha@metropackaging.com', 'Madurai'),
(215, 'Workplace Solutions', 'Ganesh ', 77085-99430, 'ganesh@workplace.com', 'Chennai');

/*while inserting phone nuber it shows the out of range for column 'phone'
so i modify the data type to varchar because some companies will have hypen in their number,
so i changed it to varcHAR*/
ALTER TABLE vendors
MODIFY phone VARCHAR(20);

SELECT*FROM vendors;
-- now counting how many vendors--
SELECT count(*) FROM vendors;
-- inserting 40 records in the prodcut table--
-- product table have refrences from category and vendor--
INSERT INTO products
(product_id, product_name, category_id, vendor_id, unit_price)
VALUES
(301, 'Laptop', 101, 201, 55000.00),
(302, 'Desktop Computer', 101, 203, 42000.00),
(303, 'LED Monitor', 101, 207, 12500.00),
(304, 'Keyboard', 102, 201, 1200.00),
(305, 'Wireless Mouse', 102, 203, 850.00),
(306, 'USB Hub', 102, 210, 950.00),
(307, 'Printer', 101, 213, 18500.00),
(308, 'Printer Paper', 103, 202, 450.00),
(309, 'Notebook', 103, 211, 120.00),
(310, 'Ballpoint Pen Pack', 103, 202, 180.00),
(311, 'File Folder', 103, 211, 75.00),
(312, 'Stapler', 103, 202, 250.00),
(313, 'Cardboard Box', 104, 205, 45.00),
(314, 'Bubble Wrap Roll', 104, 214, 650.00),
(315, 'Packing Tape', 104, 205, 120.00),
(316, 'Safety Helmet', 105, 204, 550.00),
(317, 'Safety Gloves', 105, 204, 180.00),
(318, 'Safety Shoes', 105, 212, 1450.00),
(319, 'Floor Cleaner', 106, 206, 320.00),
(320, 'Disinfectant Liquid', 106, 206, 280.00),
(321, 'Cleaning Mop', 106, 206, 450.00),
(322, 'Electrical Cable', 107, 207, 850.00),
(323, 'Power Socket', 107, 207, 320.00),
(324, 'Circuit Breaker', 107, 212, 950.00),
(325, 'Storage Rack', 108, 208, 7500.00),
(326, 'Plastic Storage Bin', 108, 208, 850.00),
(327, 'Warehouse Shelf', 108, 208, 6200.00),
(328, 'Office Chair', 109, 209, 6500.00),
(329, 'Office Desk', 109, 209, 9500.00),
(330, 'Conference Table', 109, 215, 18000.00),
(331, 'Router', 110, 210, 3500.00),
(332, 'Network Switch', 110, 210, 4800.00),
(333, 'Network Cable', 110, 213, 650.00),
(334, 'Web Camera', 102, 201, 2200.00),
(335, 'External Hard Drive', 102, 203, 6200.00),
(336, 'Barcode Scanner', 101, 213, 8500.00),
(337, 'Thermal Printer', 101, 213, 7200.00),
(338, 'Packing Label Roll', 104, 214, 350.00),
(339, 'First Aid Kit', 105, 204, 950.00),
(340, 'Hand Sanitizer', 106, 206, 180.00);
SELECT* FROM products;
-- inserting inot warehouse table--
INSERT INTO warehouses
(warehouse_id, warehouse_name, city, manager_name, capacity)
VALUES
(401, 'Chennai Central Warehouse', 'Chennai', 'Arun Prakash', 5000),
(402, 'Bangalore Distribution Center', 'Bangalore', 'Meena Krishnan', 4000),
(403, 'Hyderabad Storage Hub', 'Hyderabad', 'Ravi Shankar', 3500),
(404, 'Coimbatore Regional Warehouse', 'Coimbatore', 'Priya Menon', 3000);
SELECT * FROM warehouses;
-- count the total warehouses by alias name--
SELECT COUNT(*) AS total_warehouses
FROM warehouses;
INSERT INTO inventory (inventory_id,product_id,warehouse_id,current_stock,reorder_level)
values
(501, 320, 401, 50, 20),
(504, 304, 403, 50, 15),
(502, 301, 403, 50, 15),
(505, 325, 404, 200, 50),
(503, 310, 403, 100, 10),
(506, 302, 401, 35, 10),
(507, 303, 402, 60, 20),
(508, 305, 401, 120, 30),
(509, 306, 402, 25, 30),
(510, 307, 403, 18, 10),
(511, 308, 401, 300, 50),
(512, 309, 402, 150, 40),
(513, 311, 403, 45, 20),
(514, 312, 404, 80, 25),
(515, 313, 401, 500, 100),
(516, 314, 402, 35, 40),
(517, 315, 403, 180, 50),
(518, 316, 404, 30, 15),
(519, 317, 401, 12, 20),
(520, 318, 402, 25, 10),
(521, 319, 403, 70, 20),
(522, 321, 404, 40, 15),
(523, 322, 401, 90, 25),
(524, 323, 402, 55, 15),
(525, 324, 403, 18, 20),
(526, 326, 404, 150, 40),
(527, 327, 401, 25, 30),
(528, 328, 402, 35, 10),
(529, 329, 403, 20, 8),
(530, 330, 404, 12, 5),
(531, 331, 401, 45, 15),
(532, 332, 402, 30, 10),
(533, 333, 403, 200, 50),
(534, 334, 404, 25, 10),
(535, 335, 401, 15, 8),
(536, 336, 402, 18, 10),
(537, 337, 403, 22, 10),
(538, 338, 404, 100, 30),
(539, 339, 401, 15, 20),
(540, 340, 402, 80, 25),
(541, 302, 404, 20, 15),
(542, 305, 403, 75, 20),
(543, 308, 402, 250, 50),
(544, 313, 403, 300, 75),
(545, 316, 401, 40, 15),
(546, 319, 402, 60, 20),
(547, 322, 404, 50, 15),
(548, 325, 401, 80, 25),
(549, 328, 403, 25, 10),
(550, 331, 404, 20, 10),
(551, 334, 402, 40, 15),
(552, 336, 401, 12, 15),
(553, 337, 404, 18, 10),
(554, 339, 403, 8, 12),
(555, 340, 401, 50, 20),
(556, 307, 402, 10, 15),
(557, 315, 404, 45, 50),
(558, 323, 401, 70, 20),
(559, 326, 403, 100, 30),
(560, 333, 402, 150, 40);
SELECT COUNT(*) AS total_inventory
FROM inventory;
-- inserting into purchase_order table--
INSERT INTO purchase_orders
(po_id, vendor_id, product_id, quantity, order_date, total_amount, status)
VALUES
(1001, 201, 301, 10, '2026-01-05', 550000.00, 'Delivered'),
(1002, 202, 308, 200, '2026-01-07', 90000.00, 'Delivered'),
(1003, 203, 302, 15, '2026-01-10', 630000.00, 'Delivered'),
(1004, 204, 316, 50, '2026-01-12', 27500.00, 'Delivered'),
(1005, 205, 313, 500, '2026-01-15', 22500.00, 'Delivered'),
(1006, 206, 319, 100, '2026-01-18', 32000.00, 'Delivered'),
(1007, 207, 303, 20, '2026-01-20', 250000.00, 'Delivered'),
(1008, 208, 325, 10, '2026-01-22', 75000.00, 'Delivered'),
(1009, 209, 328, 25, '2026-01-25', 162500.00, 'Delivered'),
(1010, 210, 331, 30, '2026-01-27', 105000.00, 'Delivered'),
(1011, 211, 309, 300, '2026-02-02', 36000.00, 'Delivered'),
(1012, 212, 318, 40, '2026-02-05', 58000.00, 'Delivered'),
(1013, 213, 307, 15, '2026-02-08', 277500.00, 'Delivered'),
(1014, 214, 314, 30, '2026-02-10', 19500.00, 'Delivered'),
(1015, 215, 329, 20, '2026-02-12', 190000.00, 'Delivered'),
(1016, 201, 304, 100, '2026-02-15', 120000.00, 'Shipped'),
(1017, 202, 310, 150, '2026-02-18', 27000.00, 'Shipped'),
(1018, 203, 305, 80, '2026-02-20', 68000.00, 'Confirmed'),
(1019, 204, 317, 100, '2026-02-22', 18000.00, 'Confirmed'),
(1020, 205, 315, 200, '2026-02-25', 24000.00, 'Pending'),
(1021, 206, 320, 120, '2026-02-27', 33600.00, 'Pending'),
(1022, 207, 322, 60, '2026-03-02', 51000.00, 'Confirmed'),
(1023, 208, 326, 100, '2026-03-05', 85000.00, 'Shipped'),
(1024, 209, 330, 10, '2026-03-08', 180000.00, 'Confirmed'),
(1025, 210, 332, 25, '2026-03-10', 120000.00, 'Pending'),
(1026, 211, 311, 200, '2026-03-12', 15000.00, 'Delivered'),
(1027, 212, 324, 40, '2026-03-15', 38000.00, 'Delivered'),
(1028, 213, 336, 20, '2026-03-18', 170000.00, 'Delivered'),
(1029, 214, 338, 100, '2026-03-20', 35000.00, 'Delivered'),
(1030, 215, 330, 15, '2026-03-22', 270000.00, 'Delivered'),
(1031, 201, 334, 50, '2026-03-25', 110000.00, 'Delivered'),
(1032, 203, 335, 25, '2026-03-27', 155000.00, 'Delivered'),
(1033, 205, 313, 800, '2026-03-29', 36000.00, 'Shipped'),
(1034, 206, 321, 75, '2026-04-02', 33750.00, 'Shipped'),
(1035, 207, 323, 100, '2026-04-05', 32000.00, 'Confirmed'),
(1036, 208, 327, 20, '2026-04-08', 124000.00, 'Confirmed'),
(1037, 209, 328, 30, '2026-04-10', 195000.00, 'Delivered'),
(1038, 210, 333, 200, '2026-04-12', 130000.00, 'Delivered'),
(1039, 211, 312, 100, '2026-04-15', 25000.00, 'Delivered'),
(1040, 212, 318, 60, '2026-04-18', 87000.00, 'Shipped'),
(1041, 213, 337, 25, '2026-04-20', 180000.00, 'Confirmed'),
(1042, 214, 314, 50, '2026-04-22', 32500.00, 'Pending'),
(1043, 215, 329, 25, '2026-04-25', 237500.00, 'Pending'),
(1044, 201, 306, 75, '2026-04-28', 71250.00, 'Delivered'),
(1045, 202, 308, 400, '2026-05-02', 180000.00, 'Delivered'),
(1046, 204, 339, 50, '2026-05-05', 47500.00, 'Delivered'),
(1047, 206, 340, 150, '2026-05-08', 27000.00, 'Confirmed'),
(1048, 208, 325, 15, '2026-05-10', 112500.00, 'Shipped'),
(1049, 210, 331, 40, '2026-05-12', 140000.00, 'Pending'),
(1050, 213, 307, 20, '2026-05-15', 370000.00, 'Confirmed');
SELECT COUNT(*) AS total_purchase_orders
FROM purchase_orders;
-- inserting into table deliveries--
INSERT INTO deliveries
(delivery_id, po_id, expected_date, delivery_date, delivery_status)
VALUES
(6001, 1001, '2026-01-12', '2026-01-11', 'Delivered'),
(6002, 1002, '2026-01-14', '2026-01-14', 'Delivered'),
(6003, 1003, '2026-01-17', '2026-01-20', 'Delayed'),
(6004, 1004, '2026-01-19', '2026-01-19', 'Delivered'),
(6005, 1005, '2026-01-22', '2026-01-24', 'Delayed'),
(6006, 1006, '2026-01-25', '2026-01-25', 'Delivered'),
(6007, 1007, '2026-01-27', '2026-01-29', 'Delayed'),
(6008, 1008, '2026-01-30', '2026-01-29', 'Delivered'),
(6009, 1009, '2026-02-02', '2026-02-04', 'Delayed'),
(6010, 1010, '2026-02-04', '2026-02-04', 'Delivered'),
(6011, 1011, '2026-02-10', '2026-02-09', 'Delivered'),
(6012, 1012, '2026-02-13', '2026-02-15', 'Delayed'),
(6013, 1013, '2026-02-16', '2026-02-16', 'Delivered'),
(6014, 1014, '2026-02-18', '2026-02-20', 'Delayed'),
(6015, 1015, '2026-02-20', '2026-02-20', 'Delivered'),
(6016, 1016, '2026-02-23', '2026-02-25', 'Delayed'),
(6017, 1017, '2026-02-26', '2026-02-26', 'Delivered'),
(6018, 1018, '2026-02-28', '2026-03-02', 'Delayed'),
(6019, 1019, '2026-03-02', '2026-03-01', 'Delivered'),
(6020, 1020, '2026-03-05', '2026-03-05', 'Pending'),
(6021, 1021, '2026-03-07', '2026-03-09', 'Delayed'),
(6022, 1022, '2026-03-10', '2026-03-10', 'Delivered'),
(6023, 1023, '2026-03-13', '2026-03-15', 'Delayed'),
(6024, 1024, '2026-03-16', '2026-03-16', 'Delivered'),
(6025, 1025, '2026-03-18', '2026-03-20', 'Delayed'),
(6026, 1026, '2026-03-20', '2026-03-20', 'Delivered'),
(6027, 1027, '2026-03-23', '2026-03-25', 'Delayed'),
(6028, 1028, '2026-03-26', '2026-03-26', 'Delivered'),
(6029, 1029, '2026-03-28', '2026-03-30', 'Delayed'),
(6030, 1030, '2026-03-30', '2026-03-30', 'Delivered'),
(6031, 1031, '2026-04-02', '2026-04-04', 'Delayed'),
(6032, 1032, '2026-04-04', '2026-04-04', 'Delivered'),
(6033, 1033, '2026-04-05', '2026-04-07', 'Delayed'),
(6034, 1034, '2026-04-09', '2026-04-09', 'Delivered'),
(6035, 1035, '2026-04-12', '2026-04-14', 'Delayed'),
(6036, 1036, '2026-04-15', '2026-04-15', 'Delivered'),
(6037, 1037, '2026-04-17', '2026-04-18', 'Delayed'),
(6038, 1038, '2026-04-19', '2026-04-19', 'Delivered'),
(6039, 1039, '2026-04-22', '2026-04-22', 'Delivered'),
(6040, 1040, '2026-04-25', '2026-04-27', 'Delayed'),
(6041, 1041, '2026-04-27', '2026-04-27', 'Delivered'),
(6042, 1042, '2026-04-29', '2026-04-29', 'Pending'),
(6043, 1043, '2026-05-02', '2026-05-02', 'Pending'),
(6044, 1044, '2026-05-02', '2026-05-03', 'Delayed'),
(6045, 1045, '2026-05-07', '2026-05-07', 'Delivered'),
(6046, 1046, '2026-05-10', '2026-05-10', 'Delivered'),
(6047, 1047, '2026-05-13', '2026-05-15', 'Delayed'),
(6048, 1048, '2026-05-14', '2026-05-14', 'Delivered'),
(6049, 1049, '2026-05-17', '2026-05-17', 'Pending'),
(6050, 1050, '2026-05-20', '2026-05-22', 'Delayed');
SELECT COUNT(*) AS total_deliveries
FROM deliveries;
-- between... and --
SELECT product_name, unit_price
FROM products
WHERE unit_price BETWEEN 5000 AND 20000;
SELECT po_id, delivery_date
FROM deliveries 
WHERE delivery_date BETWEEN '2026-01-01' AND '2026-08-01';
-- logical and operation--
SELECT product_name, unit_price
FROM products
WHERE unit_price > 5000
AND unit_price < 20000;

SELECT category_id, unit_price
FROM products
WHERE category_id = 101
AND unit_price > 10000;
-- logical or operation--
SELECT vendor_id, vendor_name
FROM vendors
WHERE vendor_id = 501 OR vendor_id = 505;
SELECT *
FROM deliveries;

SELECT delivery_id , delivery_status
FROM deliveries
WHERE delivery_status ='Pending' OR delivery_status = delivery_status ='Delayed';
-- IS null--
SELECT delivery_id, delivery_status
FROM deliveries
WHERE delivery_status IS NULL;
-- like starting letter--
SELECT vendor_name
FROM vendors
WHERE vendor_name LIKE 'P%';
-- like in middle of the records--
SELECT vendor_name
FROM vendors
WHERE vendor_name LIKE '%tech%';
-- like ending with--
SELECT product_name
FROM products
WHERE product_name LIKE '%r';
-- not like--
SELECT vendor_name
FROM vendors
WHERE vendor_name NOT LIKE 'A%';
-- in --
SELECT vendor_id,vendor_name
FROM vendors
WHERE vendor_id IN(201,202,205);

SELECT warehouse_id
FROM inventory
WHERE warehouse_id IN(401,403,404);
-- not in--
SELECT warehouse_id
FROM inventory
WHERE warehouse_id NOT IN(401,403,404);
-- limit--
SELECT product_id,product_name,unit_price
FROM products LIMIT 5;
-- limit offset --
SELECT product_id,product_name,unit_price
FROM products 
LIMIT 5 OFFSET 5;
-- order by with limit--
SELECT product_name,unit_price
FROM products 
ORDER BY unit_price asc
LIMIT 3;
-- order by with limit offset--
SELECT product_name,unit_price
FROM products 
ORDER BY unit_price desc
LIMIT 3 OFFSET 3;
-- Aggregate functions--
-- count--
SELECT count(*) AS product_count
FROM products;
SELECT count(*) AS delivery_record
FROM deliveries;
-- sum--
SELECT sum(current_stock) AS  'total current_stock'
FROM inventory;
-- average--
SELECT avg(current_stock) AS  'Avg current_stock'
FROM inventory;
-- minimum--
SELECT min(unit_price) as 'min unit_price'
FROM products;
-- maximum--
SELECT max(unit_price) as 'max unit_price'
FROM products;
-- Group by count--
SELECT category_id ,count(*) ' total products'
FROM categories
GROUP BY category_id;
-- Group by sum--
SELECT warehouse_id,sum(current_stock) as 'total current_stock'
FROM inventory
GROUP BY warehouse_id;
-- Group by Avg--
SELECT category_id,avg(unit_price) as 'avg unit_price'
FROM products
GROUP BY category_id;
-- Group by min--
SELECT category_id,min(unit_price)  'min unit_price'
FROM products
GROUP BY category_id;
-- group by max--
SELECT warehouse_id,max(current_stock)  'max current_stock'
FROM inventory
GROUP BY warehouse_id;
-- Group by having--
-- average--	
SELECT category_id
FROM products
GROUP BY category_id
HAVING AVG(unit_price);
-- SUM--
SELECT warehouse_id, sum(current_stock)as 'total current_stock'
FROM inventory
GROUP BY warehouse_id
HAVING sum(current_stock) > 100;
-- Maximum--
SELECT category_id, max(unit_price)as 'max unit_price'
FROM products
GROUP BY category_id
HAVING max(unit_price) > 20000;
-- count--
SELECT vendor_id,
count(*) as 'total vendors'
FROM vendors
GROUP BY vendor_id
HAVING count(*) =1;

SELECT delivery_status,
count(*) as 'total deliveries'
FROM deliveries
GROUP BY delivery_status
HAVING count(*) >1;
-- average--
SELECT warehouse_id, AVG(current_stock)
FROM inventory
GROUP BY warehouse_id
HAVING AVG(current_stock) > 50;
-- sum--
SELECT warehouse_id, SUM(current_stock) as'total curren_stock'
FROM inventory
GROUP BY warehouse_id
HAVING SUM(current_stock) > 100;
-- min--
SELECT category_id, MIN(unit_price) as'min unit_price'
FROM products
GROUP BY category_id
HAVING MIN(unit_price) > 5000;
-- count--
SELECT delivery_status, 
COUNT(*) as 'total deliveries'
FROM deliveries
GROUP BY delivery_status
HAVING count(*) >= 3;
-- joins--
-- inner join- Matched records from table--
SELECT p.product_name,
v.vendor_name
FROM
products AS p
INNER JOIN
vendors AS v
  ON P.vendor_id = V.vendor_id;
  
  SELECT p.product_name,
  c.category_name
  FROM
  products as p
  INNER JOIN
  categories AS c
  ON p.category_id = c.category_id;
  -- left join--
SELECT p.product_name,
v.vendor_name
FROM
products as p
LEFT JOIN
vendors AS v
ON p.vendor_id = v.vendor_id;

SELECT v.vendor_name,
p.product_name
FROM
vendors AS v
LEFT JOIN
products as p
ON v.vendor_id = p.vendor_id;
-- right join--
SELECT w.warehouse_id,
i.current_stock
FROM
inventory as i
RIGHT JOIN
warehouses as w
ON i.warehouse_id = w.warehouse_id;

SELECT c.category_name,
p.product_name
FROM
products as p
RIGHT JOIN
categories as c
ON p.category_id = c.category_id;
-- sub query--
SELECT product_name,unit_price
FROM products
WHERE unit_price<(
    SELECT AVG(unit_price)
    FROM products
    );
    
SELECT product_name,unit_price
FROM products
WHERE unit_price >(
    SELECT Min(unit_price)
    FROM products
    );
    -- case--
SELECT product_name,
 unit_price,
       CASE
           WHEN unit_price > 20000 THEN 'Expensive'
           WHEN unit_price BETWEEN 5000 AND 20000 THEN 'Affordable'
           ELSE 'Cheap'
       END AS price_category
FROM products;
-- views--
CREATE VIEW expensive_products AS
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price > 10000;

SELECT product_name, unit_price
FROM expensive_products
ORDER BY unit_price DESC;
-- procedural function--
DELIMITER $$
CREATE FUNCTION add_tax(price DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN price * 1.10;
END $$
DELIMITER ;
-- triggers--
DELIMITER $$
CREATE TRIGGER product_price_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    IF OLD.unit_price <> NEW.unit_price THEN
        INSERT INTO price_history(product_id, old_price, new_price)
        VALUES (OLD.product_id, OLD.unit_price, NEW.unit_price);
    END IF;
END $$
DELIMITER ;
-- rank--
SELECT product_name,unit_price,
    RANK() OVER (ORDER BY unit_price DESC) AS price_rank
FROM products;
