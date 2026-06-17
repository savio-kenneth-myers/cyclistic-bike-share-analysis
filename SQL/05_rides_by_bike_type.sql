-- Rides by Bike Type, split by rider type
-- Reveals casual riders favour electric bikes more than members

SELECT
    member_casual,
    rideable_type,
    COUNT(*) AS total_rides,
    ROUND(
        100.0 * COUNT(*) / (
            SELECT COUNT(*) FROM trips t2 WHERE t2.member_casual = trips.member_casual
        ), 1
    ) AS pct_within_rider_type
FROM trips
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_rides DESC;
