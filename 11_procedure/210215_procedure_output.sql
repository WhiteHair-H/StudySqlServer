USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 오후 2:11:50 ******/

create or ALTER   procedure usp_users4
		@txtValue nvarchar(10),
		@outValue int output -- output - return 해주는 파라미터
as
	insert into testTbl values (@txtValue);
	select @outValue = IDENT_CURRENT('testTbl') -- testTbl의 현재 identity 값 리턴
go

declare @myvalue int;
exec usp_users4 '테스트값2', @myvalue output;

print concat('현재 입력된 값은 --> ', @myvalue);
select @myvalue









