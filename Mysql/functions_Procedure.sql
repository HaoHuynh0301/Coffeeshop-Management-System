use project;

-- Procedure Insert (Admin Mode) 1
delimiter $$
create procedure insert_product(in pro_price int, in pro_type_code varchar(20), in pro_id varchar(20))
begin
	insert into product values(pro_id, pro_type_code, pro_price);
end;
delimiter;

-- Procedure Reduce (Admin Mode) 2
delimiter $$
create procedure reduce_product(in pro_id varchar(20))
begin
	delete from product where product.product_id=pro_id;
end; 
delimiter;

-- Procedure Edit product infor (Admin Mode) 3
delimiter $$
create procedure edit_product_infor(in pro_id varchar(20), in pro_price int, in pro_new_name varchar(20))
begin
	update product set product.product_id=pro_new_name, product.product_price=pro_price where product.product_id=pro_id;
end;
delimiter;

-- Procedure Update Favorite product 4

select * from Customer;

delimiter $$
create procedure add_favorite(in pro_id varchar(20), in cus_id varchar(20))
begin
	update Customer set favorite_product_id=pro_id where customer_id=cus_id;
end;
delimiter;

-- Procedure Login 5
delimiter $$
create procedure login(in email varchar(20), in pass varchar(20))
	Select * from Customer where email_login=email and password_login=pass;
begin
end;
delimiter;

-- Procedure insert to Customer_order table 6
delimiter $$
create procedure insert_customer_orderid(in order_id varchar(20), in cus_id varchar(20), in payment_id varchar(20), in date_input date)
begin
	insert into Custumer_order values(order_id, cus_id, payment_id, date_input);
end;
delimiter;

-- Trigger add point 7

delimiter $$
create trigger add_point 
after insert on custumer_order
for each row
begin
	insert into data_history(temp_customer_id) values (NEW.customer_id);
end;
delimiter;

delimiter $$ -- 8
create trigger add_point_event
after insert on data_history
for each row
begin
	update customer set customer.point=customer.point+1 where customer.customer_id=NEW.temp_customer_id;
end;
delimiter;

-- Procedure insesrt new user 9
delimiter $$
create procedure sign_up(in cus_id varchar(20), in email_login varchar(20), in pass_login varchar(20))
begin
	insert into customer(customer_id, email_login, password_login) values(cus_id, email_login, pass_login);
end;
delimiter;

-- Procedure get customer point 10
delimiter $$
create procedure get_point(in cus_id varchar(20))
begin
	select * from customer where customer.customer_id=cus_id;
end;
delimiter;

-- Procedure update point 11
delimiter $$
create procedure update_point(in cus_id varchar(20))
begin
	UPDATE customer SET customer.point=0 WHERE customer_id=cus_id;
end;
delimiter;

-- Procedure insert into customer order product 12
delimiter $$
create procedure insert_customer_order_products(in temp_order_id varchar(20), in pro_id varchar(20), in pro_quantity int, in temp_comment text)
begin
	insert into customer_order_products values(temp_order_id, pro_id, pro_quantity, temp_comment);
end;
delimiter;


-- 10 procedures
-- 2 triggers





