SELECT StudentID, FirstName, LastName, Semester1, Semester2, ABS(MarkGrowth) as MarkGrowth
FROM students;

SELECT StudentID, FirstName, LastName, Ceiling(Semester1) as Semester1, Ceiling(Semester2) as Semester2, MarkGrowth
FROM students;

SELECT StudentID, FirstName, LastName, Floor(Semester1) as Semester1, Floor(Semester2) as Semester2, MarkGrowth
FROM students;

SELECT StudentID, FirstName, LastName, ROUND(Semester1, 1) as Semester1, ROUND(Semester2, 0) as Semester2, MarkGrowth
FROM students;

SELECT StudentID, FirstName, LastName, SQRT(Semester1) as Semester1, Semester2, MarkGrowth
FROM students;

SELECT StudentID, FirstName, LastName, MOD(Semester1,2) as Semester1, Semester2, EXP(MarkGrowth) FROM students;

SELECT StudentID, CONCAT(FirstName, LastName) as Name, Semester1, Semester2, MarkGrowth
FROM students;

SELECT StudentID, SUBSTR(FirstName, 2, 3) as Name
FROM students;

SELECT StudentID, FirstName, LENGTH(FirstName) as Total_Char
FROM students;

SELECT StudentID, FirstName, LENGTH(FirstName) as Total_Char
FROM students;

SELECT StudentID, UPPER(FirstName) as FirstName, LOWER(LastName) as LastName
FROM students;

SELECT SUM(Semester1) as Total_1, SUM(Semester2) as Total_2
FROM students;

SELECT COUNT(FirstName) as Total_Student
FROM students;

SELECT AVG(Semester1) as AVG_1, AVG(Semester2) as AVG_2
FROM students;

SELECT MIN(Semester1) as Min1, MAX(Semester1) as Max1, MIN(Semester2) as Min2, MAX(Semester2) as Max2
FROM students;

SELECT province,
COUNT(DISTINCT order_id) as total_order,
SUM(item_price) as total_price
FROM sales_retail_2019
GROUP BY province;

SELECT province,
brand,
COUNT(DISTINCT order_id) as total_order,
SUM(item_price) as total_price FROM sales_retail_2019
GROUP BY province, brand;

SELECT province, COUNT(DISTINCT order_id) AS total_unique_order,
SUM(item_price) AS revenue FROM sales_retail_2019
GROUP BY province;

SELECT MONTH(order_date) AS order_month, SUM(item_price) AS total_price, 
CASE  
    WHEN SUM(item_price) >= 30000000000 THEN 'Target Achieved'
    WHEN SUM(item_price) <= 25000000000 THEN 'Less Performed'
    ELSE 'Follow Up'
END as remark
FROM sales_retail_2019
GROUP BY MONTH(order_date);

## 1. Total jumlah seluruh penjualan (total/revenue).
SELECT SUM(total) as total 
FROM tr_penjualan;
## 2. Total quantity seluruh produk yang terjual.
SELECT SUM(qty) as qty 
FROM tr_penjualan;
## 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT kode_produk, SUM(qty) as qty, SUM(total) as total 
FROM tr_penjualan
GROUP BY kode_produk;

## 4. Rata - Rata total belanja per kode pelanggan.
SELECT kode_pelanggan, AVG(total) as avg_total 
FROM tr_penjualan
GROUP BY kode_pelanggan;
## 5. Selain itu,  jangan lupa untuk menambahkan kolom baru dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K.
SELECT kode_transaksi,kode_pelanggan,no_urut,kode_produk, nama_produk, qty, total,
CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'LOW'   
    ELSE 'Medium'  
END as kategori 
FROM tr_penjualan;

