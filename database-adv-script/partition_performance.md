# Partitioning Report: Bookings Table Optimization

## 📌 Objective
To improve performance of queries on the large `bookings` table by partitioning it based on the `start_date` column.

## ⚙️ Method
- Created a new table `bookings_partitioned` with monthly range partitioning.
- Populated it with data from the existing `bookings` table (filtered by start_date).
- Ran queries filtering by date range using `EXPLAIN ANALYZE`.

## 📈 Observed Improvements

| Metric                         | Before Partitioning | After Partitioning |
|-------------------------------|----------------------|---------------------|
| Query Planning Time           | ~1.0 ms              | ~0.5 ms             |
| Execution Time (Jan Range)    | ~10.5 ms             | ~2.3 ms             |
| Table Scan Type               | Seq Scan (full)      | Index/Partition Pruning |
| Rows Processed                | 5000+                | ~500                |

## ✅ Conclusion
Partitioning the `bookings` table by `start_date` significantly improved query performance for date-based filtering. Query plans showed partition pruning, reducing scanned rows and execution time.

Partitioning is especially beneficial when querying recent months or specific historical windows.