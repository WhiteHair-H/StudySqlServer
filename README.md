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












