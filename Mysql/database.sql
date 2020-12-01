create database project;
use project;

create table Customer (
	customer_id varchar(20) primary key not null,
    email_login varchar(20) not null,
    password_login varchar(20) not null
);
select * from Customer;

create table Custumer_order (
	order_id varchar(20) primary key not null,
    customer_id varchar(20) not null,
    customer_payment_method_id varchar(20) not null,
    date_order_place date not null,
    foreign key(customer_payment_method_id) references customer_payment_method(customer_payment_method_id)
);

create table product (
	product_id varchar(20) primary key not null,
    product_type_code varchar(20) not null,
    product_price int not null
);

select * from customer_payment_method;

create table customer_payment_method (
	customer_payment_method_id varchar(20) primary key not null,
    payment_method_name varchar(20) not null	
); 

drop table product;

create table customer_order_products (
	order_id varchar(20) not null,
    product_id varchar(20) not null,
    quantity int default(1),
    primary key (order_id, product_id),
    comment text
);

insert into customer_payment_method values ("P01", "CAST");
insert into customer_payment_method values ("P02", "CARD");
insert into customer_payment_method values ("P03", "MOMO");

insert into product values ("CAFFEEDA", "D01", 24);
insert into product values ("CAFESUADA", "D01", "28");

select * from product;

