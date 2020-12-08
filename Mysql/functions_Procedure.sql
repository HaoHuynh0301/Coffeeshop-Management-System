use project;
delimiter $$
create procedure text(in temp int)
begin
select * from product;
end;
delimiter;

Call text(105);

delimiter $$
create function delete_by_id(product_id varchar(20))
returns int
reads sql data
begin
	declare result int default 1;
    delete from product where product.product_id=product_id;
    return result;
end;
delimiter;


