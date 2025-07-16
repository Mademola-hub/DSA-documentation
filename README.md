## 📄 Table of Contents

- [🧠 DSA-documentation](#-dsa-documentation)
- [📁 Project Overview](#-project-overview)
- [🧾 Data Source](#-data-source)
- [🛠️ Tools Used](#️-tools-used)
- [🔍 Methodology](#-methodology)
- [🖼️ Project Analysis, Questions, Queries, and Visuals](#️-project-analysis-questions-queries-and-visuals)
  - [1. Highest Selling Product Category](#1-which-product-category-had-the-highest-sales)
  - [2. Top and Bottom 3 Sales Regions](#2-what-are-the-top-3-and-bottom-3-regions-in-terms-of-sales)
  - [3. Appliance Sales in Ontario](#3-what-were-the-total-sales-of-appliances-in-ontario)
  - [4. Revenue Advice for Bottom 10 Customers](#4-advise-the-management-of-kms-on-what-to-do-to-increase-the-revenue-from-the-bottom-10-customers)
  - [5. Highest Shipping Cost by Method](#5-kms-incurred-the-most-shipping-cost-using-which-shipping-method)
  - [6. Most Valuable Customers](#6-who-are-the-most-valuable-customers-and-what-products-or-services-do-they-typically-purchase)
  - [7. Highest Sales - Small Business Customer](#7-which-small-business-customer-had-the-highest-sales)
  - [8. Most Orders by Corporate Customers (2009–2012)](#8-which-corporate-customer-placed-the-most-number-of-orders-in-2009--2012)
  - [9. Most Profitable Consumer Customer](#9-which-consumer-customer-was-the-most-profitable-one)
  - [10. Customers Who Returned Items](#10-which-customer-returned-items-and-what-segment-do-they-belong-to)
  - [11. Shipping Cost vs Order Priority](#11-if-the-delivery-truck-is-the-most-economical-but-the-slowest-shipping-method)
- [🚚 Shipping Cost Analysis](#-shipping-cost-analysis)
- [🔎 Detailed Business Insights](#-detailed-business-insights)
- [📌 Summary](#-summary)
- [📦 Deliverables](#-deliverables)
- [🙋 About the Analyst](#-about-the-analyst)
  
# :brain: DSA-documentation SQL analysis 
This is my first project when I started learning data Analysis, with the incubator hub 

## Project Topic :  🏬 Kultra Mega Stores Inventory Analysis

### 📁 Project Overview
This report summarizes key insights extracted from data exported from the SQL Server. The data includes multiple analyses covering product sales, customer behavior, shipping costs, regional performance, and discount impact.The aim is to identify revenue drivers, understand customer segments, and uncover opportunities for cost optimization and targeted marketing.

### 🧾 Data Source
The primary data sources used here is the KMS Sql Case Study.csv and this was given as aproject data provided by the organizer of the Data skill up Africa, which is the **INCUBATOR HUB** and this was provided through the canvas learning platform.

## 🛠️ Tools Used

- **SQL** [Download here](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
   (Structured Query Language) – Used for all data extraction, transformation, and analysis steps.

# 🔍 Methodology

## 1. Database Setup
- **Database Creation**
  The projects started by creating a database called or named project_analysis.
  
- **Data inportaton and extraction** 
The raw data which was stored in a csv format was imported into the SQL server to create a table and to allow for visualization.

- **Data Cleaning**  
  Unnecessary columns were removed, and missing values were checked. Categorical values 
  were standardized.

  ```sql
  --- SQL project_analysis
  --- create databse
  Create database project_analysis;
  ```

--- Table manipulation , cleaning and alteration

```sql
alter table [KMS Sql Case Study]
alter column sales decimal ( 10, 2 );

alter table [KMS Sql Case Study]
alter column Discount decimal ( 10 , 2 );

alter table [KMS Sql Case Study]
alter column unit_price decimal ( 10 , 2 );

alter table [KMS Sql Case Study]
alter column profit decimal ( 10 , 2 );

alter table [KMS Sql Case Study]
alter column shipping_cost decimal ( 10 , 2 );

alter table [KMS Sql Case Study]
alter column product_base_margin decimal ( 10 , 2 );
```
## 🖼️ Project Analysis, questions, query  and  Visuals

## Case Scenario I

### 1. Which product category had the highest sales?

```sql
select product_category, sum ( sales ) as [Total number of products]
from [KMS Sql Case Study]
group by Product_Category 
order by [Total number of products] desc;
```
<img width="1019" height="470" alt="Screenshot 2025-07-16 123744" src="https://github.com/user-attachments/assets/26856bb6-cdc0-4dfd-9ae9-b02663269d68" />

### 2. What are the Top 3 and Bottom 3 regions in terms of sales?
--- Top 3 Highest sales region in terms of sales
```sql
select top 3 * from (
select Region, sum ( sales ) as Total_Sales
from [KMS Sql Case Study]
group by Region
) as sales
order by total_sales desc;
```
<img width="1012" height="207" alt="Screenshot 2025-07-16 125204" src="https://github.com/user-attachments/assets/a19e431f-15a4-4d68-8a03-c696c1ea568f" />

---Top 3 Lowest sales region in terms of sales
```sql
select top 3 * from (
select region, sum ( sales ) as Total_sales 
from [KMS Sql Case Study]
group by Region
) as sales 
order by Total_sales asc;
```
<img width="1020" height="167" alt="Screenshot 2025-07-16 125635" src="https://github.com/user-attachments/assets/866d8348-6419-41e7-b017-f9973897efe5" />

### 3. What were the total sales of appliances in Ontario?

---grouping by region---

```sql
select Region, Product_Sub_Category ,
sum (sales) as [Total sales of appliances in Ontario ]
from (
select * from [KMS Sql Case Study]
where Product_Sub_Category = 'Appliances' and  Region = 'Ontario'  ) as sal
group by Region , Product_Sub_Category
```

---alternatively
```sql
---grouping by province---
select Province,, Product_Sub_Category , sum (sales) as Total_sales_of_appliances_in_ontario
from (
select * from [KMS Sql Case Study]
where Product_Sub_Category = 'Appliances' and  Province = 'Ontario'  ) as sal
group by Province, , Product_Sub_Category;
```
<img width="1016" height="240" alt="Screenshot 2025-07-16 130236" src="https://github.com/user-attachments/assets/a7f93740-42a1-4ffb-b618-b014716fbbaf" />

### 4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers

```sql
select top 10 * from (
select Customer_Name, sum ( sales ) as [ Total Revenue per customer ]
from [KMS Sql Case Study]
group by Customer_Name
) as TRPC
ORDER BY [ Total Revenue per customer ] ASC;
```
<img width="1019" height="300" alt="Screenshot 2025-07-16 130720" src="https://github.com/user-attachments/assets/afe57729-5448-49f5-a98e-fefd75516b75" />

### Advising the management on how to stimulate growth

**To increase revenue from KMS's bottom 10 customers, management should focus on understanding each customer's specific needs and behavior.**

**Key strategies include:**

- Personalized Engagement: Offer customized discounts, product recommendations (upselling and cross-selling), and educational content based on their past purchases and likely needs.

- Proactive Relationship Building: Reach out to them, gather feedback (surveys), and provide exceptional customer service to build trust and address any pain points.

- Incentivization: Implement loyalty programs, time-limited promotions, and referral programs to encourage repeat business and higher spending.

- Product Optimization: Analyze if there are product gaps or opportunities to create attractive bundles that offer more value.

By implementing these targeted approaches, KMS can convert these lower-spending customers into more valuable assets.

## 5. KMS incurred the most shipping cost using which shipping method?
```sql
select Ship_mode, sum ( shipping_cost ) as [ ship cost ]
from [KMS Sql Case Study]
group by Ship_Mode
order by [ ship cost ] desc;
```
<img width="1013" height="171" alt="Screenshot 2025-07-16 132324" src="https://github.com/user-attachments/assets/59ddc4fd-6f2b-4917-a5da-b748051e59da" />

## Case Scenario II
## 6. Who are the most valuable customers, and what products or services do they typically purchase?
```sql

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
```
---Note: I decided to use top 2 because the output will be too high to screenshot
<img width="1021" height="574" alt="Screenshot 2025-07-16 134035" src="https://github.com/user-attachments/assets/e8b8eb60-10c6-4124-be1e-a55af7bfe4e1" />
<img width="1019" height="157" alt="Screenshot 2025-07-16 134050" src="https://github.com/user-attachments/assets/d9a2700f-8dbe-4573-8d80-d206fae0cca5" />

## 7. Which small business customer had the highest sales?
```sql
select top 1 * from
(select Customer_Name, Customer_Segment ,
sum ( sales ) as [ Total sales by small Business ]
from [KMS Sql Case Study]
where customer_segment = 'Small Business'
group by Customer_Name , Customer_Segment 
) as smallbiz
order by [ Total sales by small Business ] desc;
```
<img width="1019" height="196" alt="Screenshot 2025-07-16 134808" src="https://github.com/user-attachments/assets/93d2a16b-733a-4149-a360-a3e15142e868" />

## 8. Which Corporate Customer placed the most number of orders in 2009 – 2012?
```sql
select top 1 * from (
select Customer_Name , Customer_Segment,
count ( order_id ) as [ number of orders]
from [KMS Sql Case Study]
where Customer_Segment = 'Corporate'
group by Customer_Name , Customer_Segment
) as cor
order by [ number of orders] desc;
```
<img width="1020" height="199" alt="Screenshot 2025-07-16 135148" src="https://github.com/user-attachments/assets/37f09b53-2ca0-4c54-aec4-632d01615631" />

## 9. Which consumer customer was the most profitable one?
```sql
select top 1 * from (select Customer_Name, Customer_Segment, sum ( profit ) [Total profit by Consumer ]
from [KMS Sql Case Study]
where Customer_Segment ='consumer'
group by Customer_Name, Customer_Segment
) as [total profit ]
order by [Total profit by Consumer ] desc;
```
<img width="1019" height="182" alt="Screenshot 2025-07-16 135509" src="https://github.com/user-attachments/assets/b3d3b320-30ca-4087-b7b1-eda83baf7148" />

## 10. Which customer returned items, and what segment do they belong to?
```sql
SELECT DISTINCT Customer_Name, Customer_Segment
FROM [KMS Sql Case Study]
WHERE Profit < 0;
```
 :link: [customer returned items.xlsx](https://github.com/user-attachments/files/21259079/customer.returned.items.xlsx)

--- I decided to upload a document because the amount of output generateed was high which necessitate that i copy my output in excel for proper visualization


## 11. If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer
```sql
select  Order_Priority, Ship_Mode,
avg ( Shipping_Cost) 
as [ Average Shipping Cost ]
from [KMS Sql Case Study]
group by Order_Priority, Ship_Mode
order by Order_Priority, [ Average Shipping Cost ] desc;
```
 :link: <img width="1022" height="408" alt="Screenshot 2025-07-16 142153" src="https://github.com/user-attachments/assets/5349f00e-0f63-42d2-bd5a-a28026f16d32" />

## 🚚 Shipping Cost Analysis

### ❓ Are KMS’s Shipping Methods Cost-Effective?

**Short Answer: No.**

There’s a clear disconnect between how KMS describes its shipping methods and what the data actually shows.


### 📦 What KMS Says:
- **Delivery Truck** = Cheapest, but slowest  
- **Express Air** = Fastest, but most expensive


### 🔍 What the Data Shows:
- **Delivery Truck** is actually the **most expensive option**, with average costs ranging from **$43 to $47** across all order priorities.
- **Express Air**, expected to be costliest, is consistently **much cheaper**, averaging only **$6 to $8**.
- **Regular Air** is often the **cheapest option overall**, staying around **$7 to $8**.


### 💡 Implications:
- KMS may be **wasting money** by using costly Delivery Trucks for regular or critical shipments.
- There may be **data issues**, **hidden logistics costs**, or poor **shipping**

## 🔎 Detailed Business Insights

### 💼 Revenue Growth Opportunity
- The **bottom 10 customers** (e.g., *Jeremy Farry*, *Natalie DeCherney*) present an immediate opportunity for growth through targeted **retention and engagement strategies**.


### 👥 Segment Performance
- **Corporate** and **Small Business** segments contain high-value customers like:
  - *Adam Hart* – 27 orders
  - *Dennis Kane* – over $75K in sales
- **Consumer segment** can also be profitable:
  - *Emily Phan* – over $34K in profit

### 📦 Product Category Strengths & Weaknesses
- **Top Categories**:  
  - *Technology* and *Furniture* drive significant revenue
- **Lagging Category**:
  - *Office Supplies* underperform — may need a new marketing or pricing approach
- **High-Profit Products**:
  - *Polycom ViewStation*, *HP Laserjet Copier*
- **Unprofitable Items**:
  - Some products are sold **at a loss**, which signals an urgent need to review:
    - Pricing strategy  
    - Cost of goods  
    - Possible discontinuation

### 🌍 Regional Performance
- **Strongest Regions**:
  - *West* region leads in overall sales
  - *Ontario* performs strongly, especially in *Appliances*
  - *Yukon* performs well among smaller territories
- **Weaker Regions**:
  - *Nunavut* and *Prairie* lag in performance — may indicate untapped potential or low market size

### 🚚 Shipping Cost Impact
- **Delivery Truck** is the **most expensive mode**, heavily impacting profit — especially on lower-priced products
- **Regular Air** also has high total cost
- **Express Air** has **lower total cost**, possibly due to better efficiency or limited use
- 📌 **Actionable Recommendation**:
  - Negotiate better shipping rates
  - Adjust pricing models to cover higher shipping costs
  - Encourage more cost-effective shipping choices at checkout

### 📌 Summary
KMS demonstrates clear **strengths** in:
- Product categories (*Technology, Furniture*)
- High-value customers in all segments
- Top-performing regions like *West* and *Ontario*

But must address **gaps** in:
- Low-engagement customers
- Underperforming products and regions
- Expensive logistics (especially Delivery Truck)

By optimizing these areas, **Kultra Mega Stores** can boost profitability, customer retention, and overall operational efficiency.

## 📦 Deliverables
- `KMS SQL Case Study.csv`
-  SQL query scripts

[ Download here ](https://drive.google.com/drive/folders/17feFYJDSVt9AKOJYwVxN40CvtZrHEeh5)

## 🙋 About the Analyst
**Matthew Ademola Oluwatosin**  
**Aspiring Data Analyst**

[Back to Top ](https://github.com/Mademola-hub/DSA-documentation#-table-of-contents)
    













  

  





