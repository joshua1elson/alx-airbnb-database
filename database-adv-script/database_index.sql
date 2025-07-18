-- Create indexes to optimize performance on common join/filter columns

-- Index on bookings.user_id for faster user-booking joins and filters
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id for property aggregation and joins
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.booking_date for filtering/sorting by date
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Index on reviews.property_id for property-review lookups
CREATE INDEX idx_reviews_property_id ON reviews(property_id);


-- ----------------------------------------------------
-- Performance Testing: Measure Query Plan Before/After
-- ----------------------------------------------------

-- EXPLAIN ANALYZE to evaluate query performance
EXPLAIN ANALYZE
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    COUNT(bookings.id) AS total_bookings
FROM 
    users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id, users.name;


EXPLAIN ANALYZE
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM 
    bookings
GROUP BY 
    property_id;