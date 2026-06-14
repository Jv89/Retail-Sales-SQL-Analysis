# Retail Sales SQL Analysis

## Project Overview

This project analyzes a relational retail sales database using SQL. The goal is to practice querying multiple business tables and answering practical questions about customers, orders, products, stores, payments, shipments, and data quality.

Unlike a single-table dataset, this database is structured across several related tables. This makes it useful for practicing SQL fundamentals and understanding how tables connect through shared IDs.

## Business Objective

The objective of this project is to explore retail sales operations and answer business questions related to order activity, customer behavior, product sales, store performance, payment activity, shipment status, and documented data quality issues.

This project is designed as a beginner-to-intermediate SQL portfolio project. It focuses on clear, defendable SQL concepts rather than advanced techniques.

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

## Tools Used

- SQL
- SQLite
- DB Browser for SQLite or any SQLite-compatible tool
- GitHub for project documentation

## SQL Skills Practiced

This project focuses on beginner-to-intermediate SQL skills:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `LIMIT`
- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY`
- `HAVING`
- `INNER JOIN`
- Multiple-table joins
- Table aliases
- Basic data quality review

This version intentionally does not use `CASE WHEN` so the focus stays on filtering, aggregation, grouping, and joins.

## Business Questions Answered

The SQL file contains 27 queries organized around the following business questions:

### Data Exploration

1. What sample records are available in each main table?
2. How many records are available in each main table?

### Order Analysis

3. Which orders were completed?
4. Which orders were placed through the Online sales channel?
5. How many orders are there by order status?
6. Which sales channels are used most often?

### Product Analysis

7. Which products have the highest list prices?
8. Which product categories have the highest total item sales?
9. Which product categories generated more than 10,000 in item sales?
10. Which electronics products were sold in orders?
11. Which products sold the highest quantity?

### Customer Analysis

12. How many customers are in each customer segment?
13. Which customers placed orders?
14. Which online orders include customer details?
15. Which customers bought which products?
16. Which customers generated the highest total sales?
17. Which customers placed more than one order?

### Store Analysis

18. Which stores are associated with each order?
19. Which stores generated the highest total sales?
20. Which stores processed more than 10 orders?

### Payment Analysis

21. What is the total payment amount collected?
22. What payment details are connected to each order?
23. Which payment methods are most common?

### Shipment Analysis

24. What shipment details are connected to each order?
25. How many shipments are in each shipping status?

### Relational Analysis

26. How can customers, orders, order items, and products be connected to understand purchase activity?

### Data Quality Review

27. What data quality issues are documented in the database?

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
9. Joins with filters
10. Multiple-table joins
11. Customer, store, and product sales analysis
12. Payment and shipment analysis
13. Data quality review

## How to Use This Project

1. Download or clone this repository.
2. Open the SQLite database file from the `database` folder.
3. Open the SQL file from the `sql` folder.
4. Run each query section by section.
5. Review how each query answers a specific business question.

## Notes

The database was created for practice purposes and is designed to support SQL learning with a realistic retail structure. The main value of this project is demonstrating how to query related tables and turn raw database records into business-friendly results.
