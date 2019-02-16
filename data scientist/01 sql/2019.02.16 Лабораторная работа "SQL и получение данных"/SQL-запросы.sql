-- a. Вывести список названий департаментов и количество главных врачей в каждом из этих департаментов
SELECT d.name dep_name, COUNT(DISTINCT e.chief_doc_id) q_chief 
FROM departament d
	JOIN employee e
		ON d.id = e.departament_id
GROUP BY d.id, d.name
ORDER BY d.name
;

-- b. Вывести список департаментов, в которых работают 3 и более сотрудников (id и название департамента, количество сотрудников)
SELECT d.id dep_id, d.name dep_name, COUNT(e.id) q_staff 
FROM departament d
	JOIN employee e
		ON d.id = e.departament_id
GROUP BY d.id, d.name
HAVING count(e.id) >= 3
ORDER BY d.id
;

-- c. Вывести список департаментов с максимальным количеством публикаций (id и название департамента, количество публикаций)
SELECT d.id dep_id, d.name dep_name, SUM(e.num_public) q_public 
FROM departament d
	JOIN employee e
		ON d.id = e.departament_id
GROUP BY d.id, d.name
HAVING SUM(e.num_public) = (
  SELECT SUM(num_public) 
  FROM employee
  GROUP BY departament_id
  ORDER BY 1 DESC
  LIMIT 1
)
ORDER BY d.id
;

-- d. Вывести список сотрудников с минимальным количеством публикаций в своем департаменте (id и название департамента, имя сотрудника, количество публикаций)
SELECT d.id dep_id, d.name dep_name, e.name emp_name, e.num_public 
FROM departament d
	JOIN employee e
		ON d.id = e.departament_id
	JOIN  (
  			SELECT departament_id, MIN(num_public) num_public 
      		FROM employee
  			GROUP BY departament_id
	) main_min
		ON e.departament_id = main_min.departament_id
		AND e.num_public = main_min.num_public
ORDER BY d.id, e.name
;

-- e. Вывести список департаментов и среднее количество публикаций для тех департаментов, в которых работает более одного главного врача (id и название департамента, среднее количество публикаций)
SELECT d.id dep_id, d.name dep_name, ROUND(AVG(e.num_public), 2) q_chief 
FROM departament d
	JOIN employee e
		ON d.id = e.departament_id
GROUP BY d.id, d.name
HAVING COUNT(DISTINCT e.chief_doc_id) > 1
ORDER BY d.id
;
