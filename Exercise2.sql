use Chinook;

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
ORDER BY Bytes ASC;
/*Create a query that returns the First and last name of customers whose email address is a Canadian (.ca) email address*/
SELECT FirstName, LastName FROM Customer
WHERE Email like '%.ca';


/* Write a query that displays the average amount spent per order in the database. Round the result to two decimal places. */
SELECT ROUND(AVG(Total), 2) as 'Average Spent' 
FROM Invoice
GROUP BY CustomerId;
/* Using your query from 1, modify it so that it displays the average amount of money that each customer has spent in the chinook database */
SELECT ROUND(AVG(Total), 2) as 'Average Spent' 
FROM Invoice
GROUP BY CustomerId;
/* Using your query from (a), modify it so that it only displays customers whose average order amount is greater than 6 dollars. Sort the results from highest to lowest amounts. */
SELECT ROUND(AVG(Total), 2) AS 'Average Spent'
FROM Invoice
GROUP BY CustomerID
HAVING 'Average Spent' > 6;


/* Write a query that displays the total number of tracks. */
SELECT SUM(TrackID) AS 'Total Number of Tracks' 
FROM Track;
/* Using your query from 2, modify it so that it displays the number of tracks per album. */
SELECT COUNT(AlbumId) AS 'Tracks Per Album' 
FROM Track
GROUP BY AlbumId;
/* Using your query from a, modify it so that it displays the number of tracks per artist. */
SELECT Composer, COUNT(TrackId) AS 'Number of Tracks Per Artist'
FROM Track
GROUP BY Composer;
/* Using your query from b, modify it so that it displays the artist(s) with the most tracks. */
SELECT Composer, COUNT(TrackId) AS 'Number of Tracks Per Artist'
FROM Track
GROUP BY Composer
ORDER BY 'Number of Tracks Per Artist' DESC;


/* Display the track name, genre name, and mediatype name for each track in the database. */
SELECT Track.Name, Genre.Name, MediaType.Name 
FROM Track
INNER JOIN Genre on Track.GenreId = Genre.GenreId
	INNER JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId;
/* Display the first name and last name of each customer along with the name of each track that they have purchased and the date the track was purchased on. Sort the results by customer last name, then first name, then name of the track. */
SELECT LastName, FirstName, Track.Name, InvoiceDate
FROM Track
INNER JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
	INNER JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
		INNER JOIN Customer ON Invoice.CustomerId = Customer.CustomerId 
/* Display the name of each track along with the name of the album it’s from and the name of the artist who performs it. */
SELECT Track.Name, Album.Title as 'Album', Artist.Name as 'Artist'
FROM Artist
INNER JOIN Album on Artist.ArtistId = Album.ArtistId
	INNER JOIN Track on Album.AlbumId = Track.AlbumId;
