-- Retail Sales SQL Analysis
-- Database: retail_sales.sqlite
-- SQL dialect: SQLite

------------------------------------------------------------
-- 1. Data Exploration
-- What tables and fields are available for analysis?
------------------------------------------------------------

SELECT *
FROM Customers
LIMIT 10;

SELECT *
FROM Orders
LIMIT 10;

SELECT *
FROM Order_Items
LIMIT 10;

SELECT *
FROM Products
LIMIT 10;

SELECT *
FROM Stores
LIMIT 10;

SELECT *
FROM Payments
LIMIT 10;

SELECT *
FROM Shipments
LIMIT 10;


------------------------------------------------------------
-- 2. Portfolio Size
-- How many records are available in each main table?
------------------------------------------------------------

SELECT COUNT(*) AS total_customers
FROM Customers;

SELECT COUNT(*) AS total_orders
FROM Orders;

SELECT COUNT(*) AS total_order_items
FROM Order_Items;

SELECT COUNT(*) AS total_products
FROM Products;

SELECT COUNT(*) AS total_stores
FROM Stores;


------------------------------------------------------------
--3. Which orders were completed?
------------------------------------------------------------

SELECT
    OrderID,
    CustomerID,
    StoreID,
    OrderDate,
    OrderStatus,
    SalesChannel
FROM Orders
WHERE OrderStatus = 'Completed'
ORDER BY OrderDate;


------------------------------------------------------------
--4. Which orders were placed through the Online sales channel?
------------------------------------------------------------

SELECT
    OrderID,
    CustomerID,
    StoreID,
    OrderDate,
    OrderStatus,
    SalesChannel
FROM Orders
WHERE SalesChannel = 'Online'
ORDER BY OrderDate;


------------------------------------------------------------
--5. Which products have the highest list prices?
------------------------------------------------------------

SELECT
    ProductID,
    ProductName,
    Category,
    Brand,
    ListPrice
FROM Products
ORDER BY ListPrice DESC
LIMIT 10;


------------------------------------------------------------
--6. What is the total payment amount collected?
------------------------------------------------------------

SELECT
    ROUND(SUM(Amount), 2) AS total_payment_amount,
    ROUND(AVG(Amount), 2) AS average_payment_amount,
    MIN(Amount) AS minimum_payment_amount,
    MAX(Amount) AS maximum_payment_amount
FROM Payments;


------------------------------------------------------------
--7. How many orders are there by order status?
------------------------------------------------------------

SELECT
    OrderStatus,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY OrderStatus
ORDER BY total_orders DESC;


------------------------------------------------------------
--8. Which sales channels are used most often?
------------------------------------------------------------

SELECT
    SalesChannel,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY SalesChannel
ORDER BY total_orders DESC;


------------------------------------------------------------
--9. How many customers are in each customer segment?
------------------------------------------------------------

SELECT
    CustomerSegment,
    COUNT(*) AS total_customers
FROM Customers
GROUP BY CustomerSegment
ORDER BY total_customers DESC;


------------------------------------------------------------
-- 10. Which product categories have the highest total item sales?
------------------------------------------------------------

SELECT
    p.Category,
    ROUND(SUM(oi.Quantity * oi.UnitPrice - oi.DiscountAmount), 2) AS total_item_sales,
    SUM(oi.Quantity) AS total_quantity_sold
FROM Order_Items oi
JOIN Products p
    ON oi.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY total_item_sales DESC;


------------------------------------------------------------
-- Which product categories generated more than 10,000 in item sales?
------------------------------------------------------------

SELECT
    p.Category,
    ROUND(SUM(oi.Quantity * oi.UnitPrice - oi.DiscountAmount), 2) AS total_item_sales,
    SUM(oi.Quantity) AS total_quantity_sold
FROM Order_Items oi
JOIN Products p
    ON oi.ProductID = p.ProductID
GROUP BY p.Category
HAVING SUM(oi.Quantity * oi.UnitPrice - oi.DiscountAmount) > 10000
ORDER BY total_item_sales DESC;


------------------------------------------------------------
-- Which customers placed orders?
------------------------------------------------------------

SELECT
    o.OrderID,
    o.OrderDate,
    o.OrderStatus,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.City,
    c.State
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate;


------------------------------------------------------------
-- Which stores are associated with each order?
------------------------------------------------------------

SELECT
    o.OrderID,
    o.OrderDate,
    o.SalesChannel,
    st.StoreID,
    st.StoreName,
    st.Region,
    st.StoreType
FROM Orders o
JOIN Stores st
    ON o.StoreID = st.StoreID
ORDER BY o.OrderDate;


------------------------------------------------------------
-- Which products were included in each order?
------------------------------------------------------------

SELECT
    oi.OrderID,
    p.ProductID,
    p.ProductName,
    p.Category,
    oi.Quantity,
    oi.UnitPrice,
    oi.DiscountAmount
FROM Order_Items oi
JOIN Products p
    ON oi.ProductID = p.ProductID
ORDER BY oi.OrderID;


