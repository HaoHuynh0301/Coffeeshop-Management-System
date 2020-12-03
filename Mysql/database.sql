create database project;
use project;
	
create table Discount_Code (
	code varchar(20) primary key not null,
    discount_type int not null,
    percent_discount int,
    discount_value int,
    company_name varchar(20)
);

drop table Discount_code;
select * from Discount_code;
insert into Discount_Code values ("X01", 1, null, 20, "Pepsi");
insert into Discount_Code values ("T12", 2, 20, null, "Cocacola");

create table Customer (
	customer_id varchar(20) primary key not null,
    email_login varchar(20) not null,
    password_login varchar(20) not null,
    favorite_product_id varchar(20),
    point int,
    foreign key(favorite_product_id) references product(product_id)
);

update Customer set favorite_product_id="DenSuaDaSpecial" where customer_id="01";
delete from Customer where customer_id="01";
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
select * from product where product_id="dwehduew";

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
select * from customer_order_products;

insert into Customer(customer_id, email_login, password_login) values ("01", "root", "root");
insert into customer_payment_method values ("P01", "CAST");
insert into customer_payment_method values ("P02", "CARD");
insert into customer_payment_method values ("P03", "MOMO");
insert into product values ("DenDa", "A1", 20);
insert into product values ("DenSuaDa", "A1", "24");
insert into product values ("DenSuaDaSpecial", "A1", "28");
insert into product values ("CoffeeLatte", "A1", "28");
insert into product values ("MochaLatte", "A1", "28");
insert into product values ("CreamyCoffee", "A1", "28");
insert into product values ("DoubleChoco", "A2", "32");
insert into product values ("ChocoMint", "A2", "30");
insert into product values ("ChocoBerry", "A2", "28");
insert into product values ("MintCookies", "A3", "30");
insert into product values ("MySweetie", "A3", "32");
insert into product values ("Mr.Oreo", "A3", "25");
insert into product values ("ChocoMinz", "A3", "29");
insert into product values ("MachaCookies", "A3", "32");
insert into product values ("TraOLongSua", "A4", "28");
insert into product values ("TraTao", "A4", "28");
insert into product values ("TraDao", "A4", "28");
insert into product values ("TraDenMachiato", "A4", "30");
insert into product values ("TraDaoTac", "A4", "30");

delete from product where product_id="csdc";
select * from product;

