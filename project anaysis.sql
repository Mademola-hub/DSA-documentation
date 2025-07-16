Create database project_analysis

select * from [KMS Sql Case Study]

alter table [KMS Sql Case Study]
alter column sales decimal ( 10, 2 )

alter table [KMS Sql Case Study]
alter column Discount decimal ( 10 , 2 )

alter table [KMS Sql Case Study]
alter column unit_price decimal ( 10 , 2 )

alter table [KMS Sql Case Study]
alter column profit decimal ( 10 , 2 )

alter table [KMS Sql Case Study]
alter column shipping_cost decimal ( 10 , 2 )

alter table [KMS Sql Case Study]
alter column product_base_margin decimal ( 10 , 2 )

----Which product category had the highest sales----

select product_category, sum ( sales ) as [Total number of products]
from [KMS Sql Case Study]
group by Product_Category 
order by [Total number of products] desc;



---. What are the Top 3 and Bottom 3 regions in terms of sales? ----

----top 3 Highest sales---

select top 3 * from (
select Region, sum ( sales ) as Total_Sales
from [KMS Sql Case Study]
group by Region
) as sales
order by total_sales desc;

----top 3 lowest sales---

select top 3 * from (
select region, sum ( sales ) as Total_sales 
from [KMS Sql Case Study]
group by Region
) as sales 
order by Total_sales asc;

----- What were the total sales of appliances in Ontario?-----
---grouping by region---

select Region, Product_Sub_Category ,
sum (sales) as [Total sales of appliances in Ontario ]
from (
select * from [KMS Sql Case Study]
where Product_Sub_Category = 'Appliances' and  Region = 'Ontario'  ) as sal
group by Region , Product_Sub_Category
---grouping by province---
select Province, Product_Sub_Category , sum (sales) as Total_sales_of_appliances_in_ontario
from (
select * from [KMS Sql Case Study]
where Product_Sub_Category = 'Appliances' and  Province = 'Ontario'  ) as sal
group by Province, Product_Sub_Category;

------

select top 10 * from (
select Customer_Name, sum ( sales ) as [ Total Revenue per customer ]
from [KMS Sql Case Study]
group by Customer_Name
) as TRPC
ORDER BY [ Total Revenue per customer ] ASC;


----KMS incurred the most shipping cost using which shipping method?---


select Ship_mode, sum ( shipping_cost ) as [ ship cost ]
from [KMS Sql Case Study]
group by Ship_Mode
order by [ ship cost ] desc;

----case senerio 2-------
------Who are the most valuable customers, and what products or services do they typically
--purchase-----

select Customer_Name, Product_Sub_Category, Product_Name, sum ( sales ) as Total_sales,
sum ( profit ) as Total_profit,
sum ( order_quantity ) as Total_qty,
count ( * ) as times_purchased
from [KMS Sql Case Study]
where Customer_Name in (
select top 2 Customer_Name
from [KMS Sql Case Study]
group by Customer_Name
order by sum ( profit ) desc
)
group by customer_Name, Product_Sub_Category, Product_Name
order by Customer_Name, Total_profit desc;

---Which small business customer had the highest sales?---

select top 1 * from
(select Customer_Name, Customer_Segment ,
sum ( sales ) as [ Total sales by small Business ]
from [KMS Sql Case Study]
where customer_segment = 'Small Business'
group by Customer_Name , Customer_Segment 
) as smallbiz
order by [ Total sales by small Business ] desc;

----Which Corporate Customer placed the most number of orders in 2009 – 2012?---

select * from [KMS Sql Case Study]

select top 1 * from (
select Customer_Name , Customer_Segment,
count ( order_id ) as [ number of orders]
from [KMS Sql Case Study]
where Customer_Segment = 'Corporate'
group by Customer_Name , Customer_Segment
) as cor
order by [ number of orders] desc;

---Which consumer customer was the most profitable one?---

select top 1 * from (select Customer_Name, Customer_Segment, sum ( profit ) [Total profit by Consumer ]
from [KMS Sql Case Study]
where Customer_Segment ='consumer'
group by Customer_Name, Customer_Segment
) as [total profit ]
order by [Total profit by Consumer ] desc;

--Which customer returned items, and what segment do they belong to?--

SELECT DISTINCT Customer_Name, Customer_Segment
FROM [KMS Sql Case Study]
WHERE Profit < 0;
----11----

select  Order_Priority, Ship_Mode,
avg ( Shipping_Cost) 
as [ Average Shipping Cost ]
from [KMS Sql Case Study]
group by Order_Priority, Ship_Mode
order by Order_Priority, [ Average Shipping Cost ] desc;
























