
create view uv_buyTbl
as
	select * from buyTbl where groupName = '전자'
go


begin tran -- 트랜젝션

delete from uv_buyTbl;


rollback;	-- 원상태 복귀

select * from uv_buyTbl
insert into uv_buyTbl values ('KKH' , '기타', '악기',4000, 1)