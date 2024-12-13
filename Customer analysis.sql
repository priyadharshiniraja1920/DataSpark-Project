use global_electronics;

SELECT gender, COUNT(*) AS Count_gender
FROM customers
GROUP BY gender;

-- Age bucketing
SELECT
    age_bucket,
    COUNT(*) AS count
FROM (
    SELECT
        *,
        CASE
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) <= 18 THEN '<=18'
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) BETWEEN 18 AND 25 THEN '18-25'
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) BETWEEN 25 AND 35 THEN '25-35'
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) BETWEEN 35 AND 45 THEN '35-45'
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) BETWEEN 45 AND 55 THEN '45-55'
            WHEN YEAR(STR_TO_DATE(Order_date, '%Y-%m-%d')) - YEAR(STR_TO_DATE(birthday, '%Y-%m-%d')) BETWEEN 55 AND 65 THEN '55-65'
            ELSE '>65'
        END AS age_bucket
    FROM merged_dataset
) AS age_groups
GROUP BY age_bucket;

-- countery wise customer count
SELECT 
    continent,country,state,city, 
    COUNT(CustomerKey) AS customer_count
FROM 
    CUSTOMERS
GROUP BY 
    continent,country,state,city
ORDER BY 
    customer_count DESC