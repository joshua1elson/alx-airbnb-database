# Booking Query Performance Optimization

## 🎯 Goal
Retrieve a full list of bookings, including user, property, and payment info, and optimize performance.

---

## 📄 Step 1: Run Initial Query

Run the query in `performance.sql` to retrieve data.

---

## 📊 Step 2: Analyze Query with EXPLAIN

Before optimizing, run:

```sql
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
JOIN payments pay ON b.id = pay.booking_id;