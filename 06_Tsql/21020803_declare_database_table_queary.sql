
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

-- 소수점을 이용해 평균 표현
select convert(float,amount) as amount from buyTbl; 
select avg(convert(float,amount)) as '평균구매개수' from buyTbl;

select price, amount, price/amount as [단가/수량] from buyTbl;

select TRY_CONVERT(float,amount) as amount from buyTbl; 

-- '1000' --> 숫자
select PARSE('2021년 2월 9일' as date);

-- try를 넣을 경우 null값을 반환함
select try_PARSE('2021년 2월 9일' as date);

select parse('123.45' as int);
select try_PARSE('123.45' as int);




-- 스칼라 함수
select GETDATE() as [현재날짜];

select year(GETDATE()) as '금년';
select month(GETDATE()) as '이번달';
select day(GETDATE()) as '오늘';

select abs(-106);

select ROUND(3.1415, 3);
select ROUND(1234.5678, -2);

select cast((RAND() * 100)  as int) ;

select IIF(100 > 200 , '맞다', '틀리다');

-- 문자열 함수
-- 많이 사용되지 않음
select ASCII('a') , ASCII('H');
select CHAR(15) , CHAR(55);
select UNICODE('s');
select NCHAR(45990);

-- 많이 사용되는 함수
-- 문자열 결합
select CONCAT(' ','SQL ', 'server ', 2019);

-- 문자열 시작위치 리턴
select CHARINDEX('server' , 'sql server 2019')

select LEFT('sql server 2019',3) , RIGHT('sql server 2019', 4);

-- substring
select SUBSTRING('Hello WOrld!', 7, 5);
select SUBSTRING('반갑습니다 이따다키마스', 7, 6);

--len
select len('반갑습니다 이따다키마스');

--lower, upper
select LOWER('abcdEF'), UPPER('abcdEF')

-- ltrim ,rtrim
select len(LTRIM('  Hello World  ')) ,
	   len(RTRIM('  Hello World  ')),
	   len(TRIM('  Hello World  '));

select REPLACE('sql server 2019' , '2019' , '2016');



-- 많이 사용되는 함수
select FORMAT(GETDATE(), ''); -- 기본
select FORMAT(GETDATE(), 'dd/mm/yy');
select FORMAT(GETDATE(), 'yyyy-MM-dd hh:mm:ss');
select FORMAT(GETDATE(), '');
select FORMAT(GETDATE(), '');
select FORMAT(GETDATE(), '');



