
-- 1 	Which genres of music are most popular among customers?--

SELECT 		g.Name AS Genre_Name, COUNT(il.Quantity) AS No_Of_Purchases
FROM 		invoiceline il
JOIN 		track t ON t.TrackId = il.TrackId
JOIN 		genre g ON t.GenreId = g.GenreID
GROUP 		BY g.Name
ORDER 		BY No_Of_Purchases DESC; -- Deriving most popular genre using inner joins for genre, track and invoice line tables --

-----------------------------------------------------------------------------------------------------------------------------------------

-- 2. Are there any underperforming genres that require attention? --

SELECT 		g.Name AS Genre_Name, COUNT(il.Quantity) AS No_Of_Purchases
FROM 		invoiceline il
JOIN 		track t ON t.TrackId = il.TrackId
JOIN 		genre g ON t.GenreId = g.GenreID
GROUP BY 	g.Name
ORDER BY 	No_Of_Purchases ASC
LIMIT 10;   -- Science Fiction, Rock and roll, Comedy are the least prefered genres . Further analysis is in presentation--


-- 3 What is the average revenue per track and album? --

-- Per Track-- 

WITH Sales_info AS (

SELECT 	COUNT(TrackID) AS Number_of_tracks, SUM(UnitPrice*Quantity) AS Total_sales
FROM 	invoiceline

					)
                    
SELECT Total_sales/Number_of_tracks AS Average_sales_revenue_per_track

FROM 	Sales_info;  -- Using CTE to find Average_sales_revenue_per_track which is 1.03944 per track --


-- Per Album-- 

With Sales_info AS (

		SELECT 		COUNT(DISTINCT t.AlbumId) AS no_of_albums,sum(il.UnitPrice * il.Quantity) As Total_sales
		FROM 		invoiceline il
        
        JOIN track t ON t.TrackId = il.TrackId
												)

SELECT 	Total_sales/no_of_albums AS Average_revenue_per_album
FROM	Sales_info;  -- Using CTE to retrieve avg revenue per album--


-----------------------------------------------------------------------------------------------------------------

--  4 What is the prefered length of most preferred music tracks?


SELECT t.Milliseconds, COUNT(il.Quantity) AS Number_of_Purchases
FROM invoiceline il
JOIN track t  ON t.TrackID = il.TrackId
GROUP BY t.Milliseconds
ORDER BY Number_of_Purchases DESC;


---------------------------------------------------------------------------------------------------------------------

-- 5 What are the three most popular playlists and ten most popular tracks?

-- PLaylist--

SELECT 		pl.Name AS Playlist,COUNT(DISTINCT il.InvoiceId) AS No_of_purchases
FROM 		invoiceline il
JOIN 		playlisttrack pt  ON pt.TrackId = il.TrackId
JOIN		playlist pl       ON pl.PlaylistId = pt.PlaylistId
GROUP BY 	pl.Name
ORDER BY	No_of_purchases desc; -- Here used playlist track to join playlist and invoiceline to obtain most popular playlist-- 

-- Track --

SELECT t.name AS Track, COUNT(il.InvoiceId) AS No_of_purchases
FROM 		invoiceline il
JOIN 		track t ON t.TrackId = il.TrackId
GROUP BY 	t.Name
ORDER BY	No_of_purchases desc; -- Used inner join to find most purchased track using track and invoiceline tables--

---------------------------------------------------------------------------------------------------------------------

--  6. Which media type is the most preferred?-- 

SELECT m.name AS Media_type, COUNT(il.InvoiceId) AS No_of_purchases
FROM 		invoiceline il
JOIN		track t ON t.TrackId = il.TrackId
JOIN 		mediatype m ON t.MediaTypeId = m.MediaTypeId
GROUP BY 	m.Name
ORDER BY	No_of_purchases desc; -- Joining Mediatype, Track and invoice line using inner join to find most prefered media Type--

----------------------------------------------------------------------------------------------------------------------------

-- 7. Who are the five most popular artists?--

SELECT 		a.name AS Artist_name, COUNT(il.InvoiceId) AS No_of_purchases
FROM 		invoiceline il
JOIN		track t ON t.TrackId = il.TrackId
JOIN 		album al ON al.AlbumId = t.AlbumId
JOIN		artist a ON al.AlbumId = a.ArtistId
GROUP BY 	a.Name
ORDER BY	No_of_purchases desc; -- Using inner join to connect Album, Artis, Album and invoiceline tables to retrieve most fav artist--
