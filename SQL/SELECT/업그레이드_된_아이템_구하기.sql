# item_a -> item_b 업그레이드, item_a: item_b의 부모 / 부모가 없는 아이템: roo
WITH next_item AS (
    SELECT b.item_id
    FROM item_info a JOIN item_tree b ON a.item_id = b.parent_item_id
    WHERE a.rarity = 'RARE'
)

SELECT b.item_id, b.item_name, b.rarity
FROM next_item a JOIN item_info b ON a.item_id = b.item_id
ORDER BY b.item_id DESC;
