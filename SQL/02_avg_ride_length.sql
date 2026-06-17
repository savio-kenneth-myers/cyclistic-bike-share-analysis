-- Average Ride Length by rider type, plus % difference between casual and member

SELECT
        member_casual                                   AS rider_type,
        ROUND(AVG(ride_length_mins), 2)                 AS avg_ride_mins,
        ROUND(MIN(ride_length_mins), 2)                 AS min_ride_mins,
        ROUND(MAX(ride_length_mins), 2)                 AS max_ride_mins,
        ROUND(AVG(ride_length_mins) / 60, 2)            AS avg_ride_hours
    FROM trips
    GROUP BY member_casual
    ORDER BY avg_ride_mins DESC
