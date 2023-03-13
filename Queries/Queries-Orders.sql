-- Alter "status" column to avoid confusion
ALTER TABLE Orders RENAME COLUMN status TO orderStatus;

-- Select essential information
SELECT orderNumber,
	customerNumber,
	orderDate,
    requiredDate,
    shippedDate,
    orderStatus
FROM orders
ORDER BY orderNumber;

-- Period
SELECT orderNumber,
	customerNumber,
	orderDate,
    requiredDate,
    shippedDate,
    (requiredDate - orderDate) AS "period"
FROM orders
WHERE orderStatus = "Shipped"
ORDER BY orderNumber;

-- If orders shipped has been delayed
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

-- Other orders
SELECT orderNumber,
	customerNumber,
	orderDate,
    requiredDate,
    shippedDate,
    orderStatus
FROM orders
WHERE orderStatus != "Shipped"
ORDER BY orderNumber;

-- daysEarly < 0
SELECT orderNumber,
	customerNumber,
	orderDate,
    requiredDate,
    shippedDate,
    (requiredDate - shippedDate) AS "daysEarly",
    IF((shippedDate > requiredDate), TRUE, FALSE) AS "delayed"
FROM orders
WHERE (requiredDate - shippedDate) < 0
ORDER BY orderNumber;
-- 	orderNumber	customerNumber	orderDate	requiredDate	shippedDate	daysEarly	delayed
-- 	10165	    148	            2003-10-22	2003-10-31	    2003-12-26	-195	    1
