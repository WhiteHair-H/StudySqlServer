use sqlDB;
go

create or alter trigger trg_BackupUserTbl
on userTbl
after update, delete
as
		declare @modType nchar(2)

		if (COLUMNS_UPDATED() > 0) -- ������Ʈ
			begin
				set @modType = '����'
			end
		else -- ����
			begin
				set @modType = '����'
			end

		insert into backup_userTbl
			select [userID],[username],[birthYear],[addr],[mobile1],[mobile2],
				   [height] ,[mDate] , @modType ,GETDATE() ,USER_NAME() from deleted;

go