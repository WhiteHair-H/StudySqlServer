
use sqlDB;

-- 변수 선언
declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(10,6);
declare @myVar4 char(20);

-- 변수에 값 설정
set @myVar1 = 165165;
set @myVar2 = 32000;
set @myVar3 = 3.14;
set @myVar4 = '가수 이름==>     '

-- 변수 확인
select @myVar1 as '값';
select @myVar2 + @myVar3;
select @myVar4, userName from userTBL where height > 180;

declare @myVar5 tinyint ;
set @myVar5 = 5;

select top(@myVar5) userName, height from userTbl order by height desc
