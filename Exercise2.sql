/*Create a query that returns only customers who have specified a company*/
SELECT * FROM Customer
WHERE Company IS NOT NULL;
/*Create a query that returns only tracks that do not specify a composer.*/
SELECT * FROM Track
WHERE Composer IS NULL;
/*Create a query that returns all tracks that are love songs (ie, contain the word ‘Love’).*/
SELECT * FROM Track
WHERE Name LIKE '%Love%';
/*Create a query that returns all tracks between 1MB and 2MB in size sorted by largest to smallest size.*/
SELECT * FROM Track
WHERE Bytes BETWEEN 1000000 AND 2000000
/*Create a query that returns the First and last name of customers whose email address is a Canadian (.ca) email address*/
SELECT * FROM Customer
WHERE Email like '%.ca';