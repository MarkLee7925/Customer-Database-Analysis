-- Check for duplicate customers
SELECT DISTINCT * 
FROM customers;
SELECT contactFirstName, contactLastName, customerNumber
FROM customers;
-- No duplicate values found!

-- Number of customers by country
SELECT country, COUNT(country) AS 'Amount'
FROM customers
GROUP BY country
ORDER BY Amount DESC;

-- USA only
SELECT *
FROM customers
WHERE country = "USA";

-- Germany only
SELECT *
FROM customers
WHERE country = "Germany";

-- France only
SELECT *
FROM customers
WHERE country = "France";

-- Credit limit > average
SELECT AVG(creditLimit) AS "Average"
FROM customers;
-- Above average
SELECT *
FROM customers
WHERE creditLimit > (SELECT AVG(creditLimit) FROM customers)
ORDER BY creditLimit;

-- Customers and Credit Limit > 0
SELECT customerNumber, 
	contactFirstName,
    contactLastName,
	creditLimit
FROM customers
WHERE creditLimit > 0
ORDER BY customerNumber;
