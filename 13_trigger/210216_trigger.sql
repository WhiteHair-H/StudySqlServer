use sqlDB;
go

create or alter trigger trg_testtbl
on testtbl
after insert, delete, update -- ����, ���� Ʈ���� �߻�
as
	print '�� Ʈ���� �۵�'


insert into testTbl values ('BTS');
select * from testTbl where txt = '������'
update testTbl set txt = '��������' where id = 4
delete testTbl  where id = 4