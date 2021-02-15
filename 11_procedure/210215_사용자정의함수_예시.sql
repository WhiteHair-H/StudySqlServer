select *,
		dbo.ufn_getAge(birthYear) as '³ªÀÌ',
		dbo.ufn_getZodiac(birthYear) as '¶ì'
	from userTbl;