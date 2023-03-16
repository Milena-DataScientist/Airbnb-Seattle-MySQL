-- Question 1 :  Daily prices can be higher for properties with more bathrooms
USE airbnb_seatle;
SELECT 
    a.bathrooms, ROUND(AVG(c.price), 2) AS 'average_price'
FROM
    accomodations a
        JOIN
    cost c ON a.id = c.id
GROUP BY a.bathrooms
ORDER BY a.bathrooms DESC;
 
