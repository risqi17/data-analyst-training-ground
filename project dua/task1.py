select
sum(quantity) as total_penjualan,
sum(quantity * priceeach) as revenue
from orders_1;

select
sum(quantity) as total_penjualan,
sum(quantity * priceeach) as revenue
from orders_2
where status = 'Shipped';

SELECT quarter, SUM(quantity) AS total_penjualan, SUM(priceEach * quantity) as revenue
FROM (SELECT orderNumber, status, quantity, priceEach, '1' as quarter 
    	      FROM orders_1
	      UNION 
            SELECT orderNumber, status, quantity,priceEach, '2' as quarter 
             FROM orders_2) AS tabel_a
WHERE status = 'Shipped'
GROUP BY quarter


SELECT quarter, COUNT(DISTINCT customerID) AS total_customers
FROM (SELECT customerID, createDate, quarter(createDate) AS quarter
FROM customer
WHERE createDate BETWEEN '2004-01-01' AND '2004-07-01') as tabel_b
	GROUP BY quarter


SELECT quarter, COUNT(DISTINCT customerID) AS total_customers
FROM (SELECT customerID, createDate, quarter(createDate) AS quarter
FROM customer
WHERE createDate BETWEEN '2004-01-01' AND '2004-07-01') AS tabel_b
	WHERE customerID IN (SELECT DISTINCT customerID FROM orders_1
				  UNION
  SELECT DISTINCT customerID FROM orders_2)
	GROUP BY quarter


select 
left(productcode,3) as categoryid,
count(distinct ordernumber) as total_order,
sum(quantity) as total_penjualan
from orders_2
where status = 'Shipped'
group by 1
order by 2 desc

select "1" as quarter, (count(distinct customerid)*100)/25 as Q2
from orders_1
where customerid in (select distinct customerid from orders_2)
and status ="Shipped"
group by 1;