------ Air BnB Seattle Project Queries ----------

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
 
 
-- Question 2: Weekly prices can be lower for properties with lesser bedrooms
USE airbnb_seatle;
SELECT 
    a.bedrooms,
    ROUND(AVG(c.weekly_price), 2) AS 'weekly_average_price'
FROM
    accomodations a
        JOIN
    cost c ON a.id = c.id
GROUP BY a.bedrooms
ORDER BY a.bedrooms ASC;


-- Question 3: Lower security deposits and cleaning fees lead to better review scores
USE airbnb_seatle;

SELECT 
    (c.security_deposit + c.cleaning_fee) AS 'security_deposit_and_cleaning_fee',
    ROUND(AVG(r.review_scores_rating), 2) AS 'average_rating'
FROM
    cost c
        LEFT JOIN
    review_scores r ON c.id = r.id
GROUP BY security_deposit_and_cleaning_fee
ORDER BY security_deposit_and_cleaning_fee ASC;


-- Question 4: Properties with higher daily prices also charge higher security deposits and cleaning fees
SELECT 
    *
FROM
    cost;
SELECT 
    c.price_range,
    AVG(c.security_deposit),
    AVG(c.cleaning_fee),
    (AVG(c.security_deposit) + AVG(c.cleaning_fee)) AS 'average_total_fee'
FROM
    (SELECT 
        CASE
                WHEN price < 250 THEN '0 - $249'
                WHEN price >= 250 AND price < 500 THEN '$250 - $499'
                WHEN price >= 500 AND price < 750 THEN '$500 - $749'
                WHEN price >= 750 AND price < 1000 THEN '$750 -$999'
            END AS price_range,
            price,
            security_deposit,
            cleaning_fee
    FROM
        cost) AS c
GROUP BY c.price_range
ORDER BY average_total_fee;


-- Question 8: Properties allowing higher number of extra people have higher occupancy rates


SELECT 
    (a.accommodates - c.guests_included) AS 'extra_people',
    (1 - (SUM(ca.available) / COUNT(ca.listing_id))) AS 'occupancy_rate'
FROM
    accomodations a
        JOIN
    calendar ca ON ca.listing_id = a.id
        JOIN
    cost c ON c.id = a.id
GROUP BY (a.accommodates - c.guests_included)
ORDER BY occupancy_rate DESC;