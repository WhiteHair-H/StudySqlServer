use sqlDB;
go

declare cur_userTbl cursor global
	for select userName, height from userTbl;

open cur_userTbl;

declare @userName nchar(8) -- ȸ���̸�
declare @height smallint -- ���� Ű
declare @cnt int = 0 -- �ο���
declare @totalHeight int = 0 -- Ű�� �հ�

fetch next from cur_userTbl into @userName, @height; -- Ŀ�� ���� �о ������ �Ҵ�

while @@FETCH_STATUS = 0
begin

set @cnt += 1
set @totalHeight += @height
print concat('ȸ�� : ', @userName, ' Ű : ', @height);
fetch next from cur_userTbl into @userName, @height;
end

print concat('ȸ�� Ű ���-->' , @totalHeight / @cnt)

close cur_userTbl;