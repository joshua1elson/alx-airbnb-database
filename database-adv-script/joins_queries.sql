SELECT 
    bookings.id AS booking_id,
    users.id AS user_id,
    users.name AS user_name,
    bookings.property_id,
    bookings.booking_date
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;