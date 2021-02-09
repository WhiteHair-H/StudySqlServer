select * from sales.orders -- 주문내역
select * from sales.staffs -- 스태프 직원
select * from sales.customers -- 고객정보
select * from sales.order_items -- 주문물품정보
select * from sales.stores -- 상점



select ss.store_name, order_date
  from sales.stores as ss
  inner join sales.orders as so
  on so.store_id = ss.store_id
  order by ss.store_name


select so.customer_id, so.email, so.city
  from sales.customers as so
  left outer join sales.orders as ss
  on so.customer_id = ss.customer_id


select so.customer_id, ss.order_date
  from sales.customers as so
  full outer join sales.orders as ss
  on so.customer_id = ss.customer_id



select s.id, s.stdName, c.clubName, c.buildingNum
  from stdTbl1 as s
 inner join stdClubTBL1 as r
    on s.id = r.std_id
 inner join clubTbl1 as c
    on r.club_id = c.id
