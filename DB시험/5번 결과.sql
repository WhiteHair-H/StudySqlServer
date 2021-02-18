select d.Names , sum(b.Price) as 총합계금액
  from bookstbl as b
  inner join divtbl as d
  on b.Division = d.Division
  group by rollup (d.Names)