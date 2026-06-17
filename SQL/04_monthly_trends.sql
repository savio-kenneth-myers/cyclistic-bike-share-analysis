-- Monthly Ride Trends, January through March, by rider type

SELECT
    month,
    member_casual,
    COUNT(*) AS total_rides
FROM trips
GROUP BY month, member_casual
ORDER BY month, member_casual;

-- Growth rate from January to March per rider type
WITH monthly AS (
    SELECT month, member_casual, COUNT(*) AS total_rides
    FROM trips
    GROUP BY month, member_casual
)
SELECT
    member_casual,
    ROUND(
        100.0 * (
            (SELECT total_rides FROM monthly m2 WHERE m2.month = 3 AND m2.member_casual = m.member_casual) -
            (SELECT total_rides FROM monthly m1 WHERE m1.month = 1 AND m1.member_casual = m.member_casual)
        ) / (SELECT total_rides FROM monthly m1 WHERE m1.month = 1 AND m1.member_casual = m.member_casual)
    , 1) AS pct_growth_jan_to_mar
FROM monthly m
GROUP BY member_casual;
