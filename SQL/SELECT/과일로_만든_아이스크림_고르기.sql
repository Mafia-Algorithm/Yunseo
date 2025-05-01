SELECT a.flavor
FROM first_half a JOIN icecream_info b ON a.flavor = b.flavor
WHERE a.total_order > 3000 AND b.ingredient_type = 'fruit_based'
ORDER BY a.total_order DESC;
