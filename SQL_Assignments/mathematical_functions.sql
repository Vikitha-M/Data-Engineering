-- 1. Find sine value of an angle.

select round(sin(30*(3.14/180)),5) sin_value;

-- 2. Find cosine value of an angle.

select round(cos(30*(3.14/180)),5) cos_value;

-- 3. Find tangent value.

select round(tan(30*(3.14/180)),5) tan_value;

-- 4. Convert degrees to radians.

select round(30*(3.14/180),2) degree_to_radians;

-- 5. Convert radians to degrees.

select round(0.5233*(180/3.14),2) radians_to_degrees;

-- 6. Find logarithm (base 10) of a number.

select log(10,100) log_value;

-- 7. Find natural log of a number.

select LN(3) natural_log;

-- 8. Find square of a number.

select 5*5 square_value, power(5,2) power_function;

-- 9. Find cube of a number.

select 5*5*5 cube_value, power(5,3) power_function;

-- 10. Calculate factorial of a number.

select 5*4*3*2*1 factorial_of_5;

-- 11. Find greatest value among three numbers.

select greatest(25,20,80);

-- 12. Find least value among three numbers.

select least(25,20,80); 

-- 13. Calculate variance of sales.

select VARIANCE(quantity*Unit_Price) as sales_variance from orders;

-- 14. Calculate standard deviation of sales.

select stddev(quantity*Unit_Price) as sales_deviation from orders;

-- 15. Find average deviation.

SELECT AVG(ABS(sales - avg_sal)) AS avg_deviation
FROM (SELECT QUANTITY*unit_price as sales, AVG(QUANTITY*unit_price) over() AS avg_sal FROM ORDERS);

-- 16. Calculate geometric mean.

SELECT EXP(AVG(LN(QUANTITY*unit_price))) AS geometric_mean
FROM ORDERS WHERE QUANTITY*unit_price > 0;

-- 17. Calculate harmonic mean.

SELECT COUNT(QUANTITY*unit_price) / SUM(1 / QUANTITY*unit_price) AS harmonic_mean
FROM ORDERS WHERE QUANTITY*unit_price IS NOT NULL AND QUANTITY*unit_price <> 0;

-- 18. Find sum of squares.

select sum(power(quantity,2)) sum_of_squares from ORDERS; 

-- 19. Calculate correlation between two columns.

select corr(quantity*unit_price, unit_price) correlation from orders;

-- 20. Calculate regression slope.

select REGR_SLOPE(quantity*unit_price, unit_price) reg_slope from orders;