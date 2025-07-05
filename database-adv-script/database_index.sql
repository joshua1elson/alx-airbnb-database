-- database_index.sql

-- Index on bookings.user_id for faster user-booking joins and filters
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id for property aggregation and joins
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.booking_date for filtering/sorting by date
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Index on reviews.property_id for property-review lookups
CREATE INDEX idx_reviews_property_id ON reviews(property_id);