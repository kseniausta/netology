-- https://www.db-fiddle.com/
-- 1. Общая сумма каждого заказа для сверки с выставленными счетами.
select cus.name, so.order_date, i.order_id, sum(i.actual_price * i.quantity) order_total
from item i
join sales_order so
	on i.order_id = so.order_id
join customer cus
	on so.customer_id = cus.customer_id
group by cus.name, so.order_date, i.order_id
order by cus.name, so.order_date, order_total
;

-- 2. Сотрудники, продажи которых от 20000 (для премирования) за 1991 год, премия равна 35 процентам от заработной платы
--!!! Проверить округление, указывать в ордере название поля, поставить точку после миддл
select emp.first_name + ' ' + emp.middle_initial + ' ' + emp.last_name name
, sum(i.actual_price * i.quantity) sales_total
, round((emp.salary * 0.35), 2) year_bonus
from customer cus
join employee emp
	on cus.salesperson_id = emp.employee_id
join sales_order so
	on cus.customer_id = so.customer_id
	and datepart(yyyy, order_date) = '1991'
join item i
	on so.order_id = i.order_id
group by emp.first_name + ' ' + emp.middle_initial + ' ' + emp.last_name, emp.salary
having sum(i.actual_price * i.quantity) >= 20000
order by sales_total desc
;

-- 3. Минимальная и максимальная стоимость позиции в каждом месяце
select * from sales_order so
	on cus.customer_id = so.customer_id
	and datepart(yyyy, order_date) = '1991'
join item i
	on so.order_id = i.order_id

-- 4. Лучший товар месяца (самые большие продажи по количеству, вывести так же общую сумму вырученную)
-- для склада, дата

-- 5. Лучший менеджер квартала (по количеству заказов его работников)

-- 6. Количество заказчиков, закрепленных за сотрудником-продавцом, даже если нет ни одного

-- 7. Сотрудники, за которыми не закреплен менеджер

-- 8. Статистика город - место доставки - количество заказов

-- 9. Дата заказа, дата отправки для каждого города, среднее число дней сбора заказа

-- 10. Зарплата и грейды, должность и количетсво сотрудников каждого грейда в нем

-- 11. Цена товара на момент и цены минимальная и верная, какая могла быть максимальная скидка, какая была

