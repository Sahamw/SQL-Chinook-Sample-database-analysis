
-- Sales analysis-- 

-- 1. What are the total sales revenues for each year in the dataset? -- 


ALTER table invoice
ADD COLUMN Year INT;  -- Add year collumn

UPDATE invoice
SET Year = year(InvoiceDate); -- Update year collumn

Select 	Year As Year,
		SUM(Total) As Total_revenue
From invoice
GROUP BY YEAR;   -- Extract annual income--

-----------------------------------------------------------------------------------------

-- 2.How do sales revenues vary across different genres of music?--

SELECT 	g.Name as Genre,sum(il.UnitPrice * il.Quantity) As Totalrevenue
FROM 	invoiceline il
JOIN	Track t ON il.TrackId = t.TrackId
JOIN 	Genre g On g.GenreId  = t.GenreId
Group By g.Name;           -- Using Innter join to join Invoice line with track ID using foreign key Track ID and join Genre and Track using foreign key Genre ID

----------------------------------------------------------------------------------------------

-- Can we identify any seasonal trends or patterns in sales? --

ALTER TABLE invoice
ADD COLUMN Season Varchar (10);  -- Create Season collumn

Update invoice  
SET Season =
Case

WHEN month(InvoiceDate) IN (12,1,2) THEN 'Winter'
WHEN month(InvoiceDate) IN (3,4,5)  Then 'Spring'
WHEN month(InvoiceDate) IN (6,7,8)  THEN 'Summer'
WHEN month(InvoiceDate) IN (9,10,11)  THEN 'Autumn'

END;         -- Add seasons to the table for analysis--

/* Alternatively can also use if statement  

SELECT 
    IF(MONTH(InvoiceDate) IN (12,1,2), 'Winter',
	IF(MONTH(InvoiceDate) IN (3,4,5), 'Spring',
	IF(MONTH(InvoiceDate) IN (6,7,8), 'Summer',
	IF(MONTH(InvoiceDate) IN (9,10,11), 'Autumn', NULL)
	))) AS Season,
    
    COUNT(*) AS SalesCount
FROM invoice
GROUP BY Season; */


Select Season,
Count(*) As Sales_by_season
From invoice
Group by season;   -- Anaysing Seasonal sales--


------------------------------------------------------------------------------------------------------------------------

-- 4 Which are the top-selling tracks and albums, and what are their respective revenues?--

SELECT t.name as Track_name , sum(il.quantity) as Numbers_Sold
FROM invoiceline il
JOIN track t ON il.TrackId = t.TrackId
GROUP BY t.name;   -- Using Innter join to join Invoice line with track ID using foreign key Track ID --


------------------------------------------------------------------------------------------------------------------------

-- 5 Which composer is the most popular among customers?--

SELECT 	t.Composer as Composer,sum(il.UnitPrice * il.Quantity) As Total_revenue
FROM 	invoiceline il
JOIN	Track t ON il.TrackId = t.TrackId
Group By t.Composer
order by Total_revenue Desc;   -- Result indicates high revenue generated from tracks without composer name and it has been renamed as unknown for analytical purposes since no composer sourse is available --

UPDATE track
SET Composer = 'Unknown'
WHERE Composer IS NULL; -- Updating Null values in composer column--

-----------------------------------------------------------------------------------------------------------------------------------

-- 6.Which artist brings the highest revenue?--

SELECT 		a.ArtistId,a.Name AS ArtistName,
			SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM 		artist a

JOIN 		album al ON a.ArtistId = al.ArtistId
JOIN  		track t ON al.AlbumId = t.AlbumId
JOIN 		invoiceline il ON t.TrackId = il.TrackId
GROUP BY 	a.ArtistId, a.Name
ORDER BY 	TotalRevenue DESC; -- Using Inner joins to to find artist with highest revenue from Artist, Album and Invoiceline tables-- 

