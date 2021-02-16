use sqlDB;
go

declare cur_userTbl cursor global
	for select userName, height from userTbl;

open cur_userTbl;

declare @userName nchar(8) -- 회원이름
declare @height smallint -- 고객의 키
declare @cnt int = 0 -- 인원수
declare @totalHeight int = 0 -- 키의 합계

fetch next from cur_userTbl into @userName, @height; -- 커서 값을 읽어서 변수에 할당

while @@FETCH_STATUS = 0
begin

set @cnt += 1
set @totalHeight += @height
print concat('회원 : ', @userName, ' 키 : ', @height);
fetch next from cur_userTbl into @userName, @height;
end

print concat('회원 키 평균-->' , @totalHeight / @cnt)

close cur_userTbl;