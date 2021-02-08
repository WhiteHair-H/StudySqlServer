use tempdb;
go

-- �̸��� ���ȣ�λ��
select * from userTbl
where userName = '���ȣ';

-- Ű�� 182 �̻��̰� 1970�� ���� ���, ���̵�� �̸� ��ȸ / ������
select userId, userName, height, birthYear
	from userTbl 
	where birthYear >= 1970
	and height >= 182
	
	
-- Ű�� 182 �̻��̰ų� 1970�� ���� ���, ���̵�� �̸� ��ȸ / ������ / �ǹ����� ���� ������ ����
select userId, userName, height, birthYear
	from userTbl 
	where birthYear >= 1970
	or height >= 182


-- Ű�� 180 ~ 183������ ����� ��ȸ
select userId, userName, height
	from userTbl 
	where height between 180 and 183;

-- �泲, ����, ����� ��� ��ȸ
select userName, addr
	from userTbl 
	where addr in ('�泲', '����', '���');

--  ���� �达�� ��� ��ȸ
select userName
	from userTbl 
	where userName like '��%';

-- �̸��� ������ ��� ��ȸ
	select userName
	from userTbl 
	where userName like '_����';


-- ��������
select userName, height
from userTbl 
where height > 177;

--���ȣ�� Ű���� ū ����� �̾ƶ�
select userName, height
from userTbl 
where height >
(	select height
	from userTbl
	where userName = '���ȣ'
);


--�ּҰ� �泲�� ���

select userName, height, addr
from userTbl 
where height >=any
(	select height
	from userTbl
	where addr = '�泲'
);

select userName, height, addr
from userTbl 
where height >=all
(	select height
	from userTbl
	where addr = '�泲'
);

select userName, height, addr
from userTbl 
where height in
(	select height
	from userTbl
	where addr = '�泲'
);

-- order by ����
select userName , mDate
  From userTbl
  order by mDate desc;

  select *
  From userTbl
  order by height desc;

-- distinct
select distinct addr
  from userTbl;

select top(5) *
  from userTbl
  order by mDate desc;


-- offset �ռ� ������ŭ �پ���� �� ��ȸ
select userID, userName, birthYear
from userTbl 
order by birthYear 

select userID, userName, birthYear
from userTbl 
order by birthYear 
offset 4 ROWS;




-- select into ����
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTbl;



-- group by
select userID [����� ID], sum(amount)  '�� ���� ����'
from buyTbl 
group by userID;

select userID [����� ID], count(prodName)  '��ǰ ����'
from buyTbl 
group by userID;


-- min,max
select min(height) as 'Ű�۳�'
  from userTbl;

  select max(height) as 'Űū��'
  from userTbl;

  select userID, userName ,min(height) as 'Ű�۳�' ,  max(height) as 'Űū��'
  from userTbl
  group by userID, userName


  select userID, userName
    from userTbl 
   where height = (select min(height) from userTbl)
      or height = (select max(height) from userTbl)

-- �� ������ ����
select count(*) as 'ȸ����'  from userTbl;
select count(*) as '���ų�����' from buyTbl;
