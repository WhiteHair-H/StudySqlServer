select lower(m.Email) as email
	 , m.Mobile as mobile
	 , m.Names as names
	 , m.Addr as addr
  from membertbl as m
  order by m.Names desc