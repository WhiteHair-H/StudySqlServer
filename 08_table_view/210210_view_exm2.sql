
create view uv_buyTbl
as
	select * from buyTbl where groupName = '����'
go


begin tran -- Ʈ������

delete from uv_buyTbl;


rollback;	-- ������ ����

select * from uv_buyTbl
insert into uv_buyTbl values ('KKH' , '��Ÿ', '�Ǳ�',4000, 1)