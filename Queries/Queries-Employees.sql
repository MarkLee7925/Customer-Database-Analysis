SELECT * 
FROM employees
ORDER BY employeeNumber, reportsTO ASC;

-- ALl employees who report to President (employeeNumber = 1002)
SELECT * 
FROM employees
WHERE reportsTO = 1002;

-- Extension > x2000
SELECT *
FROM employees
WHERE extension IN 
	(SELECT extension
	FROM employees
	WHERE extension > "x2000")
ORDER BY lastName;
-- Not null
SELECT *
FROM employees
WHERE extension IN 
	(SELECT extension
	FROM employees
	WHERE extension > "x2000"
    AND reportsTo IS NOT NULL)
ORDER BY lastName;

-- Highest (max) extension
SELECT *
FROM employees
WHERE extension = 
(SELECT MAX(extension)
FROM employees)
LIMIT 1;

-- Job Title not "Sale(s) Manager..."
SELECT *
FROM employees
WHERE jobTitle NOT IN 
	(SELECT jobTitle
	FROM employees
	WHERE jobTitle LIKE "Sales Manager%"
		OR jobTitle LIKE "Sale Manager%");

