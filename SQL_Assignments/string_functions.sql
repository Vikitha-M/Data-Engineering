-- Write a query to convert all customer names to uppercase.

select upper(customer_name) as customer_name from orders;

-- Extract the first 5 characters from Product_Name.

select substr(product_name,1,5) as pro_name from orders;

-- Find the length of each Customer_Name.

select length(customer_name) as lenth_cust from orders;

-- Replace the word "Rice" with "Premium Rice" in Product_Name.

select replace(product_name,'Rice','premium rice') as updated_prName from orders;

-- Remove leading and trailing spaces from Customer_Name.

select trim(customer_name) as result from orders;

-- Concatenate First_Name and Last_Name as Full_Name.

select first_name ||''||last_name as full_name from orders;

-- Find customers whose names start with 'A'.

select customer_name from ORDERS where customer_name like 'A%';

-- Extract the domain name from Email_ID.

select substr(email_id)

-- Find the position of '@' in Email_ID.

select instr(email_id,'@') as position_of from orders;

-- Reverse the Product_Name.

select reverse(product_name) from orders;

-- Convert the first letter of each word in Product_Name to uppercase.

select initcap(product_name) as PRODUCT_NAME from orders;

-- Extract the last 3 characters from Order_ID.

select substr(order_id,-3) as last_3char from orders;

-- Count how many times letter 'a' appears in Customer_Name.

select length(customer_name) - length(replace(customer_name,'a','')) as count_a from Orders;

-- Mask the last 4 digits of a phone number.

select substr(phone_number,1,length(phone_number)-4) || '****' as masked_number from orders;

-- Split Full_Name into First_Name and Last_Name.

select substr(Full_Name, 1, INSTR(Full_Name, ' ') - 1) AS First_Name,SUBSTR(Full_Name, INSTR(Full_Name, ' ') + 1) AS Last_Name FROM orders;

-- Remove all special characters from Product_Code.


-- Compare two columns ignoring case sensitivity.

select *from orders where upper(customer_name)=upper(product_name);
select *from orders where upper(customer_name)=lower(product_name);
select *from orders where lower(customer_name)=lower(product_name);

-- Find customers whose name contains 'kumar'.

select *from orders where lower(product_name) like '%kumar%';

-- Pad Order_ID with leading zeros to make it 6 digits.

select lpad(order_id,6,'0') from orders;

-- Extract substring between two characters.