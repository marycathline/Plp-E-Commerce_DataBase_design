--This file creates an Ecommerce database and relational tables.

CREATE DATABASE ecommercedb;

USE ecommercedb;

CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_name VARCHAR(255) NOT NULL
);

INSERT INTO brand (brand_name)
 VALUES ('Nike'),
('Apple'),
('Techno'),
('Samsung');


CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

INSERT INTO product_category (category_name) 
VALUES ('Clothing'),
('Utensils'),
('Funitures'),
('Electronics');

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    base_price DECIMAL(10, 2),
    brand_id INT,
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

INSERT INTO product (name, base_price, brand_id, category_id)
 VALUES ('iPhone 14', 999.99, 2, 2),
 ('Techno spark', 599.00, 3, 3),
('Air Jordan 1', 199.99, 1, 1);



CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO product_image (product_id, image_url)
 VALUES (1, 'https://images.com/images/iphone14.png'),
(2, 'https://images.com/images/airjordan1.png');


CREATE TABLE color (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(100)
);

INSERT INTO color (color_name) 
VALUES ('Red'),
('Black'),
('White');


CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO size_category (name) 
VALUES ('Clothing Size'),
('Funiture size'),
('Shoe size');

CREATE TABLE size_option (
    size_id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    size_value VARCHAR(50),
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

INSERT INTO size_option (size_category_id, size_value)
 VALUES (1, 'S'),
(1, 'M'),
(1, 'L');

CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);

INSERT INTO product_variation (product_id, color_id, size_id)
 VALUES (2, 2, 2),  -- Air Jordan 1, Black, Medium
(2, 3, 3);  -- Air Jordan 1, White, Large

CREATE TABLE product_item (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    variation_id INT,
    sku VARCHAR(100),
    stock_quantity INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

INSERT INTO product_item (product_id, variation_id, sku, stock_quantity)
 VALUES (2, 1, 'AJ1-B-M', 10),
(2, 2, 'AJ1-W-L', 5);

CREATE TABLE attribute_category (
    attr_cat_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO attribute_category (name) 
VALUES ('Technical'), 
('Physical');


CREATE TABLE attribute_type (
    attr_type_id INT AUTO_INCREMENT PRIMARY KEY,
    data_type VARCHAR(50)
);

INSERT INTO attribute_type (data_type) 
VALUES ('text'), 
('number');

CREATE TABLE product_attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attr_cat_id INT,
    attr_type_id INT,
    attribute_name VARCHAR(100),
    attribute_value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attr_cat_id) REFERENCES attribute_category(attr_cat_id),
    FOREIGN KEY (attr_type_id) REFERENCES attribute_type(attr_type_id)
);


INSERT INTO product_attribute (product_id, attr_cat_id, attr_type_id, attribute_name, attribute_value) 
VALUES (1, 1, 1, 'Processor', 'A15 Bionic'),
(1, 1, 2, 'Storage (GB)', '128'),
(2, 2, 1, 'Material', 'Leather');

