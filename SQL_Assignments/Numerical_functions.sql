-- Round Unit_Price to 2 decimal places.

select round(unit_price,2) from orders;

-- Find total sales per order.

select order_id,sum(UNIT_PRICE) as total from orders group by order_id;

-- Calculate average order value.

select avg(unit_price) from orders;

-- Find highest product price.

select max(unit_price) from orders;

-- Find lowest product price.

select min(unit_price) from orders;

-- Calculate percentage discount applied.



-- Find modulus of Quantity divided by 2.

select Quantity, mod(Quantity,2) as modules from orders;

-- Convert negative values to positive.

select abs(unit_price) from orders;

-- Truncate price without rounding.


-- Find square root of total sales.

select round(sqrt(sum(unit_price)),2) from orders;

-- Calculate exponential value of a number.

selct exp(5) as exponential_value from dual;

-- Calculate power of 2^5.

select pow(2,5) as power_value from dual

-- Find absolute difference between two prices.

select abs(unit_price-50) from orders;

-- Calculate sales growth percentage.

select round((newsales-oldsales)/oldsales)*100) as growth_perc from orders;

-- Find random number between 1 and 100.

SELECT TRUNC(DBMS_RANDOM.VALUE(1, 101)) AS random_number FROM dual;

-- Divide total sales by number of orders.

select Sum(Unit_Price * Quantity) / COUNT(Order_ID) 
AS total_sales  FROM orders;


-- Find ceiling value of price.

select ceil(unit_price) from orders;

-- Find floor value of price.

select floor(unit_price) from orders;

-- Convert decimal to integer.

select round(unit_price) from orders;

-- Calculate compound interest.

SELECT Principal,Rate,Time,(Principal * POWER((1 + Rate/100), Time)) - Principal AS Compound_Interest FROM dual;