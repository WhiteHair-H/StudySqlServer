use sqlDB;
go

-- ���ν��� ����
create procedure usp_users
as
SELECT userID,userName, birthYear FROM userTbl;
go

-- ���ν��� ����
alter procedure usp_users
as
SELECT userID,userName, birthYear FROM userTbl;
go

-- ���ν��� ���� �Ǵ� ������ ���ÿ�
create or alter procedure usp_users
as
SELECT userID,userName, birthYear FROM userTbl;
go

exec usp_users;