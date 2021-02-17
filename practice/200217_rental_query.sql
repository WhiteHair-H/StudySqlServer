
-- 실제 회원 불러오기 레벨 거꾸로, 이름순
select memberID, memberName, levels, mobile, email
  from memberTBL
  where levels <> 'S'
  order by levels desc ,memberName asc 

-- 책정보
select cateIdx , bookName , author, interpreter, company, price
  from booksTBL
  order by price desc;

select *
  from cateTBL;


-- 시스템 함수 사용 쿼리
select memberID,
	   concat(right(memberName, 2), ', ' ,left(memberName, 1)) as 미국식이름,
	   case levels
			when 'A' then '골드회원'
			when 'B' then '실버회원'
			when 'C' then '브론즈회원'
			when 'D' then '철회원'
			when 'S' then '관리자' 
			else '비회원'
	   end as 등급, 
	   concat(SUBSTRING(mobile,1,3),'-' ,SUBSTRING(mobile,4,4),'-',SUBSTRING(mobile,5,4)) as mobile, -- 전화번호 (-) 넣어보기 
	   upper(email) as 이메일
  from memberTBL
  where levels <> 'S'
  order by levels asc ,memberName asc 


--사용자 정의 함수사용 쿼리
  select memberID,
	   concat(right(memberName, 2), ', ' ,left(memberName, 1)) as 미국식이름,
	   dbo.ufn_getLevel(levels) as '회원레벨',
	   mobile, -- 전화번호 (-) 넣어보기 
	   upper(email) as 이메일
  from memberTBL
  where levels <> 'S'
  order by levels asc ,memberName asc 


-- 사용자 레벨 리턴 함수 생성
--create or alter function ufn_getLevel
--(@levels char(1))
--returns nvarchar(5)
--as
--begin
-- declare @result nvarchar(5); -- 골드회원, 실버회원, 브론즈회원, 철회원
-- set @result = case @levels
--				when 'A' then '골드회원'
--				when 'B' then '실버회원'
--				when 'C' then '브론즈회원'
--				when 'D' then '철회원'
--				when 'S' then '관리자' 
--				else '비회원'
--				end ;
--	return @result;
--end
--go

--책 정보, 시스템 함수 , 포맷 함수 쿼리
SELECT bookIdx
     , cateIdx
     , CONCAT(N'책제목 > ',bookName) as bookName
     , author
     , isnull(interpreter, '(역자없음)') as interpreter
     , company
     , format(releaseDate, 'yyyy년 MM월 dd일') as 출판일
     , format(price, '#,#.0원') as 가격
  FROM booksTBL


-- 책 정보 조인
SELECT b.bookIdx
      --,b.cateIdx
	  ,c.cateName
      ,b.bookName
      ,b.author
      ,b.interpreter
      ,b.company
  FROM booksTBL as b
  inner join cateTBL as c
  on b.cateIdx = c.cateIdx;
  
-- 대여된 책의 정보 쿼리 조언 - inner join
SELECT r.rentalIdx
      --,r.memberIdx
	  ,m.memberName
      --,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy년 MM월 dd일') as 대여일
      ,format(r.returnDt, 'yyyy년 MM월 dd일') as 반납일
      ,dbo.ufn_getState(r.rentalState) as 대여상태
  FROM dbo.rentalTBL as r
  inner join booksTBL as b
  on r.bookIdx = b.bookIdx
  inner join memberTBL as m
  on r.memberIdx = m.memberIdx

-- 책을 빌리지않은 사람들 조회 - outer join
SELECT r.rentalIdx
      --,r.memberIdx
	  ,m.memberName
      --,r.bookIdx
	  ,b.bookName
	  ,b.author
      ,format(r.rentalDt, 'yyyy년 MM월 dd일') as 대여일
      ,dbo.ufn_getState(r.rentalState) as 대여상태
  FROM dbo.rentalTBL as r
  left outer join booksTBL as b
  on r.bookIdx = b.bookIdx
  right join memberTBL as m
  on r.memberIdx = m.memberIdx
  where r.rentalIdx is null
  order by rentalIdx desc

-- 우리 책 대여점에 없는 소설장르
select c.cateIdx
	 , c.cateName
	 , b.bookName
  from cateTBL as c
  left outer join booksTBL as b
  on c.cateIdx = b.cateIdx
  where b.bookName is null 



select *
  from memberTBL;

select *
  from rentalTBL;

select m.memberName , m.mobile , b.bookName , 
	   case r.rentalState
	   when '1' then '대여중'
	   when '2' then '반납'
	   when '3' then '연체'
	   when '4' then '분실'
	  end as 현재상황
  from memberTBL as m
  inner join rentalTBL as r
  on m.memberIdx = r.memberIdx
  inner join booksTBL as b
  on r.bookIdx = b.bookIdx