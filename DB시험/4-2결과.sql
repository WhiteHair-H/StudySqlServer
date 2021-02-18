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