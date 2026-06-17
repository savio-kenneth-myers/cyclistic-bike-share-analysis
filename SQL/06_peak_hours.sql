-- Peak Hours by rider type
-- Reveals member commute double peak (8am, 5pm) vs casual single peak (2pm)

SELECT
        hour,
        SUM(CASE WHEN member_casual = 'member' 
            THEN 1 ELSE 0 END)                          AS member_rides,
        SUM(CASE WHEN member_casual = 'casual' 
            THEN 1 ELSE 0 END)                          AS casual_rides,
        COUNT(*)                                        AS total_rides
    FROM trips
    GROUP BY hour
    ORDER BY hour ASC
