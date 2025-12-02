DROP DATABASE IF EXISTS pizza_express;
CREATE DATABASE pizza_express;
USE pizza_express;

CREATE TABLE zip (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT,
 zip SMALLINT(4) UNSIGNED NOT NULL,
 city VARCHAR(255) NOT NULL,

 PRIMARY KEY(id),
 UNIQUE(zip, city)
);

CREATE TABLE customer (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT,
 fk_zip_id INT UNSIGNED NOT NULL,
 firstname VARCHAR(255) NOT NULL,
 lastname	VARCHAR(255) NOT NULL,
 address VARCHAR(255) NOT NULL,
 email VARCHAR(384) NOT NULL UNIQUE,
 password VARCHAR(255) NOT NULL,
 phone VARCHAR(255),

 PRIMARY KEY(id),
 FOREIGN KEY(fk_zip_id) REFERENCES zip(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE category (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT,
 category VARCHAR(255) NOT NULL UNIQUE,
 PRIMARY KEY(id)
);

CREATE TABLE product (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT,
 fk_category_id	INT UNSIGNED NOT NULL,
 name VARCHAR(255) NOT NULL,
 description	VARCHAR(255) NOT NULL,
 price DECIMAL(6,2) NOT NULL,

 PRIMARY KEY(id),
 FOREIGN KEY(fk_category_id) REFERENCES category(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE order_entry (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT,
 fk_customer_id INT UNSIGNED NOT NULL,
 ordered_at DATETIME NOT NULL DEFAULT current_timestamp,
 delivered_at DATETIME NULL,

 PRIMARY KEY(id),
 FOREIGN KEY(fk_customer_id) REFERENCES customer(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE product_order_entry (
 id	INT UNSIGNED NOT NULL AUTO_INCREMENT,
 fk_product_id INT UNSIGNED NOT NULL,
 fk_order_entry_id INT UNSIGNED NOT NULL,
 amount INT UNSIGNED NOT NULL DEFAULT 1,
 price DECIMAL(6,2) NULL,

 PRIMARY KEY(id),
 FOREIGN KEY(fk_product_id) REFERENCES product(id) ON UPDATE CASCADE ON DELETE CASCADE,
 FOREIGN KEY(fk_order_entry_id) REFERENCES order_entry(id) ON UPDATE CASCADE ON DELETE CASCADE
);


/* 3 KATEGORIEN ERSTELLEN */
INSERT INTO category (category) VALUES ('Pizza'),
('Pasta'), ('Salat'), ('Suppe');

/* 5 PRODUKTE ERSTELLEN*/
INSERT INTO product (fk_category_id, name, description, price) VALUES 
(1 , "Margarita", "Tomaten und Käse", 20.00),
(1 , "Diavola", "Salami mit Käse und Tomaten", 23.00), 
(2 , "Pesto", "Basilikum Sauce", 17.00),
(2 , "Tomate", "Tomatensauce", 17.00),
(3 , "Italienisch", "Kleiner Italienischer Salat", 10.00);

/* 3 BENUTZER ERSTELLEN */
INSERT INTO zip (zip, city) VALUES 
(5737, "Menziken"),
(5734, "Reinach"),
(6214, "Schenkon");

INSERT INTO customer (fk_zip_id, firstname, lastname, address, email, password) VALUES 
(1, "Mark", "alonso", "TNTStreet 12", "mark@roellifamily.ch", "I love AC/DC"),
(2, "Luca", "aepli", "Sonnenweg 4", "luca.roethlin@menziken.ch", "I love Travis Scott"),
(3, "Ruedi", "michi", "Katerweg 69", "ruedi.schuerch@permiumbeer.ch", "I love beer!");

/* 4 BESTELLUNGEN, 2 AUSGELIEFERT */

INSERT INTO order_entry (fk_customer_id, ordered_at, delivered_at) VALUES
(1, "2023-05-21 11:30:00", "2023-05-21 12:00:00"),
(2, "2023-05-21 19:30:00", "2023-05-21 20:00:00"),
(3, "2023-05-22 00:00:00", NULL),
(3, "2023-05-22 00:15:00", NULL );

INSERT INTO product_order_entry (fk_product_id, fk_order_entry_id, amount, price) VALUES 
(1, 1, 2, 40.00),
(2, 2, 1, 23.00),
(3, 3, 1, 17.00),
(4, 4, 1, 17.00);

