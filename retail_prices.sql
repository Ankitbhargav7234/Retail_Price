use retail_price;
create table `orders.csv` (
order_id int primary key,
order_date date,
ship_mode varchar(20),
segment varchar(20),
country varchar(20),
city varchar(20),
state varchar(20),
postal_code varchar(20),
region varchar(20),
category varchar(20),
sub_category varchar(20),
product_id varchar(20),
quantity int,
discount decimal(7,2),
sale_price decimal(7,2),
profit decimal(7,2))
 
select * from `orders.csv`;

# find top 10 highest revenue generating products;
select product_id, sum(sale_price) from `orders.csv` group by 1 order by 2 desc limit 10;

# find top 5 highest selling products in each region
with cte as
(select region, product_id, sum(sale_price) as sales
from `orders.csv` 
group by region,product_id)
select * from (
select *
, row_number() over(partition by region order by sales desc) as rn 
from cte) A 
where rn<=5;

# find month over month growth comparison for sales in 2022 vs 2023

with cte as(
select year(order_date) as order_year, month(order_date) as order_month,
sum(sale_price) as sales
from `orders.csv`
group by year(order_date),month(order_date)
)
select order_month,
sum(case when order_year=2022 then sales else 0 end) as sales_2022,
sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte
group by order_month
order by order_month
;

# for each category which month had highest sales
with cte as(
select category, order_date,  
sum(sale_price) as sales
from `orders.csv` 
group by category,order_date)
select * from (
select *, 
row_number() over(partition by category order by sales desc) as rn 
from cte) A 
where rn=1;

# which sub category had highest growth by profit in 2023 compared to 2022

with cte as(
select sub_category,year(order_date) as order_year,
sum(sale_price) as sales
from `orders.csv`
group by sub_category, year(order_date)
),
cte2 as (
select sub_category,
sum(case when order_year=2022 then sales else 0 end) as sales_2022,
sum(case when order_year=2023 then sales else 0 end) as sales_2023
from cte
group by sub_category)
select *,
(sales_2023 - sales_2022)*100/sales_2022
from cte2 
order by (sales_2023 - sales_2022)*100/sales_2022 desc
limit 1; 