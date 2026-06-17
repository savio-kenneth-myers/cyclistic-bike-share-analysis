-- Rider Split: total rides and percentage share by rider type
-- Table assumed: trips (cleaned dataset, 639,526 rows)

SELECT
    member_casual,
    COUNT(*) AS total_rides,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM trips), 1) AS pct_of_total
FROM trips
GROUP BY member_casual
ORDER BY total_rides DESC;
