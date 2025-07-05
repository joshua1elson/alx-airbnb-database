# Index Performance Testing - 

## 📊 : Measure Query Performance Before and After Adding Indexes

To validate that your indexes improve performance, use SQL `EXPLAIN` or `EXPLAIN ANALYZE` on high-impact queries before and after running your `CREATE INDEX` statements.

---

### ✅ Example Query to Analyze (User Booking Count)

```sql
EXPLAIN ANALYZE
SELECT 
    users.id, 
    users.name, 
    COUNT(bookings.id) AS total_bookings
FROM 
    users
LEFT JOIN bookings ON users.id = bookings.user_id
GROUP BY users.id, users.name;