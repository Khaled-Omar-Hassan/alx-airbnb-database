SELECT user.first_name, user.last_name, start_date, end_date, total_price, status
FROM booking 
INNER JOIN user ON user.user_id = booking.user_id;

SELECT user.first_name, user.last_name, start_date, end_date, total_price, status
FROM booking LEFT JOIN user on user.user_id = booking.user_id;

SELECT *
FROM booking
LEFT JOIN user ON user.user_id = booking.user_id

UNION

SELECT *
FROM booking
RIGHT JOIN user ON user.user_id = booking.user_id;
