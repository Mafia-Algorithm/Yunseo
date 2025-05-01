WITH percent AS (
    SELECT id, PERCENT_RANK() OVER (ORDER BY size_of_colony DESC) * 100 as p
    FROM ecoli_data
)

SELECT id, 
    CASE WHEN p <= 25 THEN 'CRITICAL'
    WHEN p <= 50 THEN 'HIGH'
    WHEN p <= 75 THEN 'MEDIUM'
    ELSE 'LOW'
    END as colony_name
FROM percent
ORDER BY id;
