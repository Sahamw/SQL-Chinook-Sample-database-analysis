SELECT 		t.Name AS Track, g.Name AS Genre,  a.Name AS Artist
FROM 		track t 
LEFT JOIN 	genre g 	ON 	g.GenreId = t.GenreId
LEFT JOIN	album al 	ON  al.AlbumId = t.AlbumId
LEFT JOIN	artist a 	ON  a.ArtistId = al.ArtistId; -- Using Left Join to extract data of Track name , Genre and artist from respective tables-- 

