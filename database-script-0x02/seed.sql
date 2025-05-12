-- ##########################################
-- Sample Data for Airbnb Clone Database (MySQL Compatible)
-- ##########################################

-- 1. Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
  ('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice.johnson@gmail.com', 'hashed_pw_1', '+14155552601', 'guest', '2025-01-10 09:15:00'),
  ('22222222-2222-2222-2222-222222222222', 'Robert', 'Miller', 'rob.miller@hostbnb.com', 'hashed_pw_2', '+14155552602', 'host', '2025-01-11 10:20:00'),
  ('33333333-3333-3333-3333-333333333333', 'Sophia', 'Nguyen', 'sophia.nguyen@yahoo.com', 'hashed_pw_3', '+14155552603', 'guest', '2025-01-12 11:25:00'),
  ('44444444-4444-4444-4444-444444444444', 'David', 'Lee', 'david.lee@rentalsite.com', 'hashed_pw_4', '+14155552604', 'host', '2025-01-13 12:30:00'),
  ('55555555-5555-5555-5555-555555555555', 'Fatima', 'Khan', 'fatima.khan@adminmail.com', 'hashed_pw_5', '+14155552605', 'admin', '2025-01-14 13:35:00');

-- 2. Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Rustic Cabin Retreat', 'A peaceful getaway in the mountains with wood-fired hot tub.', 'Asheville, NC', 85.00, '2025-02-01 08:00:00', '2025-02-15 09:00:00'),
  ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', '22222222-2222-2222-2222-222222222222', 'Modern City Loft', 'Spacious loft with skyline views in the downtown district.', 'New York, NY', 150.00, '2025-02-05 10:00:00', '2025-02-16 11:00:00'),
  ('ccccccc3-cccc-cccc-cccc-cccccccccc3', '44444444-4444-4444-4444-444444444444', 'Oceanfront Bungalow', 'Private bungalow steps from the beach with full amenities.', 'Malibu, CA', 225.00, '2025-02-10 14:00:00', '2025-02-20 15:00:00');

-- 3. Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
  ('ddddddd4-dddd-dddd-dddd-dddddddddddd', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-03-01', '2025-03-04', 255.00, 'confirmed', '2025-02-20 16:00:00'),
  ('eeeeeee5-eeee-eeee-eeee-eeeeeeeeeeee', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', '33333333-3333-3333-3333-333333333333', '2025-03-10', '2025-03-12', 300.00, 'pending', '2025-02-22 17:00:00'),
  ('fffffff6-ffff-ffff-ffff-ffffffffffff', 'ccccccc3-cccc-cccc-cccc-cccccccccc3', '11111111-1111-1111-1111-111111111111', '2025-04-01', '2025-04-06', 1125.00, 'canceled', '2025-02-25 18:00:00');

-- 4. Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
  ('99999991-9999-9999-9999-999999999991', 'ddddddd4-dddd-dddd-dddd-dddddddddddd', 255.00, '2025-02-21 12:00:00', 'credit_card'),
  ('99999992-9999-9999-9999-999999999992', 'eeeeeee5-eeee-eeee-eeee-eeeeeeeeeeee', 300.00, '2025-02-23 13:00:00', 'paypal');

-- 5. Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
  ('77777777-7777-7777-7777-777777777777', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Beautiful cabin—super clean and cozy. Would stay again!', '2025-03-06 10:00:00'),
  ('88888888-8888-8888-8888-888888888888', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', '33333333-3333-3333-3333-333333333333', 4, 'Stylish place and great location. A little noisy outside at night.', '2025-03-13 11:00:00');

-- 6. Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Robert, could you confirm if pets are allowed at the cabin?', '2025-02-28 09:30:00'),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi Alice, yes pets are allowed as long as they’re well-behaved.', '2025-02-28 10:00:00'),
  ('cccccccc-cccc-cccc-cccc-cccccccccccc', '33333333-3333-3333-3333-333333333333', '44444444-4444-4444-4444-444444444444', 'Hello David, is early check-in possible for April 1st?', '2025-02-27 14:15:00');
