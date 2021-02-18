select concat(right(m.Names, 2), ', ' , LEFT(m.Names,1)) as 변경이름
	 , m.Levels as levels
	 , left(m.Addr, 2) as 도시
	 , lower(m.Email) as 이메일 
  from membertbl as m;