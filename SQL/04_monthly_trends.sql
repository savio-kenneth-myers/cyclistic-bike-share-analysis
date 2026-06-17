-- Monthly Ride Trends, January through March, by rider type

SELECT
        month,
        SUM(CASE WHEN member_casual = 'member' 
            THEN 1 ELSE 0 END)                          AS member_rides,
        SUM(CASE WHEN member_casual = 'casual' 
            THEN 1 ELSE 0 END)                          AS casual_rides,
        COUNT(*)                                        AS total_rides,
        ROUND(AVG(ride_length_mins), 2)                 AS avg_ride_mins
    FROM trips
    GROUP BY month
    ORDER BY
        CASE month
            WHEN 'January'  THEN 1
            WHEN 'February' THEN 2
            WHEN 'March'    THEN 3
        END
