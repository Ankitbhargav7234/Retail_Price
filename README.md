# Retail_Price

This is an ETL project using python libraries. The dataset has approx 10000 records of USA market of different products. In this project the dataset has been directly downloaded from Kaggle website. Using the libraries available in python performed ETL. Few columns have been removed from the actual dataset which were not required and few of the calculated columns were added for the better analysis of the data. The tranformed data is loaded to mysql database using python library(sqlalchemy). In the mysql database the data has been used for analysing and collecting the useful insights. There are few questions that have been answer through the data. 

find top 10 highest revenue generating products

find top 5 highest selling products in each region

find month over month growth comparison for sales in 2022 vs 2023

for each category which month had highest sales

which sub category had highest growth by profit in 2023 compared to 2022

While solving these queries few of the advance concepts of mysql were used such as windows functions, subqueries, common table expression (cte) and some basic functions were also used.
