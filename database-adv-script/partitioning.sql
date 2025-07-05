-- partitioning.sql

-- STEP 1: Create a new partitioned table
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status TEXT,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES properties(id)
) PARTITION BY RANGE (start_date);


-- STEP 2: Create partitions by month (example: Jan–Mar 2025)

CREATE TABLE bookings_2025_01 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE bookings_2025_02 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE bookings_2025_03 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');

-- Add as many monthly partitions as needed...

-- STEP 3: Insert some test data (or migrate existing bookings)

-- Example (optional):
-- INSERT INTO bookings_partitioned SELECT * FROM bookings WHERE start_date >= '2025-01-01';

-- STEP 4: Test a query for a specific date range using EXPLAIN ANALYZE

EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2025-01-15' AND '2025-01-20';