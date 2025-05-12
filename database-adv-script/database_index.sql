CREATE INDEX idx_booking_start_date ON booking(start_date);
CREATE INDEX idx_property_location ON property(location);
CREATE INDEX idx_property_price ON property(pricepernight);

EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 42 ORDER BY booking_date DESC;
