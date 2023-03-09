-- Select essential information
SELECT * FROM payments;
SELECT DISTINCT * FROM payments;
-- No duplicates

-- Distinct Customer Number and Credit Limit
-- TABLE: PM-OverCreditLimit.csv
SELECT DISTINCT P.customerNumber,
	P.amount AS "TotalAmount",
    O.orderDate,
    O.requiredDate,
    O.shippedDate,
    (O.requiredDate - O.shippedDate) AS "daysEarly",
	C.creditLimit,
    IF((P.amount > C.creditLimit), TRUE, FALSE) AS "overCreditLimit"
FROM payments P
	INNER JOIN customers C ON P.customerNumber = C.customerNumber
    INNER JOIN orders O ON P.customerNumber = O.customerNumber
WHERE (requiredDate - shippedDate) IS NOT NULL
GROUP BY P.customerNumber
ORDER BY P.customerNumber, P.amount, C.creditLimit, daysEarly;
-- Customers order on different days! Therefore, don't select SUM(P.amount), use P.amount.
