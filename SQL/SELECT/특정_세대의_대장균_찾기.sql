WITH second AS (
    SELECT b.id
    FROM ecoli_data a JOIN ecoli_data b ON a.id = b.parent_id
    WHERE a.parent_id IS NULL
)

SELECT c.id
FROM second b JOIN ecoli_data c ON b.id = c.parent_id
ORDER BY c.id;
