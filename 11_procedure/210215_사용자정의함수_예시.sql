select *,
		dbo.ufn_getAge(birthYear) as '����',
		dbo.ufn_getZodiac(birthYear) as '��'
	from userTbl;