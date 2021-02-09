
select * 
from userTbl where userID = 'JYP';
select * from buyTbl where userID = 'JYP';

select * from buyTbl where userID = 'BBK'


-- inner join (내부조인)
select *
  from buyTbl
  inner join userTbl
  on buyTbl.userID =  userTbl.userID
  where buyTbl.userID = 'JYP'


select u.username, u.addr,
	   CONCAT(u.mobile1, '-' , left(u.mobile2,4), '-', right(u.mobile2,4)) as mobile,
	   b.prodname, b.amount, b.price
  from buyTbl as b
  inner join userTbl as u
  on b.userID =  u.userID
  where b.userID = 'JYP'

-- standard sql 
select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl1 as s
 inner join stdClubTBL1 as r
    on s.id = r.std_id
 inner join clubTbl1 as c
    on r.club_id = c.id


-- inner join 약식 / 실무에서 더 자주 사용됨 (SQL Server T-SQL)
select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl1 as s, stdClubTBL1 as r ,clubTbl1 as c
  where s.id = r.std_id
  and r.club_id = c.id


 -- outer join(외부 조인)
 select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl1 as s
 left outer join stdClubTBL1 as r
    on s.id = r.std_id
 left outer join clubTbl1 as c
    on r.club_id = c.id
	


-- userTbl / buyTbl

select u.username, u.addr, b.prodname , b.price 
  from userTbl as u
inner join buyTbl as b
    on u.userID = b.userID;

select u.username, u.addr, b.prodname , b.price 
  from userTbl as u
left outer join buyTbl as b
    on u.userID = b.userID;

select u.username, u.addr, b.prodname , b.price 
  from userTbl as u
right outer join buyTbl as b
    on u.userID = b.userID;

--테이블 3개  outer join
select * 
  from stdTbl1 as s
  left outer join stdClubTBL1 as r
	on s.id = r.std_id
  full outer join clubTbl1 as c
    on r.club_id = c.id

select * 
  from stdTbl1 as s
  left outer join stdClubTBL1 as r
	on s.id = r.std_id


select * 
  from stdClubTBL1 as r
  right outer join clubTbl1 as c
	on  r.std_id = c.id