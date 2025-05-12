Results before indexing (full table scan):
![ScreenShot](before.png)  

CREATE INDEX idx_booking_start_date ON booking(start_date);
CREATE INDEX idx_property_location ON property(location);
CREATE INDEX idx_property_price ON property(pricepernight);


Results before indexing (rel - relies on index):
![ScreenShot](after.png)
