select b.Idx
	 , CONCAT(N'제목 : ',b.Names) as Names
	 , CONCAT(N'저자 > ', b.Author) as Author
	 , format( b.ReleaseDate , 'yyyy년 MM월 dd일') as 출판일
	 , b.ISBN
	 , format(b.Price, '#,#0원') as 가격
  from bookstbl as b
  order by idx desc
  