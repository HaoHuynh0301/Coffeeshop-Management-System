use project;

insert into Discount_Code values ("X01", 1, null, 20, "Pepsi");
insert into Discount_Code values ("T12", 2, 20, null, "Cocacola");
insert into Discount_Code values ("B10", 1, null,  20, "Admin");
insert into Discount_Code values ("BN01", 1, null, 20, "Bonus");

insert into Customer(customer_id, email_login, password_login, point) values ("01", "root", "root", 0);

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
