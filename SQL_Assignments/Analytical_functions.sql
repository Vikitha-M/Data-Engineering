-- Assign row numbers to each order.

select Order_ID,row_number() over (ORDER BY Order_Date) as Row_Num FROM Orders;

-- Rank products by price.

select Product_Name,rank() over (ORDER BY Unit_Price DESC) AS Price_Rank FROM Orders;

-- Dense rank products by sales.

select product_category, sum(quantity * unit_price) as Sales_total, 
dense_rank() over(order by sum(quantity * unit_price)) as slaes_dense_rank from ORDERS
group by PRODUCT_CATEGORY;

-- Find running total of sales

select Order_Date,SUM(Unit_Price * Quantity) OVER (ORDER BY Order_Date) as running_total
from Orders;

-- Calculate cumulative sum by month

select to_char(order_date,'YYYY-MM') as year_month,
sum(order_total) as monthly_totals,
sum(sum(order_total)) over(order by to_char(order_date,'YYYY-MM')) as cumuilative_sum
from oe.orders group by year_month;

-- Find moving average of last 3 days

select order_date, quantity*unit_price as sales_totals, 
avg(quantity*unit_price) over (order by order_date) sale_running_totals from orders
where order_date in (select order_date from orders order by order_date desc fetch first 3 rows only); 

-- Calculate lag of previous day sales

select Order_Date,(Unit_Price * Quantity) as Sales,
lag(Unit_Price * Quantity) OVER (ORDER BY Order_Date) as Previous_Day_Sales from Orders;

-- Calculate lead of next day sales

select Order_Date,(Unit_Price * Quantity) as Sales,lead(Unit_Price * Quantity)
OVER (ORDER BY Order_Date) as Next_Day_Sales from Orders;

-- Find difference between current and previous sale

select Order_Date,(Unit_Price * Quantity) as sales,(Unit_Price * Quantity) - lag(Unit_Price * Quantity)
over (ORDER BY Order_Date) AS Sales_Difference from Orders;

-- Partition sales by region

select Region,sum(Unit_Price * Quantity) over (PARTITION BY Region) as region_Sales from Orders;

-- Find top 3 products per category

select *from (select order_id,product_name,sum(quantity) as total_quantity, ROW_NUMBER() OVER (
            PARTITION BY order_id 
            ORDER BY SUM(quantity) DESC
        ) AS rn
    FROM orders
    GROUP BY order_id, product_name
)
WHERE rn <= 3;

-- Find bottom 2 customers by sales

select *from (select Customer_Name,
            SUM(Unit_Price * Quantity) as Total_Sales,
            RANK() OVER (ORDER BY SUM(Unit_Price * Quantity)) as Rank_Value
        from Orders
    GROUP BY Customer_Name
)
where Rank_Value <= 2;

-- Calculate percentage of total sales

select Order_ID,(Unit_Price * Quantity)/SUM(Unit_Price * Quantity) OVER () * 100 AS Sales_Percentage from Orders;

-- Calculate NTILE distribution of customers (4 groups example)

select Customer_Name,store_location,NTILE(4) OVER (ORDER BY store_location) AS location
from Orders GROUP BY Customer_Name,store_location;

-- Find first order per customer

select *from (select Customer_Name,Order_Date,ROW_NUMBER() OVER (PARTITION BY Customer_Name
ORDER BY Order_Date) as RN from Orders)
where RN = 1;

-- Find last order per customer

select *from (select Customer_Name,Order_Date,ROW_NUMBER() OVER (PARTITION BY Customer_Name
ORDER BY Order_Date DESC) AS RN FROM Orders)
where RN = 1;

-- Calculate average salary within department

select Department, avg(Salary) OVER (PARTITION BY Department) AS Avg_Department_Salary
from hr.EMPLOYEE;

-- Compare current row with max value in partition

select product_category,Unit_Price,MAX(Unit_Price) OVER (PARTITION BY unit_price) AS Max_value
from Orders;

-- Identify duplicate records using ROW_NUMBER

select *from (select Order_ID,ROW_NUMBER() OVER (PARTITION BY Order_ID ORDER BY Order_Date) as RN
FROM Orders) where RN > 1;

-- Find cumulative distinct count (example: distinct customers over time)

select Order_Date,count(distinct Customer_Name) OVER (Order_Date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
AS Cumulative_Distinct_Customers FROM Orders;