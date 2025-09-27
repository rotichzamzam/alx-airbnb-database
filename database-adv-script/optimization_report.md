# Query Analysis (Using EXPLAIN)

The execution plan shows multiple sequential scans on large tables.

Joins are performed without indexes, leading to high cost.

The query pulls all columns even when some may not be needed.

## Key Issues:

No filtering (retrieves all records).

Joins on unindexed columns slow down performance.

SELECT retrieves more columns than necessary.

## Improvements Made

Reduced columns: Removed unnecessary IDs like user_id, property_id, and payment_id since they don’t provide value in the report.

Indexing: Ensure indexes exist on:

Bookings.user_id

Bookings.property_id

Payments.booking_id

Filtering: Add a WHERE clause (e.g., by date range or status) when relevant to avoid full scans.

### Performance Comparison

Before Indexing / Refactor: High execution cost with sequential scans.

After Indexing / Refactor: Index scans used, fewer rows retrieved, lower execution cost.

### Conclusion

By reducing unnecessary joins, selecting only required columns, and adding indexes, the query performance improved significantly. The approach shows how small refactors and indexing strategies can greatly optimize database operations.

