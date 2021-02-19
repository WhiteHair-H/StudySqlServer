--1-1번 문항
select lower(m.Email) as email
	 , m.Mobile as mobile
	 , m.Names as names
	 , m.Addr as addr
  from membertbl as m
  order by m.Names desc




--1-2번 문항
select b.Names as names
     , b.Author as author
	 , b.ReleaseDate as releaseDate 
	 , b.Price as price
  from bookstbl as b;




--2-1번 문항
select top(10) concat(right(m.Names, 2), ', ' , LEFT(m.Names,1)) as 변경이름
	 , m.Levels as levels
	 , left(m.Addr, 2) as 도시
	 , lower(m.Email) as 이메일 
  from membertbl as m
  





--2-2번 문항
select b.Idx
	 , CONCAT(N'제목 : ',b.Names) as Names
	 , CONCAT(N'저자 > ', b.Author) as Author
	 , format( b.ReleaseDate , 'yyyy년 MM월 dd일') as 출판일
	 , b.ISBN
	 , format(b.Price, '#,#0원') as 가격
  from bookstbl as b
  order by idx desc
  






--3-1번 문항
select b.Idx as 번호
	  ,b.Division as 장르번호
	  ,d.Names as 장르
	  ,b.Names as 책제목
	  ,b.Author as 저자
  from bookstbl as b
  inner join divtbl as d
  on b.Division = d.Division
  where b.Division = 'B002'

-- 3-1번 문항 다르게 푸는 방법 1
select b.Idx  번호
	  ,b.Division  '장르 번호'
	  ,d.Names  장르
	  ,b.Names  책제목
	  ,b.Author  저자
  from bookstbl  b, divtbl  d
  where b.Division = d.Division
  and b.Division = 'B002'

-- 3-1번 문항 다르게 푸는 방법 2
select b.Idx as 번호
	  ,b.Division as 장르번호
	--,d.Names as 장르
	  , (select Names from divtbl where Division = b.Division) as 장르
	  ,b.Names as 책제목
	  ,b.Author as 저자
  from bookstbl as b
  where b.Division = 'B002'
  


--3-2번 문항
select m.Names
	 , m.Levels
	 , m.Addr
	 , r.rentalDate
  from membertbl as m
  left outer join rentaltbl as r
  on m.Idx = r.memberIdx
  where r.rentalDate is null
 


--3-2번 서브쿼리문
select m.Names
	 , m.Levels
	 , m.Addr
	 , null as rentalDate
  from membertbl as m
  where m.Idx not in (select memberIdx from rentaltbl as r)



--4-1번 문항

begin tran
insert into divtbl values('I002','자기개발서')

rollback
commit

select * from divtbl;



-- 4-2번 문항
select *
  from membertbl
  where Names = '성명건'


begin tran
update membertbl
   set Addr = '부산시 해운대구'
      ,Mobile = '010-6683-7732'
 where Names = '성명건'

rollback
commit



-- 5번 문항
select d.Names , sum(b.Price) as 총합계금액
  from bookstbl as b
  inner join divtbl as d
  on b.Division = d.Division
  group by rollup (d.Names)
  
-- 5번 문항 다르게 풀기
select (select names from divtbl where Division =  a.Division) as names
			  ,a.sum_price
		from
		(select Division , sum(Price) as sum_price
				  from bookstbl
				  group by Division) as a
union all
select null, sum(price)
  from bookstbl
