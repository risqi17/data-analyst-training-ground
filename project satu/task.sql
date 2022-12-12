select year(order_date) as years, sum(sales) as sales, count(order_id) as number_of_order from dqlab_sales_store 
where (year(order_date) between '2009' and '2012') and order_status = 'Order Finished'
group by year(order_date) 
order by year(order_date)

select year(order_date) as years, product_sub_category, sum(sales) as sales
from dqlab_sales_store
where year(order_date) in (2011,2012) and order_status = 'Order Finished'
group by product_sub_category, year(order_date)
order by year(order_date), sales desc

select year(order_date) as years, 
sum(sales) as sales, 
sum(discount_value) as promotion_value, 
CAST((sum(discount_value) / sum(sales) * 100) AS DECIMAL(16,2)) as burn_rate_percentage
from dqlab_sales_store
where (year(order_date) between '2009' and '2012') and order_status = 'Order Finished'
group by year(order_date)
order by year(order_date)

SELECT
years,
product_sub_category,
product_category,
sales,
promotion_value,
round((promotion_value/sales)*100,2) AS burn_rate_percentage
FROM (
SELECT
ROUND(AVG(EXTRACT(YEAR FROM order_date)),0) AS years,
product_category,
product_sub_category,
SUM(discount_value) AS promotion_value,
SUM(sales) AS sales
FROM dqlab_sales_store
WHERE order_status = 'Order Finished' AND EXTRACT(YEAR FROM order_date) = '2012'	
GROUP BY 2,3) a
ORDER BY 4 DESC

