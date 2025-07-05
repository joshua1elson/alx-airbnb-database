-- 1. INNER JOIN: Retrieve all bookings and their respective users
SELECT 
    bookings.id AS booking_id,
    users.id AS user_id,
    users.name AS user_name,
    bookings.property_id,
    bookings.booking_date
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id
ORDER BY 
    bookings.booking_date DESC;


-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties without reviews
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews ON properties.id = reviews.property_id
ORDER BY 
    properties.name ASC, reviews.rating DESC;


-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if unmatched
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.booking_date
FROM 
    users
FULL OUTER JOIN 
    bookings ON users.id = bookings.user_id
ORDER BY 
    users.name NULLS LAST, bookings.booking_date NULLS LAST;