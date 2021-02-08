use tempdb;
go

-- 이름이 김경호인사람
select * from userTbl
where userName = '김경호';

-- 키가 182 이상이고 1970년 이후 출생, 아이디와 이름 조회 / 교집합
select userId, userName, height, birthYear
	from userTbl 
	where birthYear >= 1970
	and height >= 182
	
	
-- 키가 182 이상이거나 1970년 이후 출생, 아이디와 이름 조회 / 합집합 / 실무에서 많이 쓰이지 않음
select userId, userName, height, birthYear
	from userTbl 
	where birthYear >= 1970
	or height >= 182


-- 키가 180 ~ 183사이인 사람만 조회
select userId, userName, height
	from userTbl 
	where height between 180 and 183;

-- 경남, 전남, 경북인 사람 조회
select userName, addr
	from userTbl 
	where addr in ('경남', '전남', '경북');

--  성이 김씨인 사람 조회
select userName
	from userTbl 
	where userName like '김%';

-- 이름이 종신인 사람 조회
	select userName
	from userTbl 
	where userName like '_종신';


-- 서브쿼리
select userName, height
from userTbl 
where height > 177;

--김경호의 키보다 큰 사람을 뽑아라
select userName, height
from userTbl 
where height >
(	select height
	from userTbl
	where userName = '김경호'
);


--주소가 경남인 사람

select userName, height, addr
from userTbl 
where height >=any
(	select height
	from userTbl
	where addr = '경남'
);

select userName, height, addr
from userTbl 
where height >=all
(	select height
	from userTbl
	where addr = '경남'
);

select userName, height, addr
from userTbl 
where height in
(	select height
	from userTbl
	where addr = '경남'
);

-- order by 정렬
select userName , mDate
  From userTbl
  order by mDate desc;

  select *
  From userTbl
  order by height desc;

-- distinct
select distinct addr
  from userTbl;

select top(5) *
  from userTbl
  order by mDate desc;


-- offset 앞선 갯수만큼 뛰어넘은 후 조회
select userID, userName, birthYear
from userTbl 
order by birthYear 

select userID, userName, birthYear
from userTbl 
order by birthYear 
offset 4 ROWS;




-- select into 복사
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTbl;



-- group by
select userID [사용자 ID], sum(amount)  '총 구매 개수'
from buyTbl 
group by userID;

select userID [사용자 ID], count(prodName)  '제품 개수'
from buyTbl 
group by userID;


-- min,max
select min(height) as '키작남'
  from userTbl;

  select max(height) as '키큰남'
  from userTbl;

  select userID, userName ,min(height) as '키작남' ,  max(height) as '키큰남'
  from userTbl
  group by userID, userName


  select userID, userName
    from userTbl 
   where height = (select min(height) from userTbl)
      or height = (select max(height) from userTbl)

-- 총 데이터 개수
select count(*) as '회원수'  from userTbl;
select count(*) as '구매내역수' from buyTbl;
