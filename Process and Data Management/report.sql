--Queries

-- 1.: Displays what product is supplied by which vendor and bought by which customer. The point for this query
-- is the overview that is given for all orders. Now we can easily obtain what our customers want.
SELECT p.product_description AS "Product", s.supplier_name AS "Supplied by", c.customer_name AS "Purchased by", d.order_date, 
d.order_quantity AS "Qty Demanded", d.order_quantity * d.retail_price AS "Revenue", so.order_quantity AS "Supplied Qty"
FROM products p JOIN
suppliers s ON p.supplier_id = s.supplier_id LEFT OUTER JOIN
demand_orders d ON d.product_id = p.product_id JOIN 
customers c ON d.customer_id = c.customer_id JOIN
supply_orders so ON s.supplier_id = so.supplier_id
ORDER BY "Product", "Qty Demanded" desc;

-- 2.: This query calculates the amount for each order we have to our suppliers. The grand total of our expenses
-- can be compared to the revenue that is generated and displayed by query 1. This is also a suitable controlling 
-- instrument since we can immideately see if our sales are profitable.

-- Values for query: Type in the ID number of a corresponding supply_order. In our case, numbers from 1-4 are valid.
SELECT s.supply_order_id,
SUM(s.order_quantity * s.purchase_price) AS "Grand_Total"
FROM supply_orders s
JOIN products p ON p.product_id = s.product_id
WHERE s.supply_order_id = &OrderId
GROUP BY s.supply_order_id;