------------------------------------------------------------
-- What payment details are connected to each order?
------------------------------------------------------------

SELECT
    o.OrderID,
    o.OrderDate,
    o.OrderStatus,
    p.PaymentMethod,
    p.PaymentStatus,
    p.Amount
FROM Orders o
JOIN Payments p
    ON o.OrderID = p.OrderID
ORDER BY o.OrderDate;


------------------------------------------------------------
-- What shipment details are connected to each order?
------------------------------------------------------------

SELECT
    o.OrderID,
    o.OrderDate,
    o.OrderStatus,
    sh.ShipDate,
    sh.DeliveryDate,
    sh.Carrier,
    sh.ShippingStatus,
    sh.ShippingCost
FROM Orders o
JOIN Shipments sh
    ON o.OrderID = sh.OrderID
ORDER BY o.OrderDate;


------------------------------------------------------------
-- Which online orders include customer details?
------------------------------------------------------------

SELECT
    o.OrderID,
    o.OrderDate,
    o.SalesChannel,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.City,
    c.State
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
WHERE o.SalesChannel = 'Online'
ORDER BY o.OrderDate;


------------------------------------------------------------
-- Which electronics products were sold in orders?
------------------------------------------------------------

SELECT
    oi.OrderID,
    p.ProductName,
    p.Category,
    p.Brand,
    oi.Quantity,
    oi.UnitPrice
FROM Order_Items oi
JOIN Products p
    ON oi.ProductID = p.ProductID
WHERE p.Category = 'Electronics'
ORDER BY oi.OrderID;


------------------------------------------------------------
-- Which customers bought which products?
------------------------------------------------------------

SELECT
    o.OrderID,
    o.OrderDate,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    p.ProductName,
    p.Category,
    oi.Quantity,
    oi.UnitPrice
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
JOIN Order_Items oi
    ON o.OrderID = oi.OrderID
JOIN Products p
    ON oi.ProductID = p.ProductID
ORDER BY o.OrderDate;


------------------------------------------------------------
-- Which customers generated the highest total sales?
------------------------------------------------------------

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    ROUND(SUM(oi.Quantity * oi.UnitPrice - oi.DiscountAmount), 2) AS total_sales,
    COUNT(DISTINCT o.OrderID) AS total_orders
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN Order_Items oi
    ON o.OrderID = oi.OrderID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY total_sales DESC
LIMIT 10;


------------------------------------------------------------
-- Which stores generated the highest total sales?
------------------------------------------------------------

SELECT
    st.StoreID,
    st.StoreName,
    st.Region,
    ROUND(SUM(oi.Quantity * oi.UnitPrice - oi.DiscountAmount), 2) AS total_sales,
    COUNT(DISTINCT o.OrderID) AS total_orders
FROM Stores st
JOIN Orders o
    ON st.StoreID = o.StoreID
JOIN Order_Items oi
    ON o.OrderID = oi.OrderID
GROUP BY st.StoreID, st.StoreName, st.Region
ORDER BY total_sales DESC;


------------------------------------------------------------
-- Which products sold the highest quantity?
------------------------------------------------------------

SELECT
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(oi.Quantity) AS total_quantity_sold,
    ROUND(SUM(oi.Quantity * oi.UnitPrice - oi.DiscountAmount), 2) AS total_sales
FROM Products p
JOIN Order_Items oi
    ON p.ProductID = oi.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category
ORDER BY total_quantity_sold DESC
LIMIT 10;


------------------------------------------------------------
-- Which customers placed more than one order?
------------------------------------------------------------

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS total_orders
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(o.OrderID) > 1
ORDER BY total_orders DESC;


------------------------------------------------------------
-- Which stores processed more than 10 orders?
------------------------------------------------------------

SELECT
    st.StoreID,
    st.StoreName,
    st.Region,
    COUNT(o.OrderID) AS total_orders
FROM Stores st
JOIN Orders o
    ON st.StoreID = o.StoreID
GROUP BY st.StoreID, st.StoreName, st.Region
HAVING COUNT(o.OrderID) > 10
ORDER BY total_orders DESC;


------------------------------------------------------------
-- Which payment methods are most common?
------------------------------------------------------------

SELECT
    PaymentMethod,
    COUNT(*) AS total_payments,
    ROUND(SUM(Amount), 2) AS total_amount
FROM Payments
GROUP BY PaymentMethod
ORDER BY total_payments DESC;


------------------------------------------------------------
-- How many shipments are in each shipping status?
------------------------------------------------------------

SELECT
    ShippingStatus,
    COUNT(*) AS total_shipments,
    ROUND(SUM(ShippingCost), 2) AS total_shipping_cost
FROM Shipments
GROUP BY ShippingStatus
ORDER BY total_shipments DESC;


------------------------------------------------------------
-- What data quality issues are documented in the database?
------------------------------------------------------------

SELECT
    IssueID,
    TableName,
    ColumnName,
    IssueType,
    Severity,
    DetectedDate,
    Notes
FROM Data_Quality_Issues
ORDER BY Severity, DetectedDate;
