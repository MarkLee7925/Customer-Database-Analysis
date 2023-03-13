-- Select essential information
SELECT * FROM products;
SELECT DISTINCT * FROM products;
-- No duplicates

-- Essential information
-- TABLE: P-essential.csv
SELECT productCode,
	productLine,
    productScale,
	productVendor,
    quantityInStock,
    buyPrice,
    MSRP
FROM products;

-- Total Quantity
-- TABLE: P-TotalQuant.csv
SELECT productLine,
	SUM(quantityInStock) AS "totalQuantity"
FROM products
GROUP BY productLine;

-- Group by product scale
-- TABLE: P-ProdScale.csv
SELECT P.productScale,
	SUM(P.quantityInStock) AS "totalQuantity",
    SUM(OD.quantityOrdered) AS "amountOrdered",
    (SUM(P.quantityInStock) - SUM(OD.quantityOrdered)) AS "amountLeft"
FROM products P
	INNER JOIN orderdetails OD ON P.productCode = OD.productCode
GROUP BY P.productScale
ORDER BY P.productScale;

-- Amount left
-- TABLE: P-AmtLeft.csv
SELECT P.productLine,
	SUM(P.quantityInStock) AS "totalQuantity",
    SUM(OD.quantityOrdered) AS "amountOrdered",
    (SUM(P.quantityInStock) - SUM(OD.quantityOrdered)) AS "amountLeft"
FROM products P
	INNER JOIN orderdetails OD ON P.productCode = OD.productCode
GROUP BY productLine;

-- Orders over credit limit
-- TABLE: P-OverCredLimit.csv
SELECT O.customerNumber,
	SUM(OD.quantityOrdered * P.buyPrice) AS "totalAmount",
    C.creditLimit,
    (C.creditLimit - SUM(OD.quantityOrdered * P.buyPrice)) AS "amountLeft",
    IF((SUM(OD.quantityOrdered * P.buyPrice) > C.creditLimit), TRUE, FALSE) AS "overCreditLimit"	
FROM products P
	INNER JOIN orderdetails OD ON P.productCode = OD.productCode
    INNER JOIN orders O ON OD.orderNumber = O.orderNumber
    INNER JOIN customers C ON O.customerNumber = C.customerNumber
GROUP BY O.customerNumber
ORDER BY O.customerNumber;