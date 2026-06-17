-- Weekend Rides: average ride length on days by rider type
-- Reveals casual riders take their longest rides on Saturdays (18.2 min avg)

SELECT
        day_of_week,
        member_casual                                   AS rider_type,
        ROUND(AVG(ride_length_mins), 2)                 AS avg_ride_mins
    FROM trips
    GROUP BY day_of_week, member_casual
    ORDER BY
        CASE day_of_week
            WHEN 'Monday'    THEN 1
            WHEN 'Tuesday'   THEN 2
            WHEN 'Wednesday' THEN 3
            WHEN 'Thursday'  THEN 4
            WHEN 'Friday'    THEN 5
            WHEN 'Saturday'  THEN 6
            WHEN 'Sunday'    THEN 7
        END
