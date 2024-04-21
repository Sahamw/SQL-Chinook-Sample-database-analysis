----- Table Album--------------

Select AlbumId,
		Title,
        ArtistId

From	album
Where	AlbumId = NULL;
--------------------------------------------------
Select AlbumId,
		Title,
        ArtistId

From	album
Where	Title = NULL;
----------------------------------------------------
Select AlbumId,
		Title,
        ArtistId

From	album
Where	ArtistId = NULL;

----------------------------------------------------------------------------------------

----- Table artist--------------

Select ArtistId,
		Name 
From	artist
Where ArtistId = NULL;

--------------------------------------------------------------

Select ArtistId,
		Name 
From	artist
Where Name = NULL;

-----------------------------------------------------------------------------------------


----- Table customer--------------

Select *
From	customer
Where CustomerId IS NULL OR TRIM(CustomerId)= '';

-----------------------------------------------------

Select *
From	customer
WHERE FirstName IS NULL OR TRIM(FirstName) = '';


--------------------------------------------------

Select *
From	customer
WHERE LastName IS NULL OR TRIM(LastName) = '';

-----------------------------------------------------

SELECT *
FROM customer
WHERE company IS NULL OR TRIM(company) = ''; 

-- There are 49 missing company details which are treated as not required for analysing required analysis

-----------------------------------------------------

SELECT *
FROM customer
WHERE Address IS NULL OR TRIM(Address) = ''; 

----------------------------------------------------

SELECT *
FROM customer
WHERE city IS NULL OR TRIM(city) = ''; 

-----------------------------------------------------

SELECT *
FROM customer
WHERE Country IS NULL OR TRIM(Country) = ''; 

-----------------------------------------------------

SELECT *
FROM customer
WHERE SupportRepId IS NULL OR TRIM(SupportRepId) = '';

-----------------------------------------------------------------------------------------


----- Table Employee--------------

SELECT *
FROM employee
WHERE EmployeeId IS NULL OR TRIM(EmployeeId) = '';


-------------------------------------------------------------------

SELECT *
FROM employee
WHERE FirstName IS NULL OR TRIM(FirstName) = '';

--------------------------------------------------------------------

SELECT *
FROM employee
WHERE LastName IS NULL OR TRIM(LastName) = '';

--------------------------------------------------------------------

SELECT *
FROM employee
WHERE Title IS NULL OR TRIM(Title) = '';


--------------------------------------------------------------------

SELECT *
FROM employee
WHERE City IS NULL OR TRIM(City) = '';


-------------------------------------------------------------------

SELECT *
FROM employee
WHERE Country IS NULL OR TRIM(Country) = '';

-----------------------------------------------------------------------------------------


----- Table Genre--------------

SELECT *
FROM Genre
WHERE Name IS NULL OR TRIM(Name) = '';

-----------------------------------------------------------------------------------------


----- Table invoice--------------

SELECT *
FROM invoice
WHERE CustomerId IS NULL OR TRIM(CustomerId) = '';


---------------------------------------------------------

SELECT *
FROM invoice
WHERE InvoiceDate IS NULL OR TRIM(InvoiceDate) = '';

--------------------------------------------------------

SELECT *
FROM invoice
WHERE BillingCity IS NULL OR TRIM(BillingCity ) = '';

---------------------------------------------------------


SELECT *
FROM invoice
WHERE BillingCountry IS NULL OR TRIM(BillingCountry ) = '';


-----------------------------------------------------------------------------------------


----- Table mediatype--------------

SELECT *
FROM mediatype
WHERE Name IS NULL OR TRIM(Name ) = '';

-----------------------------------------------------------------------------------------


----- Table Playlist--------------

SELECT *
FROM playlist
WHERE Name IS NULL OR TRIM(Name ) = '';

-----------------------------------------------------------------------------------------


----- Table Track--------------

SELECT *
FROM track
WHERE Name IS NULL OR TRIM(Name ) = '';
