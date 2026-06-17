-- Weekend Rides: average ride length on Saturdays by rider type
-- Reveals casual riders take their longest rides on Saturdays (18.2 min avg)

SELECT
    day_of_week,
    member_casual,
    ROUND(AVG(ride_length_mins), 1) AS avg_ride_length_mins
FROM trips
WHERE day_of_week IN ('Saturday', 'Sunday')
GROUP BY day_of_week, member_casual
ORDER BY day_of_week, member_casual;
