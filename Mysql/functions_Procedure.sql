use project;
delimiter $$
create procedure text(in temp int)
begin
select * from product;
end;
delimiter;

Call text(105);