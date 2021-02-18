select m.Names
	 , m.Levels
	 , m.Addr
	 , r.rentalDate
  from membertbl as m
  left outer join rentaltbl as r
  on m.Idx = r.memberIdx
  where r.rentalDate is null
  