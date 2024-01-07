SELECT *
FROM sales.orders

SELECT *
FROM sales.customers

SELECT 
ord.order_id,
CONCAT(cus.first_name,' ',cus.last_name),
cus.city,
cus.state,
ord.order_date
FROM sales.customers cus
JOIN sales.orders ord ON
ord.customer_id=cus.customer_id

