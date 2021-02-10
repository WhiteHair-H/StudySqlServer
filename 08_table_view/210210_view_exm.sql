use sqlDB;
go

create view uv_userTBL
AS
	select userID, userName, addr from userTBl;
go

select * from uv_userTBL;