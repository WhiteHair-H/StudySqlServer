use sqlDB;
go

select u.userID, 
	u.username,
	iif( sum(price * amount) is null , 0 ,  sum(price * amount)) as 'ÃÑ ±¸¸Å±Ý¾×',
	case
	 when sum(price * amount) >= 1500 then 'VVIP'
	 when sum(price * amount) >= 1000 then 'VIP'
	 when sum(price * amount) >= 1 then 'normal'
	 else 'Ghost'
	end as 'customer Level'
  from buyTbl as b
  right outer join userTbl as u
    on  b.userID = u.userID
  group by u.userID , u.username
  order by  sum(price * amount) desc;



select *
  from userTbl;