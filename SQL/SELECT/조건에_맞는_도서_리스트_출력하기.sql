SELECT book_id, DATE_FORMAT(published_date, '%Y-%m-%d') as published_date
FROM book
WHERE published_date LIKE '2021%' AND category = '인문'
ORDER BY published_dat

# date 타입의 범위를 확인하는 방법
YEAR(published_date) = '2021'
DATE_FORMAT(published_date, '%Y') = '2021'
