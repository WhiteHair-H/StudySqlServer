--exec sp_helpdb;

use sqlDB;
go

declare @sql varchar(100);
set @sql = 'SELECT * FROM userTbl WHERE userID = ''EJW'' ';
exec (@sql);