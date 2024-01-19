USE BikeStores
--meu banco de dados

SELECT *
FROM production.categories

SELECT *
FROM sales.staffs


SELECT *
FROM sales.orders

--SELECT *
--FROM sales.customers

--SELECT *
--FROM sales.order_items

SELECT *
FROM production.products

USE BikeStores
SELECT 
  ord.order_id,
  CONCAT(cus.first_name, ' ', cus.last_name) as customer_name,
  cus.city,
  cus.state,
  ord.order_date,
  pp.product_name,
  pc.category_name as brand_name,
  sto.store_name,
  CONCAT(st.first_name, ' ', st.last_name) as sales_rep,
  SUM(ite.quantity) AS 'total_units',
  SUM(ite.quantity * ite.list_price) as 'revenue'
FROM 
  sales.customers cus
JOIN 
  sales.orders ord ON ord.customer_id = cus.customer_id
JOIN 
  sales.order_items ite ON ord.order_id = ite.order_id
JOIN 
  production.products pp ON ite.product_id = pp.product_id
JOIN 
  production.categories pc ON pp.category_id = pc.category_id
JOIN 
  sales.stores sto ON ord.store_id = sto.store_id
JOIN 
  sales.staffs st ON ord.staff_id = st.staff_id

GROUP BY
  ord.order_id,
  CONCAT(cus.first_name, ' ', cus.last_name),
  cus.city,
  cus.state,
  ord.order_date,
  pp.product_name,
  pc.category_name,  -- Removendo o alias "brand_name" aqui
  sto.store_name,
  CONCAT(st.first_name, ' ', st.last_name);






