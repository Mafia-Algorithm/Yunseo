WITH skill AS (
    SELECT name, code
    FROM skillcodes
    WHERE name IN ('Python', 'C#')
)

# join을 하면 python과 c#을 모두 할 줄 아는 2개의 행이 되므로 중복 제거 필요
SELECT DISTINCT a.id, a.email, a.first_name, a.last_name
FROM developers a JOIN skill b ON a.skill_code & b.code = b.code
ORDER BY id;
