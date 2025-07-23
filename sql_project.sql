---check the null value

SELECT *
FROM sales
WHERE
    transaction_id IS NULL
    OR customer_id IS NULL
    OR customer_name IS NULL
    OR customer_age IS NULL
    OR product_id IS NULL
    OR product_name IS NULL
    OR product_category IS NULL
    OR quantity IS NULL
    OR price IS NULL
    OR payment_mode IS NULL
    OR purchase_date IS NULL
    OR `time_of_purchase` IS NULL
    OR status IS NULL;
    SELECT distinct gender
FROM sales

    --change colonm name
    ALTER TABLE sales
RENAME COLUMN quantiy TO quantity;
UPDATE sales
SET gender = 'M'
WHERE gender = 'Male';
SET SQL_SAFE_UPDATES = 0;
UPDATE sales
SET gender = 'F'
WHERE gender = 'Female';
SELECT distinct payment_mode
FROM sales
UPDATE sales
set payment_mode = 'Credit Card'
where payment_mode = 'CC'
Q1--- what are the top 5 most selling productn name by quantity
SELECT product_name, SUM(quantity) AS total_quantity_sold
FROM sales
WHERE status = 'delivered'
GROUP BY product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;
---	Q2 which product are most frequently canceled
select product_name,count(*)as total_cancelled from sales
where status = 'cancelled'
group by product_name 
order by total_cancelled desc
limit 5
---Q3 what time of day has highest number of purchase
select * from sales 
   SELECT 
  CASE 
    WHEN HOUR(time_of_purchase) BETWEEN 0 AND 5 THEN 'Late Night'
    WHEN HOUR(time_of_purchase) BETWEEN 6 AND 11 THEN 'Morning'
    WHEN HOUR(time_of_purchase) BETWEEN 12 AND 17 THEN 'Afternoon'
    WHEN HOUR(time_of_purchase) BETWEEN 18 AND 23 THEN 'Evening'
  END AS time_of_day,
  COUNT(*) AS total_orders
FROM sales
GROUP BY 
  CASE 
    WHEN HOUR(time_of_purchase) BETWEEN 0 AND 5 THEN 'Late Night'
    WHEN HOUR(time_of_purchase) BETWEEN 6 AND 11 THEN 'Morning'
    WHEN HOUR(time_of_purchase) BETWEEN 12 AND 17 THEN 'Afternoon'
    WHEN HOUR(time_of_purchase) BETWEEN 18 AND 23 THEN 'Evening'
  END;

                    


---Q4 who are top 5  highest spending customer
select customer_name, 
FORMAT (sum(quantity*price) ,'co','en-IN')as top_spend from sales
group by customer_name
order by top_spend DESC
limit 5;
Q5--- which product_category generate the heghest revenue
SELECT product_category,
       CONCAT('₹', FORMAT(SUM(quantity * price), 0)) AS revenue
FROM sales
GROUP BY product_category
ORDER BY SUM(quantity * price) DESC
LIMIT 5;
--------------------------------------------------------------------------------------------------------------------------------------------------
-----Q6 what is most preffered payment mode
select payment_mode, count(*) as total_count from sales
group by payment_mode 
order by total_count DESC

---Q7 how does age group affect purchasing behavior
SELECT  
  CASE 
    WHEN customer_age BETWEEN 18 AND 25 THEN '18-25'
    WHEN customer_age BETWEEN 26 AND 35 THEN '26-35'
    WHEN customer_age BETWEEN 36 AND 50 THEN '36-50'
    ELSE '51+'
  END AS customer_age,
  
CONCAT ('₹',FORMAT( SUM(price * quantity), 0 ))AS total_purchase

FROM sales

GROUP BY  
  CASE 
    WHEN customer_age BETWEEN 18 AND 25 THEN '18-25'
    WHEN customer_age BETWEEN 26 AND 35 THEN '26-35'
    WHEN customer_age BETWEEN 36 AND 50 THEN '36-50'
    ELSE '51+'
  END

ORDER BY total_purchase DESC;
---Q8 whats the monthly sales trends
SELECT 
  DATE_FORMAT(purchase_date, '%y-%m') AS month_year,
  SUM(price * quantity) AS total_sales,
  CONCAT ( '₹',FORMAT (SUM(quantity),0)) AS total_quantity
FROM sales
GROUP BY DATE_FORMAT(purchase_date, '%y-%m')
ORDER BY month_year;
-- certaine gender buying more specific product category
select gender,product_category ,count(product_category) as total_purchase from
sales
group by gender,product_category
order by gender desc
