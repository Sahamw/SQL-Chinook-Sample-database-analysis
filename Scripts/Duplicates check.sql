
SELECT *
FROM ALBUM; -- checking the table

-------------------------------------------

SELECT  Title,
		ArtistId
FROM  	album
GROUP By  AlbumID,
		  Title,
          ArtistId

HAVING COUNT(*)>1; -- Check for duplicates table album

Select*
From artist; -- Check table artist

-------------------------------------------------


SELECT  Name
FROM  	artist
GROUP By  Name

HAVING COUNT(*)>1; -- Check for duplicates table  artist


-------------------------------------------------------

Select *
From customer; -- Check customer table

--------------------------------------------------------

Select 		FirstName,
			LastName,
            Company,
            Address,
            City,
            State,
            Country,
            PostalCode
From   		Customer
Group by	FirstName,
			LastName,
            Company,
            Address,
            City,
            State,
            Country,
            PostalCode
Having Count(*) >1; -------- Check duplicates in customer table


------------------------------------------------------------------

Select 		LastName,
			FirstName,
            Title,
            ReportsTo,
            BirthDate,
            HireDate,
            Address
From 		employee
Group by 	LastName,
			FirstName,
            Title,
            ReportsTo,
            BirthDate,
            HireDate,
            Address
Having Count(*)>1; -----  Check duplicates in employee table

--------------------------------------------------------------------

Select 		Name 
From		Genre
Group by	Name
having count(*)>1;  -- Check duplicates in genre table

-------------------------------------------------------------------------

Select CustomerId,
	   InvoiceDate,
       BillingAddress,
       BillingCity,
       BillingState,
       BillingCountry,
       BillingPostalCode,
       Total
From   invoice
group by CustomerId,
	   InvoiceDate,
       BillingAddress,
       BillingCity,
       BillingState,
       BillingCountry,
       BillingPostalCode,
       Total
       
Having count(*)>1 ; -- Check duplicates in invoice table

-------------------------------------------------------------			

Select InvoiceLineId,
		TrackId,
        UnitPrice,
        Quantity
From	invoiceline
Group by	InvoiceLineId,
			TrackId,
			UnitPrice,
			Quantity
Having Count(*) > 1;	---- Check duplicates in invoice table

--------------------------------------------------------------------

Select 		Name
From		mediatype
Group by	Name
Having Count(*) > 1;	---- Check duplicates in  mediatype

---------------------------------------------------------------------
Select 		PlaylistId,
			Name
From		playlist
Group by	PlaylistId,
			Name
Having Count(*) > 1;	---- Check duplicates in playlist

-----------------------------------------------------------------------

Select 		PlaylistId,
			TrackId
From		playlisttrack
Group by	PlaylistId,
			TrackId
Having Count(*) > 1;	---- Check duplicates in playlisttrack

-----------------------------------------------------------------------------
Select 		Name,
			AlbumId,
            MediaTypeId,
            GenreId,
            Composer,
            Milliseconds,
            Bytes,
            UnitPrice
	
From		track
Group by	Name,
			AlbumId,
            MediaTypeId,
            GenreId,
            Composer,
            Milliseconds,
            Bytes,
            UnitPrice
Having Count(*) > 1;	---- Check duplicates in ptrack


#### Database has no duplicates
