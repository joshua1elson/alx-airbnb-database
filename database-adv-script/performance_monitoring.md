# 📊 Database Performance Monitoring & Optimization Report

## 🎯 Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments. This process ensures frequently used queries remain efficient as data grows.

---

## 1️⃣ Query Monitored

The following query is used regularly to retrieve the total number of bookings made by each user:

```sql
SELECT 
    u.id, 
    u.name, 
    COUNT(b.id) AS total_bookings
FROM 
    users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY 
    u.id, u.name;