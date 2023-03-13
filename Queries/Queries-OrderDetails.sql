-- Order Details
SELECT * FROM orderdetails;

-- Group by order line number
SELECT * 
FROM orderdetails
GROUP BY orderLineNumber
ORDER BY orderLineNumber ASC;

-- Number of each with 
SELECT *, 
	COUNT(orderLineNumber) as "NumberOfOrders"
FROM orderdetails
GROUP BY orderLineNumber
ORDER BY orderLineNumber ASC;

-- *For each order line
-- TABLE: OD-OrderLineStats.csv
SELECT orderLineNumber,
	COUNT(orderLineNumber) AS "NumOrders",
    ROUND(MIN(priceEach), 2) AS "MinPrice",
    ROUND(AVG(priceEach), 2) AS "AvgPrice",
    ROUND(MAX(priceEach), 2) AS "MaxPrice",
    ROUND(STD(priceEach), 2) AS "Std"
FROM orderdetails
GROUP BY orderLineNumber
ORDER BY orderLineNumber;

-- Number of orders each with average price
SELECT orderLineNumber, 
	COUNT(orderLineNumber) AS "NumOrders", 
	ROUND(AVG(priceEach), 2) AS "AveragePrice"
FROM orderdetails
GROUP BY orderLineNumber
ORDER BY orderLineNumber ASC;

-- Group by order number
SELECT orderNumber,
	quantityOrdered
FROM orderdetails
GROUP BY orderNumber
ORDER BY orderNumber ASC;

-- Quantity ordered and price each
SELECT orderNumber,
	quantityOrdered,
    priceEach
FROM orderdetails
ORDER BY orderLineNumber ASC;

-- Amount of each product ordered
SELECT P.productLine,
    SUM(OD.quantityOrdered) AS "amountOrdered"
FROM products P 
	INNER JOIN orderdetails OD ON P.productCode = OD.productCode
GROUP BY P.productLine;

-- Average price statistics
-- TABLE: OD-AvgPriceStats.csv
SELECT P.productLine,
    SUM(OD.quantityOrdered) AS "AmountOrdered",
    ROUND(MIN(OD.priceEach), 2) AS "MinPrice",
    ROUND(AVG(OD.priceEach), 2) AS "AvgPrice",
    ROUND(MAX(OD.priceEach), 2) AS "MaxPrice",
    ROUND(STD(OD.priceEach), 2) AS "Std"
FROM orderdetails OD
	INNER JOIN products P ON OD.productCode = P.productCode
GROUP BY P.productLine;

-- Product line of each order number
-- TABLE: OD-ProdLineNum.csv
SELECT OD.orderNumber,
	OD.orderLineNumber,
    P.productLine,
    P.productCode,
    P.productName,
    P.productScale,
    P.buyPrice,
    P.MSRP,
    OD.quantityOrdered,
    OD.priceEach
FROM orderdetails OD
	INNER JOIN products P ON OD.productCode = P.productCode
ORDER BY OD.orderNumber;

