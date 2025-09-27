## columns that get queried often in joins, filters, and ordering:

User Table

email (used for login lookups → WHERE email = ?)

user_id (used in joins with Booking, Review, Property)

Booking Table

user_id (join with User)

property_id (join with Property)

status (filter bookings by status → WHERE status = 'confirmed')

start_date, end_date (search bookings by date range)

Property Table

property_id (joins with Booking, Review)

host_id (filter properties by host → WHERE host_id = ?)

location (search/filter properties → WHERE location = ?)

pricepernight (range queries → ORDER BY pricepernight)

## Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql

-- User Table Indexes
CREATE UNIQUE INDEX idx_user_email ON User (email);
CREATE INDEX idx_user_id ON User (user_id);

-- Booking Table Indexes
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_status ON Booking (status);
CREATE INDEX idx_booking_dates ON Booking (start_date, end_date);

-- Property Table Indexes
CREATE INDEX idx_property_id ON Property (property_id);
CREATE INDEX idx_property_host_id ON Property (host_id);
CREATE INDEX idx_property_location ON Property (location);
CREATE INDEX idx_property_price ON Property (pricepernight);

## Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.
-- Without index
EXPLAIN ANALYZE
SELECT *
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE u.email = 'alice@example.com';
