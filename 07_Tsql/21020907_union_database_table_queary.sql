-- union
select clubName as bName, buildingNum as bLoction from clubTbl1
union
select stdName , region from stdTbl1;

-- union all
select stdName , region from stdTbl1
union all
select stdName , region from stdTbl1;

-- except
select stdName , region from stdTbl1
except
select stdName , region from stdTbl1;