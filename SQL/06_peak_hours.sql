-- Peak Hours by rider type
-- Reveals member commute double peak (8am, 5pm) vs casual single peak (2pm)

SELECT
    hour,
    member_casual,
    COUNT(*) AS total_rides
FROM trips
GROUP BY hour, member_casual
ORDER BY hour, member_casual;
