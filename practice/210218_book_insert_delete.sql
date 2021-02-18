-- 데이터 입력
insert into booksTBL 
(
	cateIdx,
	bookName,
	author,
	company,
	releaseDate,
	ISBN,
	price
) 
values
(
	'N0002',
	'순수하지 않은 감각',
	'요안나',
	'로코코',
	'2019-10-02',
	'9791135445705',
	12500
	
);


-- book 테이블 설명, 등록일자 수정
begin tran
update booksTBL 
   set descriptions = '부명그룹의 브레인이자 핵심 TF팀 리더, 강태욱 수석.
교육자 부모 아래서 보수적이고 모범적으로 자랐지만,
원하는 건 무조건 손에 넣어야 하는 집요한 남자.
그런 그를 자꾸 낯선 충동에 시달리게 하는 여자가 나타났다.
그녀는 바로 협력사 KJ 신기주 대표의 유능한 비서, '
	 , regDate = '2021-02-18'
 where bookIdx = 12

rollback
commit


select *
  from booksTBL;



-- 카테고리 입력
insert into cateTBL values ('I0001','대화/협상')

begin tran
insert into cateTBL values ('I0002','성공/처세'),
						   ('I0003','시간관리');

select * from cateTBL

rollback
commit

begin tran

delete cateTBL where cateIdx ='I0003'

delete cateTBL where cateIdx in ('I0001','I0002')



rollback
commit