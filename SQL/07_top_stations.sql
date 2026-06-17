-- Top 10 Start Stations overall, broken down by rider type
-- Reveals Navy Pier as the only top-10 station where casuals outnumber members

SELECT
        start_station_name                              AS station,
        SUM(CASE WHEN member_casual = 'member' 
            THEN 1 ELSE 0 END)                          AS member_rides,
        SUM(CASE WHEN member_casual = 'casual' 
            THEN 1 ELSE 0 END)                          AS casual_rides,
        COUNT(*)                                        AS total_rides
    FROM trips
    WHERE start_station_name IS NOT NULL
    GROUP BY start_station_name
    ORDER BY total_rides DESC
    LIMIT 10
