
/*
select memberID,memberName
from memberTbl
where memberID like 'H%';
*/

--select '1';

-- use를 통해서 데이터베이스 선택 가능
use BikeStores;

--select * from sales.customers;


--select * from production.products;

--DB 조회
--exec sp_helpdb;

--테이블 조회
--exec sp_tables @table_type = "'TABLE'";

exec sp_columns @table_owner = 'production',
				@table_name = 'stocks';

