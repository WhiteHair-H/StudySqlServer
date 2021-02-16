use sqlDB;
go

create or alter trigger trg_BackupUserTbl
on userTbl
after update, delete
as
		declare @modType nchar(2)

		if (COLUMNS_UPDATED() > 0) -- 업데이트
			begin
				set @modType = '수정'
			end
		else -- 삭제
			begin
				set @modType = '삭제'
			end

		insert into backup_userTbl
			select [userID],[username],[birthYear],[addr],[mobile1],[mobile2],
				   [height] ,[mDate] , @modType ,GETDATE() ,USER_NAME() from deleted;

go