---
--- DROP tables
---
DROP TABLE cinema CASCADE CONSTRAINTS;
DROP TABLE stores CASCADE CONSTRAINTS;
DROP TABLE halls CASCADE CONSTRAINTS;
DROP TABLE departments CASCADE CONSTRAINTS;
DROP TABLE employees CASCADE CONSTRAINTS;
DROP TABLE movies CASCADE CONSTRAINTS;
DROP TABLE customers CASCADE CONSTRAINTS;
DROP TABLE schedule CASCADE CONSTRAINTS;
DROP TABLE tickets CASCADE CONSTRAINTS;
DROP TABLE booking_online CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;

---
--- CREATE tables
---
CREATE TABLE cinema (
    cinema_id NUMERIC,
    cinema_name VARCHAR2(50),
    cinema_address VARCHAR2(40),
    halls_num INTEGER,
    CONSTRAINT cinema_pk PRIMARY KEY (cinema_id)
);

CREATE TABLE stores (
    store_id NUMERIC,
    store_name VARCHAR2(35),
    in_stock VARCHAR2(50),
    price INTEGER,
    cinema_id NUMERIC,
    CONSTRAINT stores_pk PRIMARY KEY (store_id),
    CONSTRAINT fk_cinema FOREIGN KEY (cinema_id) REFERENCES cinema(cinema_id)
);

CREATE TABLE halls (
    hall_id NUMERIC,
    seats_num INTEGER,
    rows_num INTEGER,
    cinema_id NUMERIC,
    CONSTRAINT hall_pk PRIMARY KEY (hall_id),
    CONSTRAINT fk_cinema_halls FOREIGN KEY (cinema_id) REFERENCES cinema(cinema_id)
);

CREATE TABLE departments (
    department_id INTEGER,
    department_name VARCHAR(40),
    cinema_id INTEGER,
    CONSTRAINT department_pk PRIMARY KEY (department_id),
    CONSTRAINT fk_cinema_departments FOREIGN KEY (cinema_id) REFERENCES cinema(cinema_id)
);

