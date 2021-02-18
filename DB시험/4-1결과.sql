begin tran
insert into divtbl values('I002','자기개발서')

rollback
commit

select * from divtbl;