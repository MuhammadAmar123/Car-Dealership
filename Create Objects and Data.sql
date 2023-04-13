/*
create schema cars;
go
create schema sales;
go
create table cars.brands (
    brand_id int primary key identity (1,1),
    brand varchar(50) not null
);
create table cars.fuel (
    fuel_id int primary key identity (1,1),
    fuel varchar(6) not null
);
create table cars.transmission (
    transmission_id int primary key identity (1,1),
    transmission varchar(10) not null
)
create table sales.stores (
    store_id int primary key identity (1,1),
    address varchar(255) not null,
    city varchar(20),
    phone_number varchar(15)
);
create table sales.customer (
    customer_id int primary key identity (1,1),
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    phone_number varchar(15) not null,
    address varchar(255) not null,
    email_address varchar(255) unique not null
);
create table cars.cars_model (
	model_id int primary key identity (1,1),
	brand int not null,
	model varchar (50) not null,
	seats int not null check (seats<10),
	engine_size varchar (6) not null,
	transmission varchar not null,
	fuel_type varchar not null,
	drivetrain varchar (3) check (drivetrain in ('4WD', 'AWD', 'FWD', 'RWD')) not null,
	foreign key (brand) references cars.brands(brand_id)
);
create table cars.cars_stock (
	stock_id int primary key identity (1,1),
	model_id int references cars.cars_model(model_id) not null,
	year int check (year <=9999) not null,
	mileage int check (mileage<=999999) not null,
	sold bit not null,
	price money not null,
	store_id int references sales.stores(store_id) not null,
	license_plate varchar(6) unique not null
);
create table sales.staff (
	staff_id int primary key identity (1,1),
	first_name varchar (50) not null,
	last_name varchar (50) not null,
	phone_number varchar (15) not null,
	address varchar (255) not null,
	store_id int references sales.stores(store_id) not null,
	email_address varchar (255) not null,
);
create table sales.sale (
	sale_id int primary key identity (1,1),
	customer_id int references sales.customer(customer_id) not null,
	sale_date date not null
);
create table sales.sale_items (
	sale_items_id int primary key identity (1,1),
	sale_id int references sales.sale(sale_id) not null,
	stock_id int references cars.cars_stock(stock_id) not null
);

alter table cars.fuel
alter column fuel varchar(15);

insert into cars.fuel (fuel)
values
	('Petrol'),
	('Diesel'),
	('Electric'),
	('Hybrid'),
	('Plug-in hybrid');

insert into cars.transmission (transmission)
values
	('Automatic'),
	('Manual');

insert into cars.brands (brand)
values
	('Toyota'),
	('Nissan'),
	('Mazda'),
	('Mitsubishi'), 
	('Subaru'),
	('Honda'), 
	('Holden'),
	('BMW'),
	('Suzuki'),
	('Lexus'),
	('Kia'),
	('Volkswagen'),
	('Ford');

alter table sales.customer
add city varchar (50) not null;
alter table sales.staff
add city varchar (50) not null ;

insert into sales.stores (address, city, phone_number)
values
	('35 Alnack Place', 'Auckland', '026-0925-146'),
	('127 Cumbria Way', 'Hamilton', '027-3648-410'),
	('98 Espin Crescent', 'Wellington', '029-7275-659');

insert into sales.staff (first_name, last_name, phone_number, address, city, email_address, store_id)
values
	('Caleb', 'Nelson', '023-4732-5321', '14 Edmonton Road', 'Auckland', 'swagcaleb101@gmail.com', 1),
	('Joseph','Mower', '026-1769-124', '145 Kaimiro Street', 'Hamilton', 'josephjostar@gmail.com', 2),
    ('Sophie', 'Cameron', '021-123-4567', '20 Beach Road', 'Auckland', 'sophiecameron@gmail.com',1),
    ('Liam', 'Nguyen', '022-234-5678', '7 Campbell Road', 'Hamilton', 'liamnguyen@yahoo.com',2),
    ('Mia', 'Patel', '027-345-6789', '42 Grant Road', 'Wellington', 'miapatel@icloud.com',3),
    ('Noah', 'Wallace', '021-456-7890', '14 Seaview Avenue', 'Auckland', 'noahwallace@outlook.com',1),
    ('Isabella', 'Lowe', '022-567-8901', '28 New Street', 'Hamilton', 'isabellalowe@gmail.com',2),
    ('Lucas', 'Mills', '027-678-9012', '9A Mountain Road', 'Wellington', 'lucasmills@yahoo.com',3),
    ('Ava', 'Graham', '021-789-0123', '5A Bond Srteet', 'Auckland', 'avagraham@icloud.com',1),
    ('Ethan', 'Pearson', '022-890-1234', '32 Horsham Downs Road', 'Hamilton', 'ethanpearson@outlook.com',2),
    ('Charlotte', 'Perry', '027-901-2345', '16A Leslie Road', 'Auckland', 'charlotteperry@gmail.com',1),
    ('Oliver', 'Burton', '021-012-3456', '3 St. Marks Road', 'Wellington', 'oliverburton@yahoo.com',3);

insert into sales.customer (first_name, last_name, phone_number, address, city, email_address)
values
    ('Ethan', 'Nguyen', '022-111-2222', '10 K Road', 'Auckland', 'ethan.nguyen@gmail.com'),
    ('Isabella', 'Gupta', '027-333-4444', '25 Queen Street', 'Auckland', 'isabellagup12@outlook.com'),
    ('Aiden', 'Chen', '021-555-6666', '67 Victoria Street', 'Hamilton', 'aiden.chen@yahoo.com'),
    ('Sophia', 'Patel', '022-777-8888', '95 Willis Street', 'Wellington', 'sophia.patel@icloud.com'),
    ('Jackson', 'Lee', '021-999-0000', '45 Symonds Street', 'Auckland', 'jackson.lee@hotmail.com'),
    ('Amelia', 'Singh', '027-111-2222', '15 Hood Street', 'Hamilton', 'amelia.singh@gmail.com'),
    ('Lucas', 'Wang', '022-333-4444', '39 The Terrace', 'Wellington', 'lucas.wang@gmail.com'),
    ('Harper', 'Kim', '027-555-6666', '33 Albert Street', 'Auckland', 'harper.kim@outlook.com'),
    ('Benjamin', 'Patel', '021-777-8888', '75 Victoria Street', 'Hamilton', 'benjamin.patel@icloud.com'),
    ('Evelyn', 'Chen', '022-999-0000', '22 Willis Street', 'Wellington', 'evelyn.chen@yahoo.com'),
	('Max', 'Garcia', '021-123-4567', '55 Karangahape Road', 'Auckland', 'max.garcia@gmail.com'),
    ('Chloe', 'Nguyen', '022-234-5678', '34 Queen Street', 'Auckland', 'chloe.nguyen@gmail.com'),
    ('Henry', 'Patel', '027-345-6789', '90 Victoria Street', 'Hamilton', 'henry.patel@gmail.com'),
    ('Zoe', 'Lee', '021-456-7890', '10 Willis Street', 'Wellington', 'zoe.lee@gmail.com'),
    ('Leo', 'Singh', '022-567-8901', '40 K Road', 'Auckland', 'leo.singh@yahoo.com'),
    ('Aria', 'Wang', '027-678-9012', '20 Hood Street', 'Hamilton', 'aria.wang@yahoo.com'),
    ('Mason', 'Kim', '021-789-0123', '5 Victoria Street', 'Wellington', 'mason.kim@yahoo.com'),
    ('Emma', 'Chen', '022-890-1234', '123 Dominion Road', 'Auckland', 'emma.chen@yahoo.com'),
    ('Liam', 'Gupta', '027-901-2345', '78 George Street', 'Wellington', 'liam.gupta@icloud.com'),
    ('Ava', 'Wilson', '021-012-3456', '30 Symonds Street', 'Auckland', 'ava.wilson@icloud.com'),
	('Abigail', 'Campbell', '022-456-7890', '30 Wroxton Terrace', 'Christchurch', 'abigailcampbell@yahoo.com'),
    ('Daniel', 'Evans', '027-567-8901', '74 Oceanview Road', 'Auckland', 'danielevans@icloud.com');

insert into cars.cars_model (brand, model, seats, engine_size, transmission, fuel_type, drivetrain)
values
	(1, 'Corolla', 5, '1600cc', 1, 1, 'FWD'),
	(3, 'CX-5', 5, '2500cc', 1, 1, 'AWD'),
	(4, 'Lancer', 5, '1500cc', 1, 1, 'FWD'),
	(5, 'Impreza', 5, '2000cc', 2, 1, 'AWD'),
	(6, 'Civic', 5, '1800cc', 1, 1, 'FWD'),
	(7, 'Commodore', 5, '3000cc', 1, 1, 'RWD'),
	(8, '3 Series', 5, '2000cc', 1, 1, 'RWD'),
	(9, 'Swift', 5, '1300cc', 1, 1, 'FWD'),
	(10, 'LS', 5, '4000cc', 1, 1, 'RWD'),
	(11, 'Sportage', 5, '2000cc', 1, 1, 'AWD'),
	(12, 'Golf', 5, '1600cc', 2, 1, 'FWD'),
	(13, 'Falcon', 5, '4000cc', 1, 1, 'RWD'),
	(1,  'Camry', 5, '2500cc', 1, 4, 'FWD'),
	(2, 'Navara', 5, '2500cc', 2, 2, '4WD'),
	(3, '6', 5, '2000cc', 1, 1, 'FWD'),
	(4, 'Outlander', 7, '2400cc', 1, 1, 'AWD'),
	(5, 'Forester', 5, '2500cc', 1, 1, 'AWD'),
	(6, 'Accord', 5, '2200cc', 1, 1, 'FWD'),
	(7, 'Astra', 5, '1600cc', 2, 1, 'FWD'),
	(8, '5 Series', 5, '3000cc', 1, 1, 'RWD'),
	(9, 'Vitara', 5, '1600cc', 1, 1, 'FWD'),
	(12, 'Touareg', 5, '3000cc', 1, 2, 'AWD'),
	(13, 'Focus', 5, '2000cc', 2, 1, 'FWD'),
	(1, 'Prius', 5, '1800cc', 1, 4, 'FWD'),
	(1, 'Alphard', 7, '2400cc', 1, 1, 'FWD'),
	(1, 'Camry', 5, '3000cc', 1, 1, 'FWD'),
	(2, 'Leaf', 5, '0cc', 1, 3, 'FWD'),
	(7, 'Cruze', 5, '1800cc', 1, 1, 'FWD'),
	(7, 'Colorado', 5, '2800cc', 2, 2, '4WD'),
	(3, 'CX-5', 5, '2000cc', 1, 1, 'AWD'),
	(3, 'Axela', 5, '1500cc', 1, 1, 'FWD'),
	(10, 'IS 250', 5, '2500cc', 1, 1, 'FWD'),
	(1, 'Wish', 7, '1800cc', 1, 1, 'FWD'),
	(1, 'RAV4', 5, '2500cc', 1, 1, 'AWD'),
	(1, 'Aqua', 5, '1500cc', 1, 4, 'FWD'),
	(1, 'Prius', 5, '1800cc', 1, 5, 'FWD'),
	(1, 'GT86', 4, '2000cc', 2, 1, 'RWD');

insert into cars.cars_stock(model_id, year, mileage, sold, price, store_id, license_plate)
values 
	(1, 2012, 130000, 0, 7500, 1, 'GML785'),
	(13, 2012, 70000, 0, 16000, 2, 'PRE560'),
	(24, 2014, 90000, 1, 15500, 3, 'NKA38'),
	(24, 2009, 150000, 0, 12000, 1, 'EUI242'),
	(24, 2016, 120000, 0, 20000, 1, 'PNH963'),
	(25, 2010, 140000, 1, 17000, 3, 'THY246'),
	(33, 2007, 130000, 1, 6500, 1, 'MFS302'),
	(33, 2011, 100000, 0, 11000, 2, 'WER111'),
	(34, 2015, 135000, 1, 16000, 3, 'GNC765'),
	(35, 2015, 75000, 1,  14000, 2, 'UWU293'),
	(2, 2019, 120000, 1, 27000, 1, 'EUW622'),
	(5, 2013, 130000, 0, 10000, 2, 'REI21'),
	(6, 2010, 98000, 1, 9000, 3, 'JGN146'),
	(7, 2014, 32000, 0, 23000, 2, 'NDC621'),
	(6, 2013, 64000, 1, 12000, 3, 'PRA427'),
	(9, 2013, 148000, 1, 16000, 1, 'GUW178'),
	(10, 2019, 42500, 1, 25000, 1, 'MKH56'),
	(10, 2015, 85000, 0, 20000, 2, 'PSE956'),
	(11, 2013, 125000, 1, 7000, 2, 'MKS86'),
	(12, 2007, 140000, 0, 15000, 1, 'HES69'),
	(27, 2014, 69000, 1, 16000, 1, 'NBM263'),
	(27, 2013, 47000, 0, 15000, 2, 'ERU249'),
	(15, 2016, 125000, 1, 17000, 3, 'KTU591'),
	(16, 2007, 167000, 1, 10000, 1, 'CWI194'),
	(16, 2012, 155000, 0, 11000, 2, 'IWW051'),
	(17, 2019, 59000, 0, 35000, 1, 'LZH189'),
	(17, 2014, 40000, 1, 20000, 3, 'IYE573'),
	(18, 2008, 93000, 1, 13000, 2, 'KJF910'),
	(18, 2012, 110000, 0, 12500, 1, 'YEO49'),
	(21, 2016, 120000, 1, 10000, 1, 'NSD200'),
	(21, 2019, 74000, 0, 18000, 3, 'CND670'),
	(23, 2016, 90000, 1, 19000, 2, 'JWC668'),
	(23, 2015, 87000, 1, 18000, 1, 'JHS582'),
	(24, 2007, 160000, 1, 8000, 3, 'LKQ354'),
	(24, 2011, 135000, 1, 16000, 2, 'GBL394'),
	(28, 2012, 30000, 0, 15000, 3, 'CNS571'),
	(28, 1997, 85000, 0, 5000, 2, 'BQF795'),
	(29, 2015, 55000, 1, 13000, 1, 'VNS842'),
	(30, 2017, 80000, 0, 30000, 3, 'EUQ894'),
	(31, 2015, 60000, 0, 11000, 2, 'HWP617'),
	(34, 2010, 95000, 0, 10000, 1, 'NJD842'),
	(36, 2014, 72000, 0, 17000, 1, 'NGB282'),
	(36, 2018, 40000, 0, 35000, 2, 'LTN398'),
	(37, 2012, 100000, 0, 25000, 3, 'NVJ511');

insert into sales.sale (customer_id, sale_date) 
values
    (1, '2018-03-28'),
    (2, '2018-05-30'),
    (3, '2018-08-12'),
    (4, '2018-10-18'),
    (5, '2019-02-06'),
    (6, '2019-05-09'),
    (7, '2019-06-21'),
    (8, '2019-07-15'),
    (9, '2019-08-01'),
    (10, '2019-09-27'),
    (11, '2019-10-05'),
    (12, '2019-12-31'),
    (13, '2020-03-20'),
    (14, '2020-04-14'),
    (15, '2021-03-09'),
    (16, '2021-05-26'),
    (17, '2021-07-03'),
    (18, '2022-01-05'),
    (19, '2022-02-16'),
    (20, '2022-04-10'),
    (21, '2022-06-14'),
    (22, '2022-07-07');

insert into sales.sale_items (sale_id, stock_id)
values
	(1, 3),
	(2, 6),
	(3, 7),
	(4, 9),
	(5, 10),
	(6, 11),
	(7, 13),
	(8, 15),
	(9, 16),
	(10, 17),
	(11, 19),
	(12, 21),
	(13, 23),
	(14, 24),
	(15, 27),
	(16, 28),
	(17, 30),
	(18, 32),
	(19, 33),
	(20, 34),
	(21, 35),
	(22, 38);

CREATE PROCEDURE SelectAllCustomers @City varchar(30)
AS
SELECT * FROM sales.customer WHERE city = @City;
GO
create procedure calcsold
as
select sum(price) as total_made
from cars.cars_stock
where sold = 1;
go
*/
