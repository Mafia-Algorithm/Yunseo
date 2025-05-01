SELECT a.title, a.board_id, b.reply_id, b.writer_id, b.contents, DATE_FORMAT(b.created_date, '%Y-%m-%d') as created_date
FROM used_goods_board a JOIN used_goods_reply b ON a.board_id = b.board_id
WHERE a.created_date >= '2022-10-01' AND a.created_date <= '2022-10-31'
ORDER BY b.created_date, a.title;

# DATE 타입 비교 시 문자열처럼 사용
WHERE DATE_FORMAT(a.created_date, '%Y-%m') = '2022-10'
WHERE a.created_date BETWEEN '2022-10-01' AND '2022-10-31'
WHERE a.created_date >= '2022-10-01' AND a.created_date <= '2022-10-31'

# 날짜 함수를 사용할 수도 있음 -> 대신 함수를 사용하면 인덱스를 활용하지 못할 수도 있음
WHERE YEAR(a.created_date) = 2022 AND MONTH(a.created_date) = 10
