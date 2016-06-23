SELECT carrier, id,
    (SELECT COUNT(*)
FROM flights f
WHERE f.id < flights.id
AND f.carrier=flights.carrier) + 1
 AS flight_sequence_number
FROM flights;