use sqlDB;
go

create or alter procedure usp_ifelse
	@userName nvarchar(10)

as
	declare @birthYear int; -- ����⵵ ���� ����
	select @birthYear = birthYear
	  from userTbl
	  where userName = @userName;

	  if (@birthYear >= 1980)
			begin
				print '���� ������'
			end

	  else
			 begin
				print '���̰� �����ϳ׿�'
			 end
go

exec usp_ifelse '�̽±�'