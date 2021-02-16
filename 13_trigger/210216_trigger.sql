use sqlDB;
go

create or alter trigger trg_testtbl
on testtbl
after insert, delete, update -- 삭제, 수정 트리거 발생
as
	print '새 트리거 작동'


insert into testTbl values ('BTS');
select * from testTbl where txt = '마마무'
update testTbl set txt = '마마무뉴' where id = 4
delete testTbl  where id = 4