# 📊 Zepto Inventory & Pricing Analysis Dashboard

## 🚀 Project Overview

This project focuses on analyzing product inventory, pricing strategies, and revenue potential using a Zepto-like retail dataset. The goal is to identify stock issues, pricing patterns, and business opportunities through data analysis and visualization.

---

## 🛠️ Tools & Technologies

* **Python** (Pandas, NumPy)
* **SQL (PostgreSQL)**
* **Power BI**
* **DAX**

---

## 📂 Data Processing (Python)

* Cleaned dataset (handled nulls, duplicates)
* Converted data types (price, discount, quantity)
* Created new features:

  * `discount_amount`
  * `price_per_100g`
  * `stock_status`
* Standardized column names (snake_case)

---

## 🗄️ Data Analysis (SQL)

* Performed business queries:

  * Top discounted products
  * High MRP out-of-stock items
  * Category-wise revenue analysis
* Used **CTEs & Window Functions**:

  * Ranking products by revenue
  * Category contribution analysis

---

## 📊 Dashboard Features (Power BI)

### 🔑 Key KPIs

* Total Products
* Out of Stock %
* Low Stock Count
* Average Discount %
* Potential Revenue

### 📈 Visualizations

* Category vs Available Quantity
* Price per 100g by Category
* Stock Status Distribution
* Revenue at Risk by Category
* Revenue Distribution (Treemap)
* Top 5 Categories by Discount %
* MRP vs Discount % (Scatter Plot)

---

## 🎯 Key Insights

* Certain categories offer significantly higher discounts, indicating aggressive pricing strategies.
* A large portion of products fall under low stock, highlighting inventory risk.
* High-priced items are not always heavily discounted.
* Few categories contribute major share of total revenue.

---

## 💡 Business Value

* Helps optimize inventory management
* Identifies pricing inefficiencies
* Supports revenue-focused decision making

---

## 📌 Conclusion

This project demonstrates end-to-end data analysis including data cleaning, SQL-based insights, and interactive dashboard creation for business decision support.

---

