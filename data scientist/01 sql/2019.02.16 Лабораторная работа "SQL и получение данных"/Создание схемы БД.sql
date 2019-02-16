-- Используя редактор сайта https://www.db-fiddle.com создать схему базы данных (создать таблицы и заполнить их). Использовать синтаксис PostgreSQL 10.

CREATE TABLE departament
(ID INTEGER PRIMARY KEY,
NAME VARCHAR) ;

CREATE TABLE employee (
  ID INTEGER PRIMARY KEY,
  DEPARTAMENT_ID INTEGER,
  CHIEF_DOC_ID INTEGER,
  NAME VARCHAR,
  NUM_PUBLIC INTEGER,
  FOREIGN KEY (DEPARTAMENT_ID) REFERENCES departament(ID)
  );
  
insert into departament values
('1', 'Therapy'),
('2', 'Neurology'),
('3', 'Cardiology'),
('4', 'Gastroenterology'),
('5', 'Hematology'),
('6', 'Oncology');
 
insert into employee values
('1', '1', '1', 'Kate', 4),
('2', '1', '1', 'Lidia', 2),
('3', '1', '1', 'Alexey', 1),
('4', '1', '2', 'Pier', 7),
('5', '1', '2', 'Aurel', 6),
('6', '1', '2', 'Klaudia', 1),
('7', '2', '3', 'Klaus', 12),
('8', '2', '3', 'Maria', 11),
('9', '2', '4', 'Kate', 10),
('10', '3', '5', 'Peter', 8),
('11', '3', '5', 'Sergey', 9),
('12', '3', '6', 'Olga', 12),
('13', '3', '6', 'Maria', 14),
('14', '4', '7', 'Irina', 2),
('15', '4', '7', 'Grit', 10),
('16', '4', '7', 'Vanessa', 16),
('17', '5', '8', 'Sascha', 21),
('18', '5', '8', 'Ben', 22),
('19', '6', '9', 'Jessy', 19),
('20', '6', '9', 'Ann', 18);
