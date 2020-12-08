use project;

delimiter $$
create procedure text(in temp int)
begin
select * from product;
end;
delimiter;

call text(1);
delimiter $$
create function edit_product_infor_function(pro_id varchar(20), 
									new_price int, 
                                    new_product_name varchar(20))
return int;
begin
	if (new_price!=0 && !new_product_name!='') then
		if (new_price=0) then
			update product set product_id=new_product_name where product_id=pro_id;
            return 1;
		elseif (new_product_name='') then
			update product set product_price=new_price where product_id=pro_id;
            return 1;
		else 
			update product set product_price=new_price and product_id=new_product_name where product_id=pro_id;
            return 1;
		end if;
    end if;
    		return 0;
delimiter;

-- Prodedure Admin Edit Product
delimiter $$
create procedure edit_product_infor(in pro_id varchar(20), 
									in new_price int, 
                                    in new_product_name varchar(20))
begin
	if (new_price!=0 && !new_product_name!='') then
		if (new_price=0) then
			update product set product_id=new_product_name where product_id=pro_id;
		elseif (new_product_name='') then
			update product set product_price=new_price where product_id=pro_id;
		else 
			update product set product_price=new_price and product_id=new_product_name where product_id=pro_id;
		end if;
    end if;
end;
delimiter;

Call edit_product_infor("DenDa", 25, "");

