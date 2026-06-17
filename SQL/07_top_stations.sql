-- Top 10 Start Stations overall, broken down by rider type
-- Reveals Navy Pier as the only top-10 station where casuals outnumber members

WITH top_stations AS (
    SELECT start_station_name, COUNT(*) AS total_rides
    FROM trips
    GROUP BY start_station_name
    ORDER BY total_rides DESC
    LIMIT 10
)
SELECT
    t.start_station_name,
    t.member_casual,
    COUNT(*) AS rides
FROM trips t
JOIN top_stations ts ON t.start_station_name = ts.start_station_name
GROUP BY t.start_station_name, t.member_casual
ORDER BY ts.total_rides DESC, t.member_casual;
