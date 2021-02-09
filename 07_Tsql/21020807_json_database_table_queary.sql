use sqlDB;
go


-- ���� ���Ǵ� �Լ�
select ROW_NUMBER() over(order by height desc, userName asc)[Űū����],
	   userName, addr , height
  from userTbl;

select rank() over(partition by addr order by height desc)[������ Űū����],
   userName, addr , height
  from userTbl;

select dense_rank() over(order by height desc)[Űū����],
   userName, addr , height
  from userTbl;

select dense_rank() over(partition by addr order by height desc)[������ Űū����],
   userName, addr , height
  from userTbl;



-- �ǹ� ���̺�

create table pivotTBL
(
	userName nvarchar(10),
	season  nvarchar(2),
	amount int
	
);


insert into pivotTBL values
	('�����' , '�ܿ�' , 10), ('������' , '����' , 15), ('�����' , '����' , 25),
	('�����' , '��' , 3), ('�����' , '��' , 37), ('�����' , '�ܿ�' , 40),
	('�����' , '����' , 14), ('�����' , '�ܿ�' , 22), ('�����' , '����' , 64);

select * from pivotTBL;

select * from pivotTBL
pivot (avg(amount)
		for season
			in ([��], [����], [����], [�ܿ�])) as resultPivot



-- json

select userID ,userName , height
  from userTbl
  where height > 180
  for json auto;