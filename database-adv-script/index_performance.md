## columns that get queried often in joins, filters, and ordering:

User Table

email (used for login lookups → WHERE email = ?)

user_id (used in joins with Booking, Review, Property)

Booking Table

user_id (join with User)

property_id (join with Property)

status (filter bookings by status → WHERE status = 'confirmed')

start_date, end_date (search bookings by date range)

Property Table

property_id (joins with Booking, Review)

host_id (filter properties by host → WHERE host_id = ?)

location (search/filter properties → WHERE location = ?)

pricepernight (range queries → ORDER BY pricepernight)
