use sqlDB;
go


-- 많이 사용되는 함수
select ROW_NUMBER() over(order by height desc, userName asc)[키큰순위],
	   userName, addr , height
  from userTbl;

select rank() over(partition by addr order by height desc)[지역별 키큰순위],
   userName, addr , height
  from userTbl;

select dense_rank() over(order by height desc)[키큰순위],
   userName, addr , height
  from userTbl;

select dense_rank() over(partition by addr order by height desc)[지역별 키큰순위],
   userName, addr , height
  from userTbl;



-- 피벗 테이블

create table pivotTBL
(
	userName nvarchar(10),
	season  nvarchar(2),
	amount int
	
);


insert into pivotTBL values
	('김범수' , '겨울' , 10), ('윤종신' , '여름' , 15), ('김범수' , '가을' , 25),
	('김범수' , '봄' , 3), ('김범수' , '봄' , 37), ('김범수' , '겨울' , 40),
	('김범수' , '여름' , 14), ('김범수' , '겨울' , 22), ('김범수' , '여름' , 64);

select * from pivotTBL;

select * from pivotTBL
pivot (avg(amount)
		for season
			in ([봄], [여름], [가을], [겨울])) as resultPivot



-- json

select userID ,userName , height
  from userTbl
  where height > 180
  for json auto;