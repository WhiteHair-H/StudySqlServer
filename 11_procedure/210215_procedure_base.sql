use sqlDB;
go

-- 프로시져 생성
create procedure usp_users
as
SELECT userID,userName, birthYear FROM userTbl;
go

-- 프로시져 수정
alter procedure usp_users
as
SELECT userID,userName, birthYear FROM userTbl;
go

-- 프로시저 생성 또는 수정을 동시에
create or alter procedure usp_users
as
SELECT userID,userName, birthYear FROM userTbl;
go

exec usp_users;