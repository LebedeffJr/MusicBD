SELECT g.title, count(a.name) FROM genre g
JOIN genreartist ga ON ga.genre_id = g.id 
JOIN artist a ON a.id = ga.artist_id
GROUP BY g.title;

SELECT count(t.title) FROM track t 
JOIN album a ON t.album_id = a.id 
WHERE a.release_year BETWEEN 2019 AND 2020;

SELECT a.title, AVG(t.duration) FROM album a 
JOIN track t ON t.album_id = a.id 
GROUP BY a.title ;

SELECT a.name FROM artist a
WHERE a.name NOT IN (
	SELECT a2.name FROM artist a2
	JOIN albumartist aa ON a2.id = aa.artist_id 
	JOIN album a3 ON a3.id = aa.album_id 
	WHERE a3.release_year = 2020);

SELECT c.title FROM collection c 
JOIN trackcollection tc ON tc.collection_id = c.id 
JOIN track t ON tc.track_id = t.id 
JOIN album a ON a.id = t.album_id 
JOIN albumartist aa ON aa.album_id = a.id 
JOIN artist ar ON aa.artist_id = ar.id
WHERE 'Nirvana' IN (ar.name);

SELECT DISTINCT a.title FROM album a
JOIN albumartist aa ON aa.album_id = a.id 
JOIN genreartist ga ON ga.artist_id = aa.artist_id 
GROUP BY a.id, ga.artist_id 
HAVING count(ga.genre_id) > 1;

SELECT t.title FROM track t 
LEFT JOIN trackcollection tc ON tc.track_id = t.id 
WHERE tc.track_id IS NULL;

SELECT a.name FROM artist a
JOIN albumartist aa ON aa.artist_id = a.id 
JOIN album a2 ON a2.id = aa.album_id 
JOIN track t ON t.album_id = aa.album_id 
WHERE t.duration = (SELECT min(t2.duration) FROM track t2);

DELETE FROM track 
WHERE id = 22;

SELECT a.title FROM album a 
JOIN track t ON t.album_id = a.id 
GROUP BY a.id  
HAVING count(t.id) = (
	SELECT count(t2.id) FROM track t2
	GROUP BY t2.album_id 
	ORDER BY 1
	LIMIT 1);

