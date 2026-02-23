# MySQL-data-cleaning-project

# SQL Data Cleaning Project

This repository contains a mini project demonstrating **data cleaning and preprocessing** using **MySQL** on a small e-commerce dataset.

## Project Overview

- Imported raw CSV dataset into MySQL
- Handled duplicates, NULLs, and empty values
- Cleaned the `amount` column (removed text, negative values, converted to DECIMAL)
- Standardized mixed date formats (`DD-MM-YYYY`, `YYYY/MM/DD`, `YYYY-MM-DD`) into MySQL DATE format
- Cleaned customer emails and payment status

## Dataset

- **Raw Data:** 6 records  
- **Cleaned Data:** 3 valid records  

> Small dataset but demonstrates real-world data cleaning challenges.

## Key SQL Techniques Used

- `TRIM()` to remove extra spaces  
- `REPLACE()` to clean text in numeric fields  
- `DELETE` to remove duplicates / NULL / invalid values  
- `STR_TO_DATE()` & `SUBSTRING()` for date standardization  
- Safe `UPDATE` and `ALTER TABLE` operations  

## Learning Outcomes

- Hands-on experience with MySQL data cleaning  
- Handling errors like **Safe Update Mode (1175)** and **Incorrect datetime / decimal values**  
- Understanding step-by-step industry-level data cleaning workflow  

## Next Steps

- Perform **KPI analysis** and derive insights from cleaned data  
- Visualize trends and patterns from the e-commerce dataset

## Tags

`#SQL #DataCleaning #MySQL #DataAnalytics #MCA #LearningInPublic`
