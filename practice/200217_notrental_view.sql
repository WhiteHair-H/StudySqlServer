create view notRental_view
as
select isnull(r.rentalIdx, '0') as 대여아이디
   --, r.memberIdx
	 , m.memberName
   --, r.bookIdx
	 , isnull(b.bookName, '없음' ) as 책이름
     , isnull(format(r.rentalDt, 'yyyy-MM-dd'), '없음') as 대여날짜
     , isnull(format(r.returnDt, 'yyyy-MM-dd'), '미반납') as 반납날짜
     , dbo.ufn_getState(r.rentalState) as 대여상태
  from rentalTBL as r
  right outer join memberTBL as m
  on r.memberIdx = m.memberIdx
  left outer join booksTBL as b
  on b.bookIdx = r.bookIdx
  where r.rentalIdx is null
go

select *
  from notRental_view