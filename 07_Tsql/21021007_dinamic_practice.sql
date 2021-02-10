declare @curDate date;
declare @curYear varchar(4) ,@curMonth varchar(2), @curDay varchar(2) ,@sql varchar(2000)

set @curDate = GETDATE();
set @curYear= YEAR(@curDate);
set @curMonth = MONTH(@curDate);
set @curDay = DAY(@curDate);

print @curYear
print replicate ('0', 2 - len(@curMonth) )+ @curMonth
print right(('00' + @curMonth) ,2);
print format(@curDate, 'yyyy-MM-dd'); -- 力老 浆款规过
print @curDay

set @sql = 'create table backup_' + format(@curDate, 'yyyy_MM_dd');
set @sql += '(id int not null primary key, bNam nvarchar(100) not null);';
print @sql;
--exec(@sql);
 