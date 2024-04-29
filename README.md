# Retail_Price

This is an ETL project using Python libraries. The dataset has approximately 10000 records of the USA market of different products. In this project, the dataset has been directly downloaded from the Kaggle website. Using the libraries available in Python performed ETL. A few columns have been removed from the actual dataset which were not required and a few of the calculated columns were added for better data analysis. The transformed data is loaded to the MySQL database using the Python library(sqlalchemy). In the MySQL database, the data has been used for analysing and collecting useful insights. Few questions have been answered through the data. 

find the top 10 highest revenue-generating products

find the top 5 highest-selling products in each region

find month-over-month growth comparison for sales in 2022 vs 2023

for each category which month had the highest sales

which sub-category had the highest growth by profit in 2023 compared to 2022

While solving these queries few of the advanced concepts of MySQL were used such as Windows functions, subqueries, common table expression (CTE) and some basic functions were also used.

NOTE: To directly download dataset from Kaggle you need to download kaggle api from kaggles' website and keep that downloaded api in the ".kaggle" named folder.
