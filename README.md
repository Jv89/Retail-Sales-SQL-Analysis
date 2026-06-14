# Retail Sales SQL Analysis

## Project Overview

This project analyzes a relational retail sales database using SQL. 

Unlike a single-table dataset, this database is structured across several related tables. This makes it useful for practicing SQL fundamentals and understanding how tables connect through shared IDs.

## Business Objective

The objective of this project is to explore retail sales operations and answer basic business questions such as:

1. How many customers, orders, products, and stores are in the database?
2. Which orders were completed or placed online?
3. Which products have the highest prices?
4. Which sales channels are used most often?
5. Which product categories generate the highest sales?
6. Which categories pass a minimum sales threshold?
7. Which customers placed orders?
8. Which stores are connected to each order?
9. Which products were included in each order?
10. Which customers, stores, and products generated the highest sales?
11. Which payment methods are most common?
12. What shipment statuses are present in the database?
13. What data quality issues are documented?

## Dataset

The project uses a SQLite database with the following tables:

- `Customers`
- `Orders`
- `Order_Items`
- `Products`
- `Stores`
- `Payments`
- `Shipments`
- `Data_Quality_Issues`

## SQL Skills Practiced

This project focuses on the following:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY`
- `HAVING`
- `INNER JOIN`
- Multiple-table joins
- Aliases
- Basic data quality review

## Project Structure

```text
Retail-Sales-SQL-Analysis/
├── README.md
├── database/
│   └── retail_sales.sqlite
└── sql/
    └── Retail_Sales_Analysis.sql
```

## Analysis Sections

The SQL file is organized into the following sections:

1. Data exploration
2. Portfolio size
3. Filtering with `WHERE`
4. Sorting and `LIMIT`
5. Aggregations
6. `GROUP BY`
7. `HAVING`
8. Basic joins
9. Multiple-table joins
10. Customer, store, and product sales analysis
11. Payment and shipment analysis
12. Data quality review

## Example Queries Included

Examples of questions answered in the SQL file include:

- How many orders are in the database?
- Which sales channels are used most often?
- Which product categories generate the highest total sales?
- Which categories generated more than 10,000 in sales?
- Which customers placed online orders?
- Which electronics products were sold?
- Which customers generated the highest total sales?
- Which stores processed more than 10 orders?
- Which payment methods are most common?

## How to Use This Project

1. Download or clone this repository.
2. Open the SQLite database file from the `database` folder.
3. Open the SQL file from the `sql` folder.
4. Run each query section by section.
5. Review how each query answers a business question.

## Notes

The database was created for practice purposes and is designed to support SQL learning with a realistic retail structure. The main value of this project is demonstrating how to query related tables and turn raw database records into business-friendly results.
