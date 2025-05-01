# 집계함수는 NULL 제외, COUNT(*)은 NULL 포함, COUNT(b.id)는 null은 포함하지 않아서 0개로 처리
SELECT a.id, COUNT(b.id) as child_count
FROM ecoli_data a LEFT JOIN ecoli_data b ON a.id = b.parent_id
GROUP BY a.id
ORDER BY a.id;
