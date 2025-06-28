-- Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Walker', 'alice@example.com', 'hashed_password1', '0551111111', 'guest', CURRENT_TIMESTAMP),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_password2', '0552222222', 'host', CURRENT_TIMESTAMP),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Doe', 'charlie@example.com', 'hashed_password3', '0553333333', 'admin', CURRENT_TIMESTAMP);

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Beach House', 'A lovely beachside property.', 'Cape Coast', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 'Mountain Cabin', 'Quiet cabin in the mountains.', 'Aburi', 180.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('book1111-aaaa-bbbb-cccc-ddddeeeeffff', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-07-01', '2025-07-05', 1000.00, 'confirmed', CURRENT_TIMESTAMP),
('book2222-bbbb-cccc-dddd-eeeeffffaaaa', 'bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', '2025-08-10', '2025-08-12', 360.00, 'pending', CURRENT_TIMESTAMP);

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('pay11111-aaaa-bbbb-cccc-ddddeeeeffff', 'book1111-aaaa-bbbb-cccc-ddddeeeeffff', 1000.00, CURRENT_TIMESTAMP, 'credit_card');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('rev11111-aaaa-bbbb-cccc-ddddeeeeffff', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Amazing experience, very clean and comfortable!', CURRENT_TIMESTAMP),
('rev22222-bbbb-cccc-dddd-eeeeffffaaaa', 'bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 4, 'Peaceful and cozy place, will visit again.', CURRENT_TIMESTAMP);

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('msg11111-aaaa-bbbb-cccc-ddddeeeeffff', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hello, is the beach house available next week?', CURRENT_TIMESTAMP),
('msg22222-bbbb-cccc-dddd-eeeeffffaaaa', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, it is available from the 1st to 5th July.', CURRENT_TIMESTAMP);