CREATE TABLE employees (
    employee_id INTEGER,
    employee_fname VARCHAR2(40),
    employee_lname VARCHAR2(40),
    employee_salary NUMERIC,
    employee_birth_date DATE,
    employee_gender VARCHAR2(10),
    department_id INTEGER,
    CONSTRAINT employee_pk PRIMARY KEY (employee_id),
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE movies (
    movie_id INTEGER,
    title VARCHAR(70),
    duration INTEGER,
    language VARCHAR2(15),
    genre VARCHAR2(70),
    country VARCHAR2(50),
    hall_id INTEGER,
    CONSTRAINT movie_pk PRIMARY KEY (movie_id),
    CONSTRAINT fk_hall FOREIGN KEY (hall_id) REFERENCES halls(hall_id)
);

CREATE TABLE customers (
    customer_id INTEGER,
    customer_name VARCHAR2(35),
    customer_phone NUMERIC,
    customer_email VARCHAR2(40),
    customer_category VARCHAR2(40),
    CONSTRAINT customer_pk PRIMARY KEY (customer_id)
);

CREATE TABLE schedule (
    schedule_time TIMESTAMP,
    movie_id INTEGER,
    customer_id INTEGER,
    CONSTRAINT fk_movie FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE tickets (
    ticket_id NUMERIC,
    bill NUMERIC,
    customer_id INTEGER,
    employee_id INTEGER,
    movie_id INTEGER,
    CONSTRAINT ticket_pk PRIMARY KEY (ticket_id),
    CONSTRAINT fk_customer_tickets FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_employee_tickets FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_movie_tickets FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

CREATE TABLE booking_online (
    booking_id NUMERIC,
    book_seat INTEGER,
    book_row INTEGER,
    customer_id INTEGER,
    movie_id INTEGER,
    CONSTRAINT booking_pk PRIMARY KEY (booking_id),
    CONSTRAINT fk_customer_booking FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_movie_booking FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

CREATE TABLE payment (
    payment_id NUMERIC,
    payment_amount INTEGER,
    payment_method VARCHAR2(30),
    booking_id NUMERIC,
    CONSTRAINT payment_pk PRIMARY KEY (payment_id),
    CONSTRAINT fk_booking FOREIGN KEY (booking_id) REFERENCES booking_online(booking_id)
);

---
--- INSERT TABLES---
--- insert Cinema table
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('1', 'Senger-Grant', '0095 Lyons Hill', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('2', 'Rodriguez-Daniel', '97 Annamark Road', 9);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('3', 'Price, Kunze and Thompson', '2061 Walton Court', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('4', 'Sporer LLC', '7 Ruskin Trail', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('5', 'Schaden Group', '28733 Butterfield Place', 5);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('6', 'Lindgren-Lindgren', '10735 Fuller Place', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('7', 'Sporer Inc', '5 Dunning Park', 8);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('8', 'Thiel LLC', '5410 Roxbury Place', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('9', 'Emard-Welch', '0563 Lindbergh Pass', 3);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('10', 'Lowe, Wuckert and Conn', '00475 Macpherson Pass', 6);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('11', 'Beier, Walter and Heidenreich', '23995 Gale Center', 6);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('12', 'Schaden-O''Kon', '29 Mallard Alley', 6);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('13', 'Langosh, Medhurst and Glover', '192 Bartillon Circle', 3);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('14', 'Treutel-Skiles', '21757 American Center', 5);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('15', 'Daugherty and Marvin', '0 Warbler Road', 3);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('16', 'Kozey and Ullrich', '016 Westport Trail', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('17', 'Hackett and Konopelski', '9197 Shopko Hill', 5);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('18', 'Marks Inc', '22475 Jenifer Place', 3);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('19', 'Hirthe-Schroeder', '013 Jenna Plaza', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('20', 'Collier Group', '0 Elmside Lane', 5);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('21', 'Kshlerin-Hermiston', '0 Sundown Road', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('22', 'Bergstrom, Larson and Koss', '42 Blackbird Plaza', 3);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('23', 'Keebler, Dicki and Jakubowski', '8 Portage Place', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('24', 'King, Zemlak and Crist', '0983 Northridge Crossing', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('25', 'Dare-Bailey', '06651 Moland Street', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('26', 'Boehm-Weissnat', '26113 Shopko Park', 5);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('27', 'Gleichner Inc', '442 Shoshone Road', 5);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('28', 'Smitham-Luettgen', '54 Rigney Alley', 6);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('29', 'Schmidt-Mertz', '8 Golden Leaf Park', 5);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('30', 'Quitzon, Jacobson and Davis', '512 Grover Place', 5);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('31', 'Labadie Group', '254 Homewood Circle', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('32', 'Cruickshank and Sons', '60480 Helena Point', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('33', 'Kreiger-Wilderman', '00 Golf Avenue', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('34', 'Pagac Group', '86149 Straubel Crossing', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('35', 'Konopelski-Feest', '5 Rusk Place', 5);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('36', 'Beatty, Gibson and Hegmann', '725 Nevada Center', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('37', 'Little Group', '2 Graceland Hill', 3);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('38', 'Cremin-Berge', '801 Weeping Birch Point', 5);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('39', 'Beer-McGlynn', '7 Westerfield Point', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('40', 'Franecki-Hudson', '1 Hooker Park', 6);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('41', 'Rutherford, Stracke and McGlynn', '17060 Sutteridge Parkway', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('42', 'Smitham, Bauch and Green', '53129 Westerfield Point', 5);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('43', 'Hermann-Rempel', '0 Myrtle Lane', 4);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('44', 'Trantow, Leannon and Block', '3426 Sutteridge Terrace', 3);
insert into cinema (cinema_id, cinema_name, cinema_address, halls_num) values ('45', 'Chaplin', '7212 Mega Silk Way', 4);

SELECT*FROM cinema;

--- insert Stores table
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('11', 'Jaskolski Group', 'Soup - Campbells Beef Stew', 900, '1');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('21', 'Gulgowski, Schultz and Turcotte', 'Sea Bass - Fillets', 1600, '2');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('31', 'Pouros LLC', 'Wine - Cotes Du Rhone Parallele', 2005, '3');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('41', 'Brakus, McKenzie and Feeney', 'Flavouring - Raspberry', 700, '4');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('51', 'Schumm, Bednar and Schowalter', 'Veal - Kidney', 1300, '5');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('61', 'Runte-Friesen', 'Fruit Salad Deluxe', 2500, '6');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('71', 'Kuvalis LLC', 'Knife Plastic - White', 9000, '7');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('81', 'Conroy, Senger and Osinski', 'Laundry - Bag Cloth', 2200, '8');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('91', 'Feeney-Abbott', 'Meldea Green Tea Liquor', 1200, '9');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('101', 'Ullrich and Sons', 'Pears - Fiorelle', 1900, '10');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('111', 'Kessler LLC', 'Beef - Bones, Cut - Up', 2000, '11');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('121', 'Kerluke-Bradtke', 'Compound - Passion Fruit', 8000, '12');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('131', 'Flatley Group', 'Island Oasis - Wildberry', 2050, '13');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('141', 'Windler and Sons', 'Curry Powder', 400, '14');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('151', 'Haag-Witting', 'Lamb - Leg, Diced', 100, '15');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('161', 'Keefe, Collier and Wolff', 'Cookies - Englishbay Oatmeal', 170, '16');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('171', 'Kilback and Sons', 'Mussels - Frozen', 230, '17');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('181', 'Kreiger-Simonis', 'Canada Dry', 1000, '18');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('191', 'Kuphal, Willms and Howe', 'Beef - Tenderloin Tails', 400, '19');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('201', 'Beer, Hagenes and Lynch', 'Veal - Liver', 1500, '20');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('211', 'Nikolaus-Johns', 'Lettuce - Romaine, Heart', 1800, '21');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('221', 'Bayer Group', 'Pineapple - Golden', 1900, '22');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('231', 'Hodkiewicz LLC', 'Foam Tray S2', 2500, '23');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('241', 'Tillman Inc', 'Maintenance Removal Charge', 800, '24');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('251', 'Stokes Inc', 'Doilies - 5, Paper', 1600, '25');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('261', 'Koss and Sons', 'Beets - Golden', 2100, '26');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('271', 'Lubowitz-Will', 'Oil - Cooking Spray', 1100, '27');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('281', 'Little Inc', 'Potatoes - Parissienne', 900, '28');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('291', 'Sporer LLC', 'Cassis', 2200, '29');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('301', 'Gibson Group', 'Chocolate - Semi Sweet, Calets', 900, '30');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('311', 'Hagenes, Marvin and Abbott', 'Pate Pans Yellow', 1600, '31');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('321', 'Zemlak-Flatley', 'Wine - Zonnebloem Pinotage', 700, '32');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('331', 'Murazik, Wiza and Windler', 'Cheese - Ricotta', 650, '33');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('341', 'Koelpin LLC', 'Lamb - Leg, Diced', 1250, '34');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('351', 'Abernathy-Ortiz', 'Tilapia - Fillets', 750, '35');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('361', 'Schiller Inc', 'Chocolate Bar - Smarties', 1350, '36');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('371', 'Daniel-Schaefer', 'Parsley - Dried', 1535, '37');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('381', 'Monahan and Sons', 'Fish - Atlantic Salmon, Cold', 2222, '38');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('391', 'Gleason Inc', 'Gherkin - Sour', 2560, '39');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('401', 'Dickens-Schmeler', 'Wine - Red, Marechal Foch', 2340, '40');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('411', 'Gusikowski-Swaniawski', 'Halibut - Whole, Fresh', 920, '41');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('421', 'Trantow, Wolff and Cummerata', 'Mushroom - Shitake, Fresh', 2180, '42');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('431', 'Russel-Howell', 'Pork - Loin, Boneless', 1030, '43');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('441', 'Collier-Okuneva', 'Cakes Assorted', 2400, '44');
insert into stores (store_id, store_name, in_stock, price, cinema_id) values ('451', 'Cronin Inc', 'Tart Shells - Sweet, 4', 2500, '45');

SELECT*FROM stores;

--- insert Halls table
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (11, 125, 8, 1);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (12, 131, 9, 1);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (13, 175, 11, 1);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (14, 161, 10, 1);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (21, 152, 8, 2);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (22, 132, 8, 2);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (23, 175, 8, 2);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (24, 154, 8, 2);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (25, 184, 8, 2);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (26, 152, 8, 2);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (27, 121, 8, 2);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (28, 134, 8, 2);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (29, 145, 8, 2);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (31, 147, 9, 3);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (32, 132, 9, 3);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (33, 175, 9, 3);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (34, 165, 9, 3);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (41, 163, 10, 4);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (42, 135, 10, 4);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (43, 136, 10, 4);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (44, 141, 10, 4);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (51, 128, 9, 5);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (52, 182, 9, 5);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (53, 165, 9, 5);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (54, 173, 9, 5);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (55, 124, 9, 5);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (61, 125, 10, 6);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (62, 165, 10, 6);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (63, 154, 10, 6);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (64, 156, 10, 6);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (71, 175, 10, 7);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (72, 124, 10, 7);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (73, 144, 10, 7);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (74, 145, 10, 7);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (75, 176, 10, 7);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (76, 165, 10, 7);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (77, 145, 10, 7);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (78, 134, 10, 7);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (81, 125, 8, 8);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (82, 135, 8, 8);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (83, 145, 8, 8);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (84, 155, 8, 8);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (91, 157, 8, 9);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (92, 159, 8, 9);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (93, 161, 8, 9);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (101, 171, 12, 10);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (102, 173, 12, 10);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (103, 165, 12, 10);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (104, 132, 12, 10);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (105, 137, 12, 10);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (106, 184, 12, 10);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (111, 126, 12, 11);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (112, 172, 12, 11);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (113, 135, 12, 11);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (114, 165, 12, 11);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (115, 145, 12, 11);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (116, 185, 12, 11);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (121, 134, 13, 12);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (122, 165, 13, 12);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (123, 163, 13, 12);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (124, 172, 13, 12);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (125, 174, 13, 12);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (131, 168, 12, 13);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (132, 183, 12, 13);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (133, 127, 12, 13);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (141, 129, 8, 14);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (142, 139, 8, 14);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (143, 149, 8, 14);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (144, 159, 8, 14);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (145, 131, 8, 14);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (151, 127, 8, 15);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (152, 185, 8, 15);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (153, 143, 8, 15);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (161, 172, 10, 16);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (162, 167, 10, 16);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (163, 168, 10, 16);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (164, 163, 10, 16);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (171, 132, 11, 17);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (172, 133, 11, 17);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (173, 144, 11, 17);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (174, 155, 11, 17);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (175, 165, 11, 17);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (181, 177, 10, 18);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (182, 178, 10, 18);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (183, 164, 10, 18);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (191, 123, 10, 19);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (192, 142, 10, 19);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (193, 134, 10, 19);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (194, 156, 10, 19);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (201, 165, 13, 20);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (202, 183, 13, 20);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (203, 132, 13, 20);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (204, 156, 13, 20);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (205, 145, 13, 20);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (211, 133, 10, 21);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (212, 134, 10, 21);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (213, 135, 10, 21);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (214, 136, 10, 21);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (221, 152, 11, 22);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (222, 157, 11, 22);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (223, 143, 11, 22);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (231, 168, 13, 23);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (232, 183, 13, 23);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (233, 185, 13, 23);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (234, 128, 13, 23);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (241, 136, 8, 24);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (242, 164, 8, 24);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (243, 171, 8, 24);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (244, 184, 8, 24);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (251, 162, 9, 25);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (252, 157, 9, 25);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (253, 153, 9, 25);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (254, 155, 9, 25);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (261, 174, 12, 26);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (262, 172, 12, 26);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (263, 173, 12, 26);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (264, 161, 12, 26);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (265, 167, 12, 26);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (271, 169, 13, 27);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (272, 143, 13, 27);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (273, 132, 13, 27);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (274, 124, 13, 27);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (275, 128, 13, 27);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (281, 167, 10, 28);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (282, 156, 10, 28);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (283, 184, 10, 28);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (284, 174, 10, 28);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (285, 173, 10, 28);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (291, 126, 9, 29);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (292, 131, 9, 29);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (293, 141, 9, 29);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (294, 151, 9, 29);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (295, 161, 9, 29);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (301, 123, 13, 30);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (302, 153, 13, 30);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (303, 125, 13, 30);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (304, 176, 13, 30);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (305, 165, 13, 30);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (311, 153, 12, 31);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (312, 154, 12, 31);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (313, 170, 12, 31);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (314, 180, 12, 31);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (321, 140, 12, 32);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (322, 136, 12, 32);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (323, 138, 12, 32);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (324, 174, 12, 32);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (331, 162, 10, 33);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (332, 126, 10, 33);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (333, 168, 10, 33);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (334, 165, 10, 33);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (341, 146, 11, 34);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (342, 148, 11, 34);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (343, 159, 11, 34);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (344, 174, 11, 34);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (351, 173, 12, 35);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (352, 127, 12, 35);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (353, 162, 12, 35);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (354, 182, 12, 35);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (355, 174, 12, 35);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (361, 156, 12, 36);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (362, 167, 12, 36);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (363, 182, 12, 36);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (364, 143, 12, 36);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (371, 151, 11, 37);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (372, 164, 11, 37);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (373, 165, 11, 37);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (381, 126, 10, 38);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (382, 129, 10, 38);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (383, 131, 10, 38);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (384, 132, 10, 38);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (385, 129, 10, 38);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (391, 149, 10, 39);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (392, 184, 10, 39);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (393, 144, 10, 39);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (394, 143, 10, 39);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (401, 182, 13, 40);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (402, 142, 13, 40);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (403, 135, 13, 40);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (404, 137, 13, 40);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (405, 157, 13, 40);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (406, 152, 13, 40);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (411, 127, 10, 41);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (412, 125, 10, 41);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (413, 125, 10, 41);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (414, 176, 10, 41);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (421, 142, 10, 42);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (422, 185, 10, 42);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (423, 142, 10, 42);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (424, 144, 10, 42);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (425, 145, 10, 42);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (431, 157, 8, 43);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (432, 178, 8, 43);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (433, 168, 8, 43);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (434, 148, 8, 43);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (441, 130, 9, 44);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (442, 150, 9, 44);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (443, 140, 9, 44);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (451, 160, 12, 45);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (452, 170, 12, 45);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (453, 180, 12, 45);
insert into halls (hall_id, seats_num, rows_num, cinema_id) values (454, 131, 12, 45);

SELECT*FROM halls;

--- insert Departments table
insert into departments (department_id, department_name, cinema_id) values (1, 'Product Management', 1);
insert into departments (department_id, department_name, cinema_id) values (2, 'Product Management', 2);
insert into departments (department_id, department_name, cinema_id) values (3, 'Legal', 3);
insert into departments (department_id, department_name, cinema_id) values (4, 'Legal', 4);
insert into departments (department_id, department_name, cinema_id) values (5, 'Research and Development', 5);
insert into departments (department_id, department_name, cinema_id) values (6, 'Engineering', 6);
insert into departments (department_id, department_name, cinema_id) values (7, 'Services', 7);
insert into departments (department_id, department_name, cinema_id) values (8, 'Engineering', 8);
insert into departments (department_id, department_name, cinema_id) values (9, 'Services', 9);
insert into departments (department_id, department_name, cinema_id) values (10, 'Sales', 10);
insert into departments (department_id, department_name, cinema_id) values (11, 'Accounting', 11);
insert into departments (department_id, department_name, cinema_id) values (12, 'Support', 12);
insert into departments (department_id, department_name, cinema_id) values (13, 'Business Development', 13);
insert into departments (department_id, department_name, cinema_id) values (14, 'Accounting', 14);
insert into departments (department_id, department_name, cinema_id) values (15, 'Training', 15);
insert into departments (department_id, department_name, cinema_id) values (16, 'Services', 16);
insert into departments (department_id, department_name, cinema_id) values (17, 'Training', 17);
insert into departments (department_id, department_name, cinema_id) values (18, 'Human Resources', 18);
insert into departments (department_id, department_name, cinema_id) values (19, 'Accounting', 19);
insert into departments (department_id, department_name, cinema_id) values (20, 'Support', 20);
insert into departments (department_id, department_name, cinema_id) values (21, 'Product Management', 21);
insert into departments (department_id, department_name, cinema_id) values (22, 'Product Management', 22);
insert into departments (department_id, department_name, cinema_id) values (23, 'Engineering', 23);
insert into departments (department_id, department_name, cinema_id) values (24, 'Legal', 24);
insert into departments (department_id, department_name, cinema_id) values (25, 'Engineering', 25);
insert into departments (department_id, department_name, cinema_id) values (26, 'Accounting', 26);
insert into departments (department_id, department_name, cinema_id) values (27, 'Business Development', 27);
insert into departments (department_id, department_name, cinema_id) values (28, 'Research and Development', 28);
insert into departments (department_id, department_name, cinema_id) values (29, 'Legal', 29);
insert into departments (department_id, department_name, cinema_id) values (30, 'Accounting', 30);
insert into departments (department_id, department_name, cinema_id) values (31, 'Training', 31);
insert into departments (department_id, department_name, cinema_id) values (32, 'Business Development', 32);
insert into departments (department_id, department_name, cinema_id) values (33, 'Engineering', 33);
insert into departments (department_id, department_name, cinema_id) values (34, 'Research and Development', 34);
insert into departments (department_id, department_name, cinema_id) values (35, 'Research and Development', 35);
insert into departments (department_id, department_name, cinema_id) values (36, 'Business Development', 36);
insert into departments (department_id, department_name, cinema_id) values (37, 'Sales', 37);
insert into departments (department_id, department_name, cinema_id) values (38, 'Product Management', 38);
insert into departments (department_id, department_name, cinema_id) values (39, 'Research and Development', 39);
insert into departments (department_id, department_name, cinema_id) values (40, 'Sales', 40);
insert into departments (department_id, department_name, cinema_id) values (41, 'Support', 41);
insert into departments (department_id, department_name, cinema_id) values (42, 'Human Resources', 42);
insert into departments (department_id, department_name, cinema_id) values (43, 'Research and Development', 43);
insert into departments (department_id, department_name, cinema_id) values (44, 'Training', 44);
insert into departments (department_id, department_name, cinema_id) values (45, 'Business Development', 45);

SELECT*FROM departments;

--- insert Employees table
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (1, 'Fee', 'Rikel', 402780, '07-11-1997', 'Male', 1);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (2, 'Lindi', 'Robertazzi', 300823, '27-07-1995', 'Female', 2);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (3, 'Charlot', 'Philp', 285564, '07-02-1980', 'Female', 3);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (4, 'Melody', 'Cutforth', 305061, '02-07-1987', 'Female', 4);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (5, 'Brear', 'Schaumaker', 330331, '26-05-1980', 'Female', 5);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (6, 'Oates', 'McClenaghan', 89992, '15-01-1997', 'Male', 6);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (7, 'Rollie', 'Ellesmere', 197504, '09-03-1993', 'Male', 7);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (8, 'Horst', 'Shord', 61456, '04-06-1994', 'Male', 8);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (9, 'Marty', 'Vedyashkin', 212513, '31-03-1988', 'Male', 9);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (10, 'Samson', 'Chant', 196496, '17-04-1984', 'Male', 10);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (11, 'Jeannine', 'Kidman', 264246, '12-12-1986', 'Female', 11);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (12, 'Josepha', 'Moran', 100739, '01-04-2001', 'Female', 12);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (13, 'Lenna', 'Phippin', 100980, '03-12-1990', 'Female', 13);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (14, 'Demetre', 'Durrans', 223771, '26-04-1983', 'Male', 14);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (15, 'Vale', 'Grellier', 367054, '11-01-1999', 'Female', 15);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (16, 'Skyler', 'McGillacoell', 365810, '24-07-1995', 'Male', 16);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (17, 'Jason', 'Arnoll', 144955, '16-04-1992', 'Male', 17);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (18, 'Nick', 'Fancourt', 321530, '04-06-1995', 'Male', 18);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (19, 'Chrystel', 'Buye', 321282, '26-02-1979', 'Female', 19);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (20, 'Valeria', 'Clout', 233504, '23-07-1988', 'Female', 20);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (21, 'Maryanne', 'Gately', 190857, '17-01-1987', 'Female', 21);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (22, 'Avigdor', 'Reeder', 139093, '26-11-1983', 'Male', 22);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (23, 'Yelena', 'Berzons', 306103, '28-04-2002', 'Female', 23);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (24, 'Alon', 'Isham', 308389, '18-12-1988', 'Male', 24);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (25, 'Renate', 'Batchan', 309536, '05-10-1994', 'Female', 25);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (26, 'Cleavland', 'Broseke', 178431, '17-07-1998', 'Male', 26);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (27, 'Andeee', 'Happel', 150263, '15-01-2000', 'Female', 27);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (28, 'Burg', 'Bruckner', 233341, '04-07-1990', 'Male', 28);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (29, 'Manolo', 'Sydes', 103980, '20-11-1993', 'Male', 29);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (30, 'Beniamino', 'Patriche', 385940, '07-05-1996', 'Male', 30);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (31, 'Prissie', 'Kenyam', 183112, '22-06-1990', 'Female', 31);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (32, 'Gavrielle', 'Haslock', 52318, '07-07-1988', 'Female', 32);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (33, 'Brigham', 'Trowle', 390629, '23-07-1980', 'Male', 33);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (34, 'Ezri', 'Huygens', 92759, '24-06-1997', 'Male', 34);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (35, 'Valene', 'Windrum', 372455, '02-06-1989', 'Female', 35);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (36, 'Zondra', 'Yarnall', 346154, '23-08-1985', 'Female', 36);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (37, 'Stefano', 'Izkoveski', 103128, '21-08-2003', 'Male', 37);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (38, 'Kelby', 'Whitters', 295562, '05-02-2002', 'Male', 38);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (39, 'Juliane', 'Romei', 107866, '13-12-1994', 'Female', 39);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (40, 'Valentijn', 'Latliff', 67786, '29-11-2001', 'Male', 40);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (41, 'Wynny', 'Bessell', 142486, '20-08-1985', 'Female', 41);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (42, 'Klaus', 'Easson', 371863, '16-12-2001', 'Male', 42);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (43, 'Issy', 'Bontoft', 233843, '05-01-1980', 'Female', 43);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (44, 'Nickolai', 'Downe', 205499, '09-06-2000', 'Male', 44);
insert into employees (employee_id, employee_fname, employee_lname, employee_salary, employee_birth_date, employee_gender, department_id) values (45, 'Odie', 'Fidele', 95876, '01-01-1980', 'Male', 45);

SELECT*FROM employees;

--- insert Movies table
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (1, 'Daddy Day Care', 169, 'Gagauz', 'Children|Comedy', 'Afghanistan', 454);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (2, 'Common Threads: Stories from the Quilt', 123, 'Tajik', 'Documentary', 'Indonesia', 382);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (3, 'Bad Company', 147, 'Gagauz', 'Action|Comedy|Crime', 'Czech Republic', 301);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (4, 'Murphy''s Romance', 107, 'Oriya', 'Comedy|Romance', 'Mexico', 274);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (5, 'Soul of a Man, The', 100, 'Danish', 'Documentary|Musical', 'China', 213);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (6, 'Thief and the Cobbler, The (a.k.a. Arabian Knight)', 161, 'Guaraní', 'Adventure|Animation|Comedy|Fantasy', 'Angola', 322);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (7, 'White Heat', 139, 'Afrikaans', 'Crime|Drama|Film-Noir', 'Guatemala', 133);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (8, 'Front Page, The', 176, 'Albanian', 'Comedy|Drama|Romance', 'France', 131);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (9, 'Altman', 115, 'Malay', 'Documentary', 'Indonesia', 164);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (10, 'Prison', 143, 'Swedish', 'Crime|Drama|Horror|Thriller', 'Portugal', 285);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (11, 'Very Natural Thing, A', 156, 'Pashto', 'Drama', 'Belarus', 451);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (12, 'American Grindhouse', 133, 'Indonesian', 'Documentary', 'United States', 132);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (13, 'Two for the Seesaw', 185, 'Irish Gaelic', 'Drama|Romance', 'United States', 254);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (14, 'Violeta Went to Heaven (Violeta se fue a los cielos)', 103, 'Māori', 'Drama', 'Vietnam', 173);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (15, 'Love Hina Again', 149, 'Yiddish', 'Animation|Comedy|Drama', 'Peru', 423);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (16, 'Where the Trail Ends', 169, 'Lao', 'Adventure|Documentary|Drama', 'Portugal', 414);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (17, 'Safe in Hell', 127, 'Italian', 'Drama', 'United States', 443);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (18, 'Lincz', 115, 'Irish Gaelic', 'Drama|Thriller', 'Indonesia', 264);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (19, 'Deep Sea 3D', 124, 'Latvian', 'Documentary|IMAX', 'Chile', 344);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (20, 'Italian Straw Hat, The (Un chapeau de paille d''Italie)', 92, 'French', 'Comedy', 'Philippines', 143);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (21, 'Swordfish', 122, 'Italian', 'Action|Crime|Drama', 'Kiribati', 175);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (22, 'Digging to China', 132, 'Greek', 'Drama', 'Thailand', 432);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (23, 'F for Fake (Vérités et mensonges)', 143, 'Macedonian', 'Documentary|Mystery', 'Sweden', 312);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (24, 'Where the Sidewalk Ends', 133, 'Japanese', 'Crime|Drama|Film-Noir', 'China', 364);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (25, 'The Halloween That Almost Wasn''t', 165, 'Indonesian', 'Children|Comedy', 'Sweden', 304);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (26, 'Nickelodeon', 102, 'Tsonga', 'Comedy', 'Tajikistan', 192);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (27, 'Luxo Jr.', 101, 'Haitian Creole', 'Animation|Children', 'United Kingdom', 205);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (28, 'Last Remake of Beau Geste, The', 115, 'Khmer', 'Adventure|Comedy', 'Philippines', 373);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (29, 'Beneath the Dark', 92, 'Macedonian', 'Drama|Mystery|Thriller', 'Portugal', 202);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (30, 'Women on the 6th Floor, The (Les Femmes du 6ème Étage)', 137, 'Moldovan', 'Comedy', 'Poland', 354);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (31, 'Levity', 170, 'Korean', 'Drama', 'Sweden', 334);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (32, 'Amores Perros (Love''s a Bitch)', 108, 'Filipino', 'Drama|Thriller', 'United States', 232);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (33, 'Impact', 103, 'German', 'Crime|Drama', 'China', 145);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (34, 'Bannen Way, The', 140, 'Bulgarian', 'Action|Comedy|Crime|Thriller', 'Poland', 332);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (35, 'Shanghai Ghetto', 175, 'Tok Pisin', 'Documentary', 'Netherlands', 363);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (36, '¡Alambrista! (Illegal, The)', 111, 'Burmese', 'Drama', 'Indonesia', 121);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (37, 'Pretty Woman', 148, 'Tamil', 'Comedy|Romance', 'Japan', 181);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (38, 'Burglar', 139, 'Telugu', 'Comedy|Crime', 'Indonesia', 311);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (39, 'Kids Are All Right, The', 141, 'Zulu', 'Comedy|Drama', 'Portugal', 305);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (40, 'Invictus', 143, 'Zulu', 'Drama', 'Albania', 81);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (41, 'Son, The (Le fils)', 170, 'Afrikaans', 'Drama', 'China', 26);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (42, 'West Point Story, The', 140, 'Assamese', 'Comedy|Musical', 'South Africa', 14);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (43, 'Still of the Night', 94, 'Aymara', 'Mystery|Thriller', 'Guatemala', 32);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (44, 'Dear God', 128, 'Gujarati', 'Comedy', 'Burkina Faso', 55);
insert into movies (movie_id, title, duration, language, genre, country, hall_id) values (45, 'Camouflage', 153, 'Ndebele', 'Action|Comedy', 'Brazil', 101);

SELECT*FROM movies;

--- insert Customers table
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (1, 'Lodovico', '87771095082', 'lvero0@etsy.com', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (2, 'Lucho', '87771034322', 'lrawstorn1@trellian.com', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (3, 'Hans', '87023225332', 'hworld2@t-online.de', 'Student');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (4, 'Addy', '87011359825', 'akrikorian3@meetup.com', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (5, 'Alexandre', '87053208002', 'abilney4@topsy.com', 'Student');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (6, 'Georgette', '87056890022', 'gmetham5@ovh.net', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (7, 'Harp', '87751228066', 'hrudderham6@biglobe.ne.jp', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (8, 'Raynard', '87475209804', 'rburdin7@vistaprint.com', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (9, 'Kippie', '87052673435', 'kfern8@ibm.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (10, 'Ferd', '87058965116', 'fteml9@livejournal.com', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (11, 'Barde', '87058160779', 'bcosina@amazon.com', 'Student');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (12, 'Simona', '87753584967', 'smcgrathb@abc.net.au', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (13, 'Rochester', '87029026761', 'rmonikerc@google.co.jp', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (14, 'Alfonse', '87024755307', 'afranzettoinid@chronoengine.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (15, 'Lucia', '87473090955', 'llattiee@themeforest.net', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (16, 'Grazia', '87013492081', 'gnesfieldf@home.pl', 'Student');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (17, 'Webb', '87027306993', 'wfidockg@oracle.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (18, 'Netti', '87474414795', 'nsigfridh@huffingtonpost.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (19, 'Ebonee', '87058449510', 'emcwhorteri@creativecommons.org', 'Student');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (20, 'Loutitia', '87051789054', 'lkikej@newsvine.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (21, 'Zachery', '87022612950', 'zparramorek@geocities.com', 'Student');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (22, 'Gawen', '87756526853', 'gcopcotel@hhs.gov', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (23, 'Gardner', '87754134178', 'giannuzzim@booking.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (24, 'Janka', '87087828470', 'jlipmann@i2i.jp', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (25, 'Idalia', '87085254873', 'istaddono@t-online.de', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (26, 'Daron', '87084536786', 'dtuftp@harvard.edu', 'Student');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (27, 'Jordana', '87081753061', 'jludlemq@squarespace.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (28, 'Marketa', '87088533899', 'mpietersenr@wunderground.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (29, 'Alic', '87783512472', 'adanburys@lycos.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (30, 'Sheila-kathryn', '87471393085', 'skidwellt@kickstarter.com', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (31, 'Leonanie', '87785625009', 'lskamellu@blogs.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (32, 'Corrie', '87028375948', 'chaggarthv@washington.edu', 'Student');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (33, 'Shanta', '87058005001', 'sandrolliw@oakley.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (34, 'Georgi', '87476618884', 'grolinx@slate.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (35, 'Lainey', '87014144900', 'lluttgery@naver.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (36, 'Consalve', '87017116184', 'cguilbertz@ox.ac.uk', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (37, 'Vallie', '87011963468', 'vbeiderbecke10@youtu.be', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (38, 'Bronny', '87018317052', 'bwindybank11@smugmug.com', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (39, 'Jerry', '87012550358', 'jdoole12@nyu.edu', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (40, 'Niko', '87015544690', 'nhurworth13@comcast.net', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (41, 'Sapphire', '87024994770', 'sspurdle14@behance.net', 'Student');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (42, 'Carlee', '87789653359', 'ctrodden15@army.mil', 'Adult');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (43, 'Cirstoforo', '87781605768', 'cmcure16@edublogs.org', 'Child');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (44, 'Janela', '87759481368', 'jcarriage17@aboutads.info', 'Student');
insert into customers (customer_id, customer_name, customer_phone, customer_email, customer_category) values (45, 'Garik', '87754271950', 'ghallan18@wordpress.com', 'Student');

SELECT*FROM customers;

--- insert Schedule table
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 08:09:30', 1, 1);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 13:25:13', 2, 2);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 17:19:24', 3, 3);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 21:16:29', 4, 4);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 06:10:02', 5, 5);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 10:48:30', 6, 6);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 05:08:31', 7, 7);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 09:00:07', 8, 8);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 07:58:07', 9, 9);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 08:14:31', 10, 10);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 23:21:39', 11, 11);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 03:54:14', 12, 12);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 15:48:08', 13, 13);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 22:23:20', 14, 14);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 18:40:13', 15, 15);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 13:07:09', 16, 16);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 20:02:27', 17, 17);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 03:52:58', 18, 18);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 05:12:10', 19, 19);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 16:49:07', 20, 20);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 02:05:50', 21, 21);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 00:55:55', 22, 22);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 17:45:38', 23, 23);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 17:17:29', 24, 24);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 04:59:31', 25, 25);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 05:45:16', 26, 26);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 22:16:48', 27, 27);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 22:01:27', 28, 28);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 01:16:24', 29, 29);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 12:28:10', 30, 30);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 06:12:22', 31, 31);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 15:47:09', 32, 32);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 09:16:25', 33, 33);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 11:23:32', 34, 34);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 12:02:16', 35, 35);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 07:21:27', 36, 36);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 05:03:20', 37, 37);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 17:35:18', 38, 38);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 11:17:31', 39, 39);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 04:56:02', 40, 40);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 05:18:57', 41, 41);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 20:25:56', 42, 42);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 10:43:04', 43, 43);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 19:35:01', 44, 44);
insert into schedule (schedule_time, movie_id, customer_id) values ('14-04-2022 01:44:49', 45, 45);

SELECT*FROM schedule;

--- insert Tickets table
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('3175456790', 2956, 1, 1, 1);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('4179375265', 1575, 2, 2, 2);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('6912877095', 847, 3, 3, 3);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('0597535930', 2343, 4, 4, 4);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('9185100323', 2492, 5, 5, 5);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('7235356375', 1090, 6, 6, 6);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('3397622409', 1778, 7, 7, 7);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('3895836184', 2966, 8, 8, 8);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('8844978334', 2416, 9, 9, 9);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('4942867150', 2488, 10, 10, 10);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('8362617365', 1322, 11, 11, 11);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('5612373856', 1211, 12, 12, 12);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('0513190724', 2985, 13, 13, 13);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('6749921175', 1427, 14, 14, 14);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('6679989086', 1549, 15, 15, 15);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('2508674915', 2443, 16, 16, 16);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('9493196933', 1308, 17, 17, 17);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('5112522828', 2167, 18, 18, 18);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('4143558297', 1511, 19, 19, 19);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('0417362110', 1882, 20, 20, 20);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('4872218809', 2445, 21, 21, 21);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('9737707125', 1251, 22, 22, 22);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('0506239705', 1556, 23, 23, 23);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('1404038620', 2172, 24, 24, 24);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('9277081244', 2337, 25, 25, 25);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('5969845752', 2634, 26, 26, 26);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('0565154060', 1575, 27, 27, 27);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('4190983829', 2467, 28, 28, 28);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('1876513020', 1122, 29, 29, 29);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('2098143451', 2385, 30, 30, 30);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('2354474113', 2142, 31, 31, 31);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('3525582315', 1685, 32, 32, 32);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('9953219451', 1726, 33, 33, 33);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('5683282810', 1733, 34, 34, 34);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('9241599693', 1672, 35, 35, 35);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('4734121273', 2279, 36, 36, 36);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('6941717114', 2768, 37, 37, 37);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('7460139343', 2847, 38, 38, 38);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('2304838553', 2008, 39, 39, 39);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('2107210802', 2779, 40, 40, 40);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('1434868605', 1831, 41, 41, 41);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('8280720219', 2258, 42, 42, 42);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('5682182154', 2271, 43, 43, 43);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('6625597813', 998, 44, 44, 44);
insert into tickets (ticket_id, bill, customer_id, employee_id, movie_id) values ('4904971450', 2385, 45, 45, 45);

SELECT*FROM tickets;

--- insert Booking_online table
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('4849307809', 9, 9, 1, 1);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('3452252809', 14, 11, 2, 2);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('0083226192', 8, 8, 3, 3);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('0902313290', 6, 3, 4, 4);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('8351936189', 11, 5, 5, 5);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('4758766606', 10, 13, 6, 6);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('3990625233', 10, 3, 7, 7);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('5528314089', 12, 9, 8, 8);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('5697614365', 13, 4, 9, 9);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('7188885753', 15, 15, 10, 10);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('5859031696', 1, 7, 11, 11);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('3173271742', 1, 13, 12, 12);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('7123887603', 12, 9, 13, 13);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('7419921377', 12, 9, 14, 14);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('9100228885', 3, 14, 15, 15);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('6509300044', 3, 9, 16, 16);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('8862083351', 5, 4, 17, 17);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('7955446453', 4, 1, 18, 18);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('6893336942', 14, 13, 19, 19);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('4775188852', 11, 15, 20, 20);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('8919128774', 11, 11, 21, 21);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('9583807052', 10, 1, 22, 22);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('8813882432', 1, 10, 23, 23);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('9448734700', 12, 8, 24, 24);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('9166543649', 6, 13, 25, 25);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('8090907377', 11, 15, 26, 26);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('5550547031', 12, 8, 27, 27);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('0298870436', 15, 15, 28, 28);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('9774827929', 6, 12, 29, 29);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('7401271109', 1, 12, 30, 30);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('3086972114', 14, 13, 31, 31);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('3976656208', 5, 13, 32, 32);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('6724400570', 4, 11, 33, 33);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('3850047806', 4, 5, 34, 34);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('1097581373', 13, 13, 35, 35);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('9681759591', 9, 15, 36, 36);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('2674117559', 10, 12, 37, 37);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('0516943472', 6, 7, 38, 38);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('6967344706', 4, 8, 39, 39);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('0435520660', 11, 8, 40, 40);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('9822077440', 11, 10, 41, 41);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('2857381093', 13, 8, 42, 42);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('3848608774', 11, 4, 43, 43);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('1141682095', 4, 8, 44, 44);
insert into booking_online (booking_id, book_seat, book_row, customer_id, movie_id) values ('2316307825', 7, 6, 45, 45);

SELECT*FROM booking_online;

--- insert Payment table
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('8069959827', 2348, 'jcb', '4849307809');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('8486719070', 3226, 'jcb', '3452252809');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('6341136935', 2521, 'switch', '0083226192');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('1567325629', 1803, 'jcb', '0902313290');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('2850225061', 941, 'china-unionpay', '8351936189');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('3723321941', 1775, 'switch', '4758766606');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('3866732759', 2238, 'china-unionpay', '3990625233');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('1216034192', 1461, 'bankcard', '5528314089');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('6717622512', 2194, 'americanexpress', '5697614365');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('9575785940', 2945, 'visa', '7188885753');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('4248673355', 1518, 'americanexpress', '5859031696');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('1705981224', 2803, 'switch', '3173271742');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('2003698566', 2051, 'jcb', '7123887603');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('6757701677', 3013, 'diners-club-enroute', '7419921377');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('2863251171', 2906, 'jcb', '9100228885');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('1669584321', 2332, 'visa', '6509300044');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('9552174848', 1560, 'laser', '8862083351');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('5013610958', 2746, 'maestro', '7955446453');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('4728911373', 1967, 'diners-club-international', '6893336942');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('9939724926', 1649, 'diners-club-enroute', '4775188852');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('4157343409', 1883, 'jcb', '8919128774');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('4868122207', 3136, 'switch', '9583807052');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('4252226074', 1694, 'diners-club-us-ca', '8813882432');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('1719296618', 2469, 'switch', '9448734700');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('2947708318', 942, 'mastercard', '9166543649');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('9275145881', 3427, 'visa', '8090907377');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('8670096625', 2586, 'jcb', '5550547031');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('8191481537', 1338, 'jcb', '0298870436');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('2168597081', 1077, 'jcb', '9774827929');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('2056276518', 1210, 'visa', '7401271109');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('2942429542', 2126, 'switch', '3086972114');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('9896647607', 2410, 'jcb', '3976656208');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('8214934710', 2721, 'visa', '6724400570');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('1157123740', 3154, 'visa', '3850047806');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('9964458444', 1686, 'jcb', '1097581373');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('7834369288', 2261, 'instapayment', '9681759591');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('2574466772', 2882, 'jcb', '2674117559');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('9181167512', 1561, 'solo', '0516943472');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('9703272568', 2474, 'laser', '6967344706');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('4040329880', 832, 'china-unionpay', '0435520660');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('8940606752', 985, 'jcb', '9822077440');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('0125191626', 1368, 'jcb', '2857381093');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('8655988553', 2605, 'laser', '3848608774');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('6849085484', 2593, 'switch', '1141682095');
insert into payment (payment_id, payment_amount, payment_method, booking_id) values ('1701567776', 2264, 'bankcard', '2316307825');

SELECT*FROM payment;

----
----Queries
----
----1. SQL query to get id, full name and salary of employees, who work at department related with Human activity
SELECT employee_id, employee_fname || ' ' || emp.employee_lname AS full_name, employee_salary
FROM employees emp
LEFT JOIN departments d on emp.department_id = d.department_id
WHERE d.department_name LIKE 'Human%';

----2. SQL query to get number of male/female employees working in each department
SELECT employee_gender, department_name, COUNT(*) AS employee_number
FROM employees
INNER JOIN departments d on d.department_id = employees.department_id
GROUP BY
GROUPING SETS (employee_gender), department_name
ORDER BY employee_gender DESC;

----3. SQL query to get employee full name, salary, gender from 15th department and calculate the age using birth date column
SELECT employee_fname || ' ' || employee_lname AS full_name, employee_salary, employee_gender, TRUNC(TO_NUMBER(SYSDATE - TO_DATE(employee_birth_date)) / 365.25) AS AGE
FROM employees
NATURAL JOIN departments
WHERE department_id = 15;

----4. SQL query to get title, duration, language, genre, country, hall id of movie shows
----scheduled between 20:00 and 23:00 in 14th April
SELECT title, duration, language, genre, country, hall_id
FROM movies
LEFT OUTER JOIN schedule s on movies.movie_id = s.movie_id
WHERE schedule_time BETWEEN '14-04-2022 20:00:00' AND '14-04-2022 23:00:00'
ORDER BY schedule_time;

----5. SQL query to get name & address of cinema, title & bill of movie show
----with bill price less than 1500 and duration less than 160 minutes
SELECT title, cinema_name, cinema_address, bill
FROM cinema
INNER JOIN halls h on cinema.cinema_id = h.cinema_id
INNER JOIN movies m on h.hall_id = m.hall_id
INNER JOIN tickets t on m.movie_id = t.movie_id
WHERE bill < 1500 AND duration < 160
ORDER BY bill DESC;

----6. SQL query to get number of movies in unique genres
SELECT DISTINCT(genre), COUNT(movie_id)
FROM movies
GROUP BY genre;

----7. SQL query to get information about 10 cheapest available seats for movies except Murphy's Romance
----customer needs to know cinema name, title of movie, hall_id, available seat, and price
SELECT cinema_name, title, hall_id, book_seat, book_row, payment_amount
FROM booking_online
NATURAL JOIN movies m
NATURAL JOIN payment p
NATURAL JOIN halls h
NATURAL JOIN cinema c
WHERE title NOT LIKE 'Murphy''s Romance'
ORDER BY payment_amount ASC
FETCH FIRST 10 ROWS ONLY;

----8. SQL query to get average bill price for different categories of customers
SELECT customer_category, ROUND(AVG(bill),3)
FROM customers
RIGHT JOIN tickets t on customers.customer_id = t.customer_id
GROUP BY customer_category;

----9. SQL query to get information about maximum, minimum, average and total salary of employees by departments
SELECT department_name, MAX(employee_salary) AS max_salary, MIN(employee_salary) AS min_salary,
       ROUND(AVG(employee_salary), 2) AS average_salary, SUM(employee_salary) AS total_salary
FROM employees
INNER JOIN departments d on d.department_id = employees.department_id
GROUP BY department_name;

----10. SQL query to get information about customers, who bought tickets with bill higher than average bill price
----and we need to know who has served those customers
SELECT ticket_id, customer_name, customer_phone, customer_email, bill, employee_fname
FROM tickets
INNER JOIN customers c on c.customer_id = tickets.customer_id
INNER JOIN employees e on e.employee_id = tickets.employee_id
WHERE bill > (SELECT AVG(bill) FROM tickets);

----
----Procedures AND Functions
----
----1. Procedure that will raise employee's salary. Ask user to enter employee_id.
--If employee is female from Accounting department, then raise salary by 10%. Otherwise rollback.
SELECT employee_id, employee_salary FROM employees
INNER JOIN departments d on employees.department_id = d.department_id
WHERE employee_gender = 'Female' AND department_name = 'Accounting';

CREATE OR REPLACE Procedure raise_salaries(emp_id int)
IS
    dep VARCHAR2(70);
    female VARCHAR2(70);
BEGIN
    SELECT employee_gender INTO female FROM employees 
    WHERE employee_id = emp_id;

    SELECT department_name INTO dep FROM departments
    INNER JOIN employees e on departments.department_id = e.department_id
    WHERE employee_id = emp_id;

    IF (female = 'Female' AND dep = 'Accounting') THEN
        UPDATE employees
        SET employee_salary = employee_salary + (employee_salary * 0.1)
        WHERE employee_id = emp_id;
        
        DBMS_OUTPUT.PUT_LINE('Employee''s salary with id ' || emp_id || ' raised'); 
        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee is not female from accounting department'); 
        ROLLBACK;
    END IF;  
END; 
/

CALL raise_salaries(25);

---2. Function to calculate total salary of all employees
CREATE OR REPLACE FUNCTION total_salary  
RETURN number IS  
   total number;  
BEGIN  
   SELECT SUM(employee_salary) into total  
   FROM employees;  
    
    RETURN total;  
END total_salary;  
/  

DECLARE    
   total number;    
BEGIN    
   total := total_salary();    
   DBMS_OUTPUT.PUT_LINE('Total salary: ' || total);    
END;    
/    

----3. Procedure to find employee under 21 and delete him from cinema db. 
SELECT employee_fname || ' ' || employee_lname AS full_name, employee_salary, employee_gender, TRUNC(TO_NUMBER(SYSDATE - TO_DATE(employee_birth_date)) / 365.25) AS AGE
FROM employees
WHERE TRUNC(TO_NUMBER(SYSDATE - TO_DATE(employee_birth_date)) / 365.25) < 21;

CREATE OR REPLACE Procedure delete_juniors
IS
    adult int;
BEGIN
    SELECT employee_id
    INTO adult
    FROM employees
    WHERE TRUNC(TO_NUMBER(SYSDATE - TO_DATE(employee_birth_date)) / 365.25) < 21
    FETCH FIRST 1 ROWS ONLY;

    DELETE FROM tickets
    WHERE employee_id IN (SELECT employee_id FROM employees WHERE employee_id = adult);

    DELETE FROM employees
    WHERE employee_id IN (SELECT employee_id FROM employees WHERE employee_id = adult);
    
    DBMS_OUTPUT.PUT_LINE('Employee under 21 was deleted from db');
END;
/

CALL delete_juniors();


----4. Function to calculate age of particular employee
CREATE OR REPLACE FUNCTION calculate_age(employeeId NUMBER)
RETURN NUMBER IS 
    age NUMBER;
BEGIN 
    SELECT TRUNC(TO_NUMBER(SYSDATE - TO_DATE(employee_birth_date)) / 365.25) INTO age
    FROM employees WHERE employee_id = employeeId;  
    RETURN age;   
END calculate_age;
/

SELECT employee_fname || ' ' || employee_lname AS full_name, employee_gender, calculate_age(15) AS age
FROM employees
WHERE employee_id = 15;


----5. Procedure that insert new department if it doesn't exist.
CREATE OR REPLACE PROCEDURE insert_dep
   (dep_name IN VARCHAR2)
IS
   dep_id number;
   max_dept number;
   
   CURSOR c1 IS
   SELECT department_id FROM departments
   WHERE department_name = dep_name;
BEGIN
   OPEN c1;
   FETCH c1 INTO dep_id;
   
   SELECT MAX(department_id) + 1 INTO max_dept FROM departments;
    
   IF c1%NOTFOUND THEN
      dep_id := max_dept;
   END IF;
    
    INSERT INTO departments (department_id, department_name, cinema_id) 
    VALUES (dep_id, dep_name, 1);
 
   COMMIT;
 
   CLOSE c1;
END;

CALL insert_dep('Cashiers');

SELECT*FROM departments WHERE department_name = 'Cashiers';

DELETE FROM departments WHERE department_name = 'Cashiers';


