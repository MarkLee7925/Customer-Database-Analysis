-- *** MACHINE LEARNING DATASETS *** --

-- Average price per order number
-- TABLE: CM-AvgPriceOrdNum.csv
SELECT OD.orderNumber,
    SUM(OD.quantityOrdered) AS "ProductsOrdered",
	ROUND(AVG(OD.priceEach), 2) AS "AvgPrice"
FROM orderdetails OD
	INNER JOIN products P ON OD.productCode = P.productCode
GROUP BY OD.orderNumber
ORDER BY OD.orderNumber;

-- Orders with product lines
-- TABLE: CM-OrderShipped.csv
SELECT orderNumber,
	customerNumber,
	orderDate,
    requiredDate,
    shippedDate,
    (requiredDate - shippedDate) AS "daysEarly",
    IF((shippedDate > requiredDate), TRUE, FALSE) AS "delayed"
FROM orders
WHERE orderStatus = "Shipped"
ORDER BY orderNumber;

-- Correlation with orders shipped and early
-- TABLE: CM-CredLimit.csv
SELECT OD.orderNumber,
	O.customerNumber,
	O.orderDate,
    O.requiredDate,
    O.shippedDate,
    O.orderStatus,
    (O.requiredDate - O.shippedDate) AS "daysEarly",
    IF((O.shippedDate > O.requiredDate), TRUE, FALSE) AS "delayed",
    SUM(OD.quantityOrdered) AS "productsOrdered",
	ROUND(AVG(OD.priceEach), 2) AS "avgPrice",
    SUM(OD.quantityOrdered * P.buyPrice) AS "totalAmount",
    C.creditLimit,
	(C.creditLimit - SUM(OD.quantityOrdered * P.buyPrice)) AS "balance"
FROM orderdetails OD
	INNER JOIN orders O ON O.orderNumber = OD.orderNumber
	INNER JOIN products P ON OD.productCode = P.productCode
    INNER JOIN customers C ON O.customerNumber = C.customerNumber
WHERE O.orderStatus = "Shipped"
	OR O.orderStatus = "Resolved"
GROUP BY OD.orderNumber
ORDER BY OD.orderNumber;
-- 307 rows

-- Product line of each order number
-- TABLE: CM-AvgPriceNum.csv
SELECT OD.orderNumber,
	OD.orderLineNumber,
    P.productLine,
    P.productCode,
    P.productName,
    P.productScale,
    P.buyPrice,
    P.MSRP,
    OD.quantityOrdered,
    OD.priceEach,
    O.orderDate,
    O.requiredDate,
    O.shippedDate,
    O.OrderStatus,
    (O.requiredDate - O.shippedDate) AS "daysEarly"
FROM orderdetails OD
	INNER JOIN products P ON OD.productCode = P.productCode
    INNER JOIN orders O ON OD.orderNumber = O.orderNumber
WHERE O.OrderStatus = "Shipped" 
	OR O.OrderStatus = "Resolved"
ORDER BY OD.orderNumber;
-- 2,818 rows

