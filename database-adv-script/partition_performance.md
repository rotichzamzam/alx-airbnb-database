# Partitioning Analysis Report

## Objective
Optimize queries on the large **Bookings** table by implementing partitioning based on the `start_date` column.

---

## Approach
1. Partitioned the **Bookings** table by year using **RANGE partitioning** on the `start_date` column.
2. Created child partitions (`Bookings_2023`, `Bookings_2024`, `Bookings_2025`) to store data separately.
3. Tested query performance before and after partitioning using `EXPLAIN ANALYZE`.

---

## Observations
- **Before Partitioning**:
  - Queries scanning by date range performed a full table scan.
  - Higher execution cost on large datasets.
- **After Partitioning**:
  - Query planner used **partition pruning** (only scanned relevant partitions).
  - Execution time reduced significantly for queries filtering by `start_date`.
  - Storage organization improved by separating data logically.

---

## Example
```sql
EXPLAIN ANALYZE
SELECT * 
FROM Bookings
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
