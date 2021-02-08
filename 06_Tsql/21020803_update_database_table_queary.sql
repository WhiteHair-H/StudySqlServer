use sqlDB;
go

--DML 중 select
select * from testTBL1;

--DML 중 insert
insert into testTBL1 values (1, '홍길동', 25);
insert into testTBL1(id, userName) values (2, '설현');
insert into testTBL1 (id, age) values (30, 4);

insert into testTBL1 values ('성시경', 44);

exec sp_help 'testTBL1'

-- 현재 identity 마지막 값이 어딘지 나타내줌
select IDENT_CURRENT('testTBL1')

-- 데이터베이스 위치가 달라도 다른 데이터베이스를 가져올 수 있음
select * from BikeStores.sales.order_items;

select * from ShopDB.dbo.memberTbl;


-- sale.order_items 테이블 복사
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL);


insert into sales_order_items
select * from BikeStores.sales.order_items;

select * from sales_order_items


-- update

select * from testTBL1;

update testTBL1
	set userName = '성수경',
	age = 30
	--where id = 33;

-- delete
delete testTBL1 where id = 33;



select * from BikeStores.sales.customers;


	
