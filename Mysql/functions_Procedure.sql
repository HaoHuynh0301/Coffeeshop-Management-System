use project;

-- Procedure Insert (Admin Mode)
delimiter $$
create procedure insert_product(in pro_price int, in pro_type_code varchar(20), in pro_id varchar(20))
begin
	insert into product values(pro_id, pro_type_code, pro_price);
end;
delimiter;

-- Procedure Reduce (Admin Mode)
delimiter $$
create procedure reduce_product(in pro_id varchar(20))
begin
	delete from product where product.product_id=pro_id;
end; 
delimiter;

-- Procedure Edit product infor (Admin Mode)
delimiter $$
create procedure edit_product_infor(in pro_id varchar(20), in pro_price int, in pro_new_name varchar(20))
begin
	update product set product.product_id=pro_new_name, product.product_price=pro_price where product.product_id=pro_id;
end;
delimiter;

-- Procedure Update Favorite product

select * from Customer;

delimiter $$
create procedure add_favorite(in pro_id varchar(20), in cus_id varchar(20))
begin
	update Customer set favorite_product_id=pro_id where customer_id=cus_id;
end;
delimiter;

-- Procedure Login
delimiter $$
create procedure login(in email varchar(20), in pass varchar(20))
	Select * from Customer where email_login=email and password_login=pass;
begin
end;
delimiter;

-- Procedure insert to Customer_order table
delimiter $$
create procedure insert_customer_orderid(in order_id varchar(20), in cus_id varchar(20), in payment_id varchar(20), in date_input date)
begin
	insert into Custumer_order values(order_id, cus_id, payment_id, date_input);
end;
delimiter;

-- Trigger add point
select * from data_history;

drop trigger project.add_point;

delimiter $$
create trigger add_point 
after insert on custumer_order
for each row
begin
	insert into data_history(temp_customer_id) values (NEW.customer_id);
end;
delimiter;

select * from customer;
update customer set point=1 where customer_id="01";

delimiter $$
create trigger add_point_event
after insert on data_history
for each row
begin
	update customer set customer.point=customer.point+1 where customer.customer_id=NEW.temp_customer_id;
end;
delimiter;











