SELECT 'ФИО: Уставщикова Ксения Сергеевна' as name;

-- Оконные функции.

SELECT userid, movieid, 
(rating - MIN(rating) OVER (PARTITION BY userid))/(MAX(rating) OVER (PARTITION BY userid) - MIN(rating) OVER (PARTITION BY userid)) normed_rating, 
AVG(rating) OVER (PARTITION BY userid) avg_rating
FROM ratings r
LIMIT 30
;

                                                                                                              
