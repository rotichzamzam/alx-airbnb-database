# Database Performance Monitoring Report

## Objective
Continuously monitor query performance, identify bottlenecks, and refine the schema for improved efficiency.

---

## Step 1: Monitoring Queries
We used `EXPLAIN ANALYZE` to evaluate execution plans for frequently used queries:
1. Fetching bookings with user details.
2. Fetching reviews for a property.
3. Ranking properties by total bookings.

---

## Step 2: Observed Bottlenecks
- **Query 1** (Bookings with Users):
  - Sequential scan on the `Bookings` table when filtering by `start_date`.
  - Join on `user_id` caused additional overhead.
- **Query 2** (Property Reviews):
  - Sequential scan on `Reviews` table due to filter on `property_id`.
- **Query 3** (Top Properties by Bookings):
  - Full table scan on `Bookings` due to lack of index on `property_id`.

---

## Step 3: Optimizations Implemented
1. Added index on `Bookings.start_date` to speed up date range queries.
2. Added index on `Bookings.user_id` to improve joins with `Users`.
3. Added index on `Reviews.property_id` for faster property review lookups.
4. Added index on `Bookings.property_id` to improve aggregation queries.

---

## Step 4: Results
- **Bookings query** execution time reduced significantly by enabling index scans instead of sequential scans.
- **Reviews query** improved due to index usage on `property_id`.
- **Top properties query** now leverages the new index, reducing aggregation cost.

Example (Bookings Query):

```sql
-- Before Optimization (Simplified output)
Seq Scan on Bookings  (cost=1000..5000 rows=200 width=...)
Execution Time: 150 ms

-- After Optimization
Index Scan using idx_bookings_start_date on Bookings
(cost=50..200 rows=50 width=...)
Execution Time: 12 ms
