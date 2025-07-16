# DSA-documentation
This is my first project when I started learning data Analysis, with the incubator hub 

## Project Topic : Kultra Mega Stores Inventory Analysis

### Project Overview
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

### 1. Which product category had the highest sales

```sql
select product_category, sum ( sales ) as [Total number of products]
from [KMS Sql Case Study]
group by Product_Category 
order by [Total number of products] desc;
```




  

  





