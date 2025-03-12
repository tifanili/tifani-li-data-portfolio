-- Total rides per driver in June 2016
SELECT d.driver_id, COUNT(r.ride_id) AS total_rides
FROM drivers d
JOIN rides r ON d.driver_id = r.driver_id
JOIN timestamps t ON r.ride_id = t.ride_id
WHERE t.timestamp BETWEEN '2016-06-01' AND '2016-06-30'
  AND t.event = 'picked_up_at'
GROUP BY d.driver_id
ORDER BY total_rides DESC;

-- Weekly active drivers
SELECT date(t.timestamp, 'weekday 0', '-6 days') AS week_start, COUNT(DISTINCT r.driver_id) AS active_drivers
FROM rides r
JOIN timestamps t ON r.ride_id = t.ride_id
WHERE t.event = 'picked_up_at'
GROUP BY date(t.timestamp, 'weekday 0', '-6 days')
ORDER BY week_start;