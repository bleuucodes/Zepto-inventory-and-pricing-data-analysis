select * from retail;
alter table retail 
rename column discountedsellingprice to
discounted_selling_price;

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discount_percent
FROM retail
ORDER BY discount_percent DESC
LIMIT 10;

--Q2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT name,mrp
FROM retail
WHERE out_of_stock = TRUE and mrp > 300
ORDER BY mrp DESC;

--Q3.Calculate Estimated Revenue for each category
SELECT category,
SUM(discounted_selling_price * available_quantity) AS total_revenue
FROM retail
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discount_percent
FROM retail
WHERE mrp > 500 AND discount_percent < 10
ORDER BY mrp DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discount_percent),2) AS avg_discount
FROM retail
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

--Q6.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weight_in_gms,
CASE WHEN weight_in_gms < 1000 THEN 'Low'
	WHEN weight_in_gms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM retail;

--Q7.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weight_in_gms * available_quantity) AS total_weight
FROM retail
GROUP BY category
ORDER BY total_weight;

-- Q8. Which in-stock products offer the best deals?(Deal of the Day selection)
SELECT category, name, mrp, discount_percent, discounted_selling_price, 
discount_amount AS rs_saved
FROM retail
WHERE out_of_stock = FALSE AND discount_percent > 0
ORDER BY discount_percent DESC, discount_amount DESC
LIMIT 15;

-- Q9. Which category needs urgent restocking?
SELECT category, Count(*) as out_of_stock_products
FROM retail
WHERE out_of_stock = True
Group By category
Order by out_of_stock_products desc;

-- Q10. Top 10 high revenue products
SELECT name, category,
(available_quantity * discounted_selling_price) as potential_revenue
FROM retail
ORDER BY potential_revenue DESC LIMIT 10;

-- Q11. Top 3 products in each category
SELECT *
FROM (
    SELECT name, category,
	(available_quantity * discounted_selling_price) as revenue,
	ROW_NUMBER() 
	OVER (PARTITION BY category 
	ORDER BY  available_quantity * discounted_selling_price DESC) AS rn
	FROM retail
	) t
WHERE rn <= 3;
