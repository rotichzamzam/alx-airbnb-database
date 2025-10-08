
-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
  (UUID(), 'John', 'Doe', 'john.doe@example.com', 'hashedpassword123', '+254700111222', 'guest', CURRENT_TIMESTAMP),
  (UUID(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword456', '+254700333444', 'host', CURRENT_TIMESTAMP),
  (UUID(), 'Admin', 'User', 'admin@airbnb.com', 'hashedpassword789', '+254700555666', 'admin', CURRENT_TIMESTAMP);

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at)
VALUES
  (UUID(), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'),
   'Beachfront Villa', 'A stunning villa by the ocean with 3 bedrooms.', 'Mombasa, Kenya', 150.00, CURRENT_TIMESTAMP),
  (UUID(), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'),
   'Nairobi Apartment', 'Modern apartment near CBD.', 'Nairobi, Kenya', 80.00, CURRENT_TIMESTAMP);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Beachfront Villa'),
   (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
   '2025-11-01', '2025-11-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Nairobi Apartment'),
   (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
   '2025-12-10', '2025-12-15', 400.00, 'pending', CURRENT_TIMESTAMP);

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method, payment_date)
VALUES
  (UUID(), (SELECT booking_id FROM Booking WHERE status = 'confirmed'), 600.00, 'credit_card', CURRENT_TIMESTAMP);

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
  (UUID(), (SELECT property_id FROM Property WHERE name = 'Beachfront Villa'),
   (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
   5, 'Amazing stay! Highly recommend.', CURRENT_TIMESTAMP);

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
  (UUID(), 
   (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
   (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'),
   'Hi Jane, is the villa available for early check-in?', CURRENT_TIMESTAMP),
  (UUID(),
   (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'),
   (SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
   'Hi John! Yes, early check-in is possible at 10 AM.', CURRENT_TIMESTAMP);
