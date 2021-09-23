create index normalized_trips_hash_trip on normalized_trips using hash (trip_id);

-- UPDATE pg_index
-- SET indisvalid=false
-- WHERE indrelid = (
--     SELECT oid
--     FROM pg_class
--     WHERE relname='normalized_trips'
-- ); -- we disable index because we first start with a query without index


-- to re-enable index, the instructor should at some point run the query below
-- UPDATE pg_index
-- SET indisready=true
-- WHERE indrelid = (
--     SELECT oid
--     FROM pg_class
--     WHERE relname='normalized_trips'
-- );