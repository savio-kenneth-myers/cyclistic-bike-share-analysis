-- Rider Split: total rides and percentage share by rider type
-- Table assumed: trips (cleaned dataset, 639,526 rows)
SELECT 
        member_casual                                   AS rider_type,
        COUNT(*)                                        AS total_rides,
        ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
    FROM trips
    GROUP BY member_casual
    ORDER BY total_rides DESC
