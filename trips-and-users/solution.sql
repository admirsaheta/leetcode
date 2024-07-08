WITH UnbannedUsers AS (
    SELECT users_id
    FROM Users
    WHERE banned = 'No'
),
FilteredTrips AS (
    SELECT 
        t.id,
        t.client_id,
        t.driver_id,
        t.status,
        t.request_at
    FROM 
        Trips t
    JOIN 
        UnbannedUsers c ON t.client_id = c.users_id
    JOIN 
        UnbannedUsers d ON t.driver_id = d.users_id
    WHERE 
        t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
),
DailyTripStats AS (
    SELECT 
        request_at AS Day,
        COUNT(*) AS total_trips,
        SUM(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END) AS cancelled_trips
    FROM 
        FilteredTrips
    GROUP BY 
        request_at
)
SELECT 
    Day,
    ROUND(CAST(cancelled_trips AS numeric) / total_trips, 2) AS "Cancellation Rate"
FROM 
    DailyTripStats;
