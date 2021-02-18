create or alter view rental_view
as
  select r.rentalIdx
   --, r.memberIdx
	 , m.memberName
   --, r.bookIdx
   --, b.cateIdx
	 , c.cateName 
	 , b.bookName
     , format(r.rentalDt, 'yyyy-MM-dd') as 대여날짜
     , isnull(format(r.returnDt, 'yyyy-MM-dd'), '미반납') as 반납날짜
     , dbo.ufn_getState(r.rentalState) as 대여상태
  from rentalTBL as r
  inner join memberTBL as m
  on r.memberIdx = m.memberIdx
  inner join booksTBL as b
  on b.bookIdx = r.bookIdx
  inner join cateTBL as c
  on c.cateIdx = b.cateIdx


select rv.memberName, rv.대여상태
  from rental_view as rv
  where rv.memberName like '하%'
  order by rv.memberName asc