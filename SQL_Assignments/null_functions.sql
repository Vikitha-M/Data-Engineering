-- Replace NULL price with 0.

select NVL(unit_price,0) from orders; 

--Replace NULL Customer_Name with 'Unknown'.

select NVL(CUSTOMER_NAME,'Unknown') from orders; 

--Count NULL values in Product_Name.

select count(*) from ORDERS where PRODUCT_NAME is null;

--Find rows where Order_Date is NULL.

select * from orders where order_date is NULL;

--Use COALESCE to return first non-null value.

select coalesce(customer_name, product_category, product_name) as non_null_value from orders;

--Use NVL to replace NULL values.

select NVL(unit_price,0) from orders; 

--Use IFNULL function.

select distinct NULLIF(unit_price,0) from orders; 

--Check if column is NULL.

select case when customer_name is NULL then 'Column is NULL' else 'Not NULL value' end as customer_name from orders; 

--Check if column is NOT NULL.

select case when customer_name is not NULL then 'Column is not NULL' end as customer_name from orders; 

--Use NULLIF between two columns.

select NULLIF(PRODUCT_NAME,PRODUCT_CATEGORY) as NULLIF_value from orders; 

--Replace blank values with NULL.

select replace('',NULL);

--Count non-null values.

select count(distinct customer_name) from orders where customer_name is not null; 

--Filter records where price is NULL or 0.

select * from orders where unit_price is NULL or unit_price = 0;

--Use CASE to handle NULL values.

select distinct case when customer_name is null then 'Name not Available' else customer_name end as customer_name from orders; 

--Compare NULL values properly.

select source. order_id, ref.order_id from orders source
join orders ref on nvl(source.order_date,sysdate) = nvl(ref.order_date,sysdate); 

--Handle NULL in aggregation.

select product_name, sum(nvl(quantity,1)*nvl(unit_price,1)) as Total_Sale from orders group by product_name;

--Find average excluding NULL values.

select avg(unit_price) average_Sales from orders where unit_price is not null;

--Find sum ignoring NULL values.

select sum(QUANTITY) No_of_units from orders where unit_price is not null;

--Identify columns containing NULL using metadata.


--Convert NULL to default system date.

select NVL(order_date,sysdate) order_date from orders;