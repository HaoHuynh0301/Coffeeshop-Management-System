use project;

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
	update product set 
end;
delimiter;
