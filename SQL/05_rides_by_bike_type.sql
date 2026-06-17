-- Rides by Bike Type, split by rider type
-- Reveals casual riders favour electric bikes more than members

SELECT
        rideable_type                                   AS bike_type,
        SUM(CASE WHEN member_casual = 'member' 
            THEN 1 ELSE 0 END)                          AS member_rides,
        SUM(CASE WHEN member_casual = 'casual' 
            THEN 1 ELSE 0 END)                          AS casual_rides,
        COUNT(*)                                        AS total_rides
    FROM trips
    GROUP BY rideable_type
    ORDER BY total_rides DESC
