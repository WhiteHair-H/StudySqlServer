# StudySqlServer
SQL 리포지토리

## 예시
- 0시부터 23시까지 시간대별 입양 건수
- animal_outs -> 7 ~ 19
- time 가상테이블 생성후 아우터 조인

```sql
with recursive time as (
    -- 초기sql
    select 0 h
    
    -- 
    union all
    
    -- 반복할 sql(반복을 멈출 where절 포함)
    select h + 1 from time where h < 23
)
SELECT h , count(hour(datetime)) COUNT
from time 
left outer join animal_outs
on (h = hour(datetime))
group by h
```

- REGEXP 연산자는 LIKE보다 복잡한 패턴을 검색 할때 사용한다.
- SELECT [필드명] FROM [테이블명] WHERE [필드명] REGEXP '특정 문자열|특정 문자열2';
- [참조](https://lollolzkk.tistory.com/44)


```sql
SELECT animal_id , name , sex_upon_intake
from animal_ins
where name regexp "ucy|Ella|Pickle|Rogan|Sabrina|Mitty"
order by animal_id
```

- regexp는 문자열 내부에 어떤 부분이든 해당 정규식이 존재한다면 True
- 정규식으로 사용하려면 아래와 같이 시작과 끝 정확히 

정규식
```sql
SELECT animal_id , name , sex_upon_intake
from animal_ins
where name regexp "^(Lucy|Ella|Pickle|Rogan|Sabrina|Mitty)$"
order by animal_id
```


- 문자열 치환

```sql
SELECT animal_id , name , 
case when sex_upon_intake 
like "%Neutered%" or 
sex_upon_intake like "%Spayed%"
    then 'O'
    else 'X' end as '중성화'
from animal_ins
order by animal_id
```

- 서브쿼리 사용 및 날짜 연산

```sql
select c.animal_id , c.name
from (
    SELECT b.animal_id 
         , b.name 
    --     , b.datetime as 보호시작 
    --     , a.datetime as 입양 
         , datediff(a.datetime,b.datetime) as 보호기간
    from animal_outs as a
    inner join animal_ins as b
        On a.animal_id = b.animal_id
)c
order by c.보호기간 desc
limit 2
```

- 날짜 포맷
- %y, %Y 대소문자에 따라서 결과값달

```sql
SELECT animal_id 
     , name 
     , date_format(datetime , "%Y-%m-%d")  '날짜'
from animal_ins
```






