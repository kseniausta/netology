psql -U postgres -c "SELECT 'ФИО: Уставщикова Ксения Сергеевна' as name;";

-- Оконные функции.

psql -U postgres -c "
SELECT userid, movieid, 
(rating - MIN(rating) OVER (PARTITION BY userid))/(MAX(rating) OVER (PARTITION BY userid) - MIN(rating) OVER (PARTITION BY userid)) normed_rating, 
AVG(rating) OVER (PARTITION BY userid) avg_rating
FROM ratings r
LIMIT 30
;";

-- ETL
-- удаление таблиц
--psql -U postgres -c "DROP TABLE keywords;";
--psql -U postgres -c "DROP TABLE top_rated_tags;";

--"ВАША КОМАНДА СОЗДАНИЯ ТАБЛИЦЫ"
psql -U postgres -c "
CREATE TABLE IF NOT EXISTS keywords (
id bigint,
tags text
);";

--"ВАША КОМАНДА ЗАЛИВКИ ДАННЫХ В ТАБЛИЦу"
psql -U postgres -c "\\copy keywords FROM '/usr/local/share/netology/raw_data/keywords.csv' DELIMITER as ',' CSV HEADER";

--"ЗАПРОС3"
psql -U postgres -c "
WITH top_rated as (SELECT movieId, AVG(rating) avg_rating
FROM ratings
GROUP BY movieId
HAVING COUNT(DISTINCT userId) > 50
ORDER BY avg_rating DESC, movieId ASC
LIMIT 150) 
SELECT tr.movieId, k.tags INTO top_rated_tags
FROM keywords k, top_rated tr
WHERE k.id = tr.movieId
;";

--"ВАША КОМАНДА ВЫГРУЗКИ ТАБЛИЦЫ В ФАЙЛ"
psql -U postgres -c "\\copy (SELECT * FROM top_rated_tags) TO 'ust_top_rated_tags.csv' WITH CSV HEADER DELIMITER as E'\t'";

