-- performance.sql

-- Initial detailed query with full JOINs
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
JOIN payments pay ON b.id = pay.booking_id;