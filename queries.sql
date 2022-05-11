-- write your queries here
SELECT * 
FROM owners o 
FULL OUTER JOIN vehicles v ON o.id=v.owner_id;

--Count the number of cars for each owner. 
--Display the owners first_name, last_name and 
--count of vehicles. The first_name should be ordered in ascending order.

SELECT owners.first_name, owners.last_name, COUNT(*) AS x 
FROM owners 
JOIN vehicles ON owners.id=vehicles.owner_id 
GROUP BY owners.first_name, owners.last_name 
ORDER BY x;

--Count the number of cars for each owner and 
--display the average price for each of the cars as integers. 
--Display the owners first_name, last_name, average price and count of vehicles. 
--The first_name should be ordered in descending order. 
--Only display results with more than one vehicle and an average price greater than 10000.

SELECT first_name, last_name, ROUND(AVG(price)) as a, COUNT(owner_id)
FROM owners
JOIN vehicles ON owners.id=vehicles.owner_id 
GROUP BY (first_name, last_name) 
HAVING COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000
ORDER BY first_name DESC;