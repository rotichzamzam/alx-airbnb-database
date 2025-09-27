-- Drop old table if exists (only for testing/demo purposes)
DROP TABLE IF EXISTS Bookings CASCADE;

-- Create partitioned table
CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50)
) PARTITION BY RANGE (start_date);

-- Create partitions by year (example: 2023, 2024, 2025)
CREATE TABLE Bookings_2023 PARTITION OF Bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Bookings_2024 PARTITION OF Bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Bookings_2025 PARTITION OF Bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Example query on partitioned table
-- Fetch bookings within a date range
EXPLAIN ANALYZE
SELECT * 
FROM Bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
