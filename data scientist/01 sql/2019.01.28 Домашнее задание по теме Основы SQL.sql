SELECT 'ФИО: Уставщикова Ксения Сергеевна' as name;

-- 1.1
SELECT * 
FROM ratings 
LIMIT 10
;

-- 1.2
SELECT * 
FROM links
WHERE imdbid LIKE '%42'
AND movieid BETWEEN 100 AND 1000
LIMIT 10
;

-- 2
SELECT DISTINCT imdbid 
FROM links l
JOIN ratings r
	ON l.movieid = r.movieid
	AND r.rating = 5
 LIMIT 10
;

-- 3.1
SELECT COUNT(DISTINCT l.movieid)
FROM links l
LEFT JOIN ratings r
	ON l.movieid = r.movieid
WHERE r.movieid IS NULL
;

-- 3.2
SELECT ROW_NUMBER() OVER (ORDER BY AVG(rating) DESC), userid, AVG(rating) avg_r
FROM ratings
GROUP BY userid
HAVING AVG(rating) > 3.5
LIMIT 10
;

-- 4.1
SELECT imdbid
FROM links
WHERE movieid IN (SELECT movieid
FROM ratings
GROUP BY movieid
HAVING AVG(movieid) > 3.5)
LIMIT 10
;

-- 4.2
WITH main AS (
	SELECT userid
	FROM ratings
	GROUP BY userid
	HAVING COUNT(*) > 10
	)
SELECT AVG(r.rating)
FROM ratings r, main m
WHERE r.userid = m.userid
;
