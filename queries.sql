-- Show all owners and their vehicles (even if no vehicles exist)
SELECT owners.id,
       owners.first_name,
       owners.last_name,
       vehicles.id,
       vehicles.make,
       vehicles.model,
       vehicles.year,
       vehicles.price,
       vehicles.owner_id
FROM owners
LEFT JOIN vehicles
ON owners.id = vehicles.owner_id;
-- Count cars per owner
SELECT owners.first_name,
       owners.last_name,
       COUNT(vehicles.id) AS count
FROM owners
JOIN vehicles
ON owners.id = vehicles.owner_id
GROUP BY owners.id, owners.first_name, owners.last_name
ORDER BY owners.first_name ASC;
-- Count cars and average price per owner (filters applied)
SELECT owners.first_name,
       owners.last_name,
       CAST(AVG(vehicles.price) AS INTEGER) AS average_price,
       COUNT(vehicles.id) AS count
FROM owners
JOIN vehicles
ON owners.id = vehicles.owner_id
GROUP BY owners.id, owners.first_name, owners.last_name
HAVING COUNT(vehicles.id) > 1
   AND AVG(vehicles.price) > 10000
ORDER BY owners.first_name DESC;
