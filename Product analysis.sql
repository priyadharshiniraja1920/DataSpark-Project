-- Catagory and sub catagory analysis
SELECT
    category,subcategory,
    ROUND(SUM(unit_price_usd * quantity),2) AS total_sales
FROM merged_dataset
GROUP BY category,subcategory
ORDER BY total_sales DESC;

-- Product Popularity: Identify the most and least popular products based on sales data.

select distinct(product_name),sum(quantity) as Quantity
from merged_dataset
group by product_name
order by Quantity desc
limit 10

select distinct(product_name),sum(quantity) as Quantity
from merged_dataset
group by product_name
order by Quantity 
limit 10

-- Profitability Analysis: Calculate profit margins for products by comparingunit cost and unit price.

Select
product_name,
ROUND(Sum((unit_price_usd-unit_cost_usd)*quantity),2) as Profit_Margin
from merged_dataset
group by product_name
order by Profit_Margin desc
limit 10


