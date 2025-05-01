SELECT a.rest_id, a.rest_name, a.food_type, a.favorites, a.address, ROUND(AVG(b.review_score), 2) as score
FROM rest_info a JOIN rest_review b ON a.rest_id = b.rest_id
WHERE a.address LIKE '서울%'
GROUP BY a.rest_id
ORDER BY score DESC, a.favorites DESC;
