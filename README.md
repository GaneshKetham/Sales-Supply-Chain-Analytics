Sales & Supply Chain Analytics Project Overview

This project analyzes sales, customer, product, and supply chain data to understand business performance and identify factors affecting sales, profitability, and delivery performance.

The project follows a complete data analytics workflow:

Data Cleaning → Exploratory Data Analysis → SQL Analysis → Power BI Dashboard

The main objective is to convert raw business data into meaningful insights that can support better sales and supply chain decisions.

Dataset

Dataset: DataCo Smart Supply Chain Dataset

The dataset contains approximately 180,000+ records and 50+ columns covering areas such as:

Customer information Product and category details Sales and profit Orders and shipping Delivery performance Markets and regions Departments

The dataset was used to analyze both business performance and supply chain efficiency.

Tools Used Python – Data cleaning and exploratory data analysis Pandas – Data manipulation and analysis Microsoft SQL Server – SQL-based business analysis Power BI – Interactive dashboard and visualization

Data Cleaning

The raw dataset was inspected and cleaned using Python.

Main steps: Checked dataset shape and data types Checked for duplicate records Identified missing values Handled relevant missing data Converted date columns into appropriate formats Checked numerical columns for consistency Created useful derived features for analysis Validated the cleaned dataset before further analysis

The cleaned dataset was saved as a separate CSV file for further analysis.

Exploratory Data Analysis (EDA)

EDA was performed using Python to understand the distribution and relationships within the data.

Analysis included: Sales and profit distribution Sales by category Sales by customer segment Sales by region Department-level performance Customer-level sales Shipping and delivery performance Distribution of shipping days Late delivery patterns

EDA helped identify important trends and provided a foundation for the SQL and Power BI analysis.

SQL Analysis

MySQL was used to perform business-oriented analysis on the cleaned dataset.

SQL concepts used include:

SELECT WHERE GROUP BY ORDER BY Aggregate functions Subqueries CTEs Window functions

Power BI Dashboard

An interactive 3-page Power BI dashboard was created to present the analysis in an easy-to-understand format.

Page 1 — Executive Overview

Provides an overall view of business performance using KPIs and charts.

KPIs:

Total Sales Total Profit Total Orders Average Order Value (AOV) Profit Margin Late Delivery Rate

Visuals:

Sales by Category Sales by Customer Segment Delivery Status Monthly Sales Trend Date Slicer

Page 2 — Sales & Customer Analysis

Focuses on sales performance across customers, regions, and departments.

Visuals:

Sales by Region Top 10 Customers by Sales Sales by Department Profit by Category

Page 3 — Supply Chain Performance

Focuses on shipping and delivery efficiency.

Visuals:

Average Shipping Days by Region Late Delivery Rate by Region Average Shipping Days by Shipping Mode Late Delivery Rate by Market

Conclusion

This project demonstrates the use of Python, SQL, and Power BI to work with a large business dataset and convert raw data into actionable insights.

The project covers the complete analytics process from data preparation and exploration to SQL analysis, dashboard development, and business interpretation.
