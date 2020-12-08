create database project;
use project;
	
create table Discount_Code (
	code varchar(20) primary key not null,
    discount_type int not null,
    percent_discount int,
    discount_value int,
    company_name varchar(20)
);

select * from Discount_Code;

create table Customer (
	customer_id varchar(20) primary key not null,
    email_login varchar(20) not null,
    password_login varchar(20) not null,
    favorite_product_id varchar(20),
    point int,
    foreign key(favorite_product_id) references product(product_id)
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

select * from product;

create table customer_payment_method (
	customer_payment_method_id varchar(20) primary key not null,
    payment_method_name varchar(20) not null	
); 

create table customer_order_products (
	order_id varchar(20) not null,
    product_id varchar(20) not null,
    quantity int default(1),
    primary key (order_id, product_id),
    comment text
);




