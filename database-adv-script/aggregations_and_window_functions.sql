SELECT user.user_id, COUNT(user.user_id)
FROM USER INNER JOIN booking ON user.user_id = booking.user_id
GROUP BY user.user_id;

SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM booking
GROUP BY property_id;
