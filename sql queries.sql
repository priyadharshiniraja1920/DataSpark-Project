use data_spark
#Customer Segmentation:
select *from customer;
SELECT * from sales;
DESCRIBE Sales;

# 1 Customer Distribution by State:
SELECT c.State, COUNT(DISTINCT c.CustomerKey) AS Customer_Count FROM customer c
GROUP BY c.State
ORDER BY Customer_Count DESC;

# 2 Customer Acquisition by Year:
SELECT YEAR(c.Birthday) AS Year, COUNT(DISTINCT c.CustomerKey) AS New_Customers FROM customer c WHERE c.Birthday IS NOT NULL
GROUP BY Year
ORDER BY Year DESC;

# 3 Top 50 Customers by Revenue:
SELECT c.Name, SUM(s.Quantity * p.Unit_Price_USD) AS Customer_Revenue FROM sales s
JOIN customer c ON s.CustomerKey = c.CustomerKey
JOIN products p ON s.ProductKey = p.ProductKey
GROUP BY c.Name
ORDER BY Customer_Revenue DESC LIMIT 50;

SELECT 
    customer.Gender, 
    AVG(sales.Line_Item * sales.Quantity) AS AvgOrderValue, 
    COUNT(sales.Order_Number) AS PurchaseFrequency
FROM 
    sales
JOIN 
    customer 
ON 
    sales.customerKey = customer.customerKey
GROUP BY 
    customer.Gender;
