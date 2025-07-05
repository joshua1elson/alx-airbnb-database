-- performance.sql

-- Initial detailed query with full JOINs and filtering
SELECT 
    b.id AS booking_id,
    b.booking_date,
    
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    
    p.id AS property_id,
    p.name AS property_name,
    p.location AS property_location,
    
    pay.id AS payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date

FROM 
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE 
    b.booking_date >= '2024-01-01'
    AND pay.amount > 100;


-- EXPLAIN ANALYZE: Query with filters to evaluate index effectiveness
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.booking_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location AS property_location,
    pay.id AS payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM 
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE 
    b.booking_date >= '2024-01-01'
    AND pay.amount > 100;