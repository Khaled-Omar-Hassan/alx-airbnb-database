SELECT * 
FROM property 
WHERE property_id IN (
	SELECT property_id
	FROM review
	GROUP BY property_id
	HAVING AVG(rating) > 4.0
);

SELECT *
FROM user
WHERE (
    SELECT COUNT(*)
    FROM booking
    WHERE booking.user_id = user.user_id
) > 3;
