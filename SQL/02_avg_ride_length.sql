-- Average Ride Length by rider type, plus % difference between casual and member

SELECT
    member_casual,
    ROUND(AVG(ride_length_mins), 1) AS avg_ride_length_mins
FROM trips
GROUP BY member_casual
ORDER BY avg_ride_length_mins DESC;

-- % longer casual rides are vs member rides
SELECT
    ROUND(
        100.0 * (
            (SELECT AVG(ride_length_mins) FROM trips WHERE member_casual = 'casual') -
            (SELECT AVG(ride_length_mins) FROM trips WHERE member_casual = 'member')
        ) / (SELECT AVG(ride_length_mins) FROM trips WHERE member_casual = 'member')
    , 1) AS pct_longer_casual_vs_member;
