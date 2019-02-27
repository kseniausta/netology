-- https://www.db-fiddle.com/
-- 1. Общая сумма каждого заказа для сверки с выставленными счетами
select cus.name -- Наименование организации заказчика
, so.order_date::date -- Дата заказа
, i.order_id -- Идентификатор заказа
, sum(i.actual_price * i.quantity) order_total -- Общая сумма заказа
from item i
join sales_order so
	on i.order_id = so.order_id
join customer cus
	on so.customer_id = cus.customer_id
group by cus.name, so.order_date, i.order_id
order by cus.name, so.order_date, order_total
;

-- 2. Сотрудники, продажи которых составили от 20 000 за 1991 год. Премия равна 35 процентам от заработной платы
select emp.first_name||' '||emp.middle_initial||'. '||emp.last_name emp_name -- Имя сотрудника
, sum(i.actual_price * i.quantity) sales_total -- Сумма продаж за 1991 год
, (emp.salary * 0.35) year_bonus -- Премия
from customer cus
join employee emp
	on cus.salesperson_id = emp.employee_id
join sales_order so
	on cus.customer_id = so.customer_id
	and extract('year' from order_date) = '1991'
join item i
	on so.order_id = i.order_id
group by emp.first_name||' '||emp.middle_initial||'. '||emp.last_name, emp.salary
having sum(i.actual_price * i.quantity) >= (20000)::money -- сумма продаж больше или равна 20 000
order by sales_total desc
;

-- 3. Минимальная и максимальная стоимость заказа в каждом месяце (для статистики сезонности продаж)
with order_amount as (-- таблица для подсчета общей суммы каждого заказа
select i.order_id -- Идентификатор заказа
, sum(i.actual_price * i.quantity) order_total -- Общая сумма заказа
from item i
join sales_order so
	on i.order_id = so.order_id
group by i.order_id) 
select 
case 
	when date_part('month', so.order_date) = 1 then 'January' 
    when date_part('month', so.order_date) = 2 then 'February' 
    when date_part('month', so.order_date) = 3 then 'March' 
    when date_part('month', so.order_date) = 4 then 'April' 
    when date_part('month', so.order_date) = 5 then 'May' 
    when date_part('month', so.order_date) = 6 then 'June' 
    when date_part('month', so.order_date) = 7 then 'July' 
    when date_part('month', so.order_date) = 8 then 'August' 
    when date_part('month', so.order_date) = 9 then 'September' 
    when date_part('month', so.order_date) = 10 then 'October' 
    when date_part('month', so.order_date) = 11 then 'November' 
    when date_part('month', so.order_date) = 12 then 'December' 
end mn -- Месяц, в котором был сделан заказ
, date_part('year', so.order_date) yr -- Год, в котором был сделан заказ
, min(oa.order_total) min_order -- Минимальная сумма заказа в категории
, max(oa.order_total) max_order -- Максимальная сумма заказа в категории
from sales_order so
join item i
	on so.order_id = i.order_id
join order_amount oa
	on so.order_id = oa.order_id
group by date_part('month', so.order_date), date_part('year', so.order_date)
order by date_part('month', so.order_date) asc, yr desc
;

-- 4. Лучший товар месяца (самые большие продажи по количеству - берется среднее значение в месяце, за все года) (для закупщиков)
with sum_q as ( -- таблица для подсчета количества каждого проданного продукта за месяц
select i.product_id
, date_part('month', so.order_date) mn -- Месяц продажи
, date_part('year', so.order_date) yr -- Год продажи
, sum(i.quantity) qu -- Количество проданного товара в категории
from item i
join sales_order so
	on i.order_id = so.order_id
group by i.product_id, date_part('month', so.order_date), date_part('year', so.order_date)
)
select description prod, mn, avg_qu from (
select prod.description -- Наименование товара
, sum_q.mn -- Месяц продажи
, avg(sum_q.qu) avg_qu -- Среднее количество проданного товара в категории
, rank() over (partition by sum_q.mn order by avg(sum_q.qu) desc) rn -- Ранжирование по среднему количество проданного товара в категории (по убыванию)
from item i
join product prod
	on i.product_id = prod.product_id
join sales_order so
	on i.order_id = so.order_id
join sum_q
	on sum_q.product_id = i.product_id
group by prod.product_id, prod.description, sum_q.mn
order by sum_q.mn asc, avg(sum_q.qu) desc
  ) main
where rn = 1 -- отбираем товары с наибольшими продажами
;

-- 5. Лучший менеджер 4 квартала 1990 года (по количеству заказов его работников) (для отдела персонала, повесить фото на доску почета)
with main as ( -- основной отбор информации, ранжирование
select mng.first_name||' '||mng.middle_initial||'. '||mng.last_name mng_name -- Имя менеджера
, job.name job_descr -- Должность менеджера
, count(so.order_id) order_qu -- Количество заказов подчиненных
, rank() over (order by count(so.order_id) desc) rn -- Ранжирование по количеству заказов подчиненных (по убыванию)
from employee emp
join customer cus
	on emp.employee_id = cus.salesperson_id
join sales_order so
	on cus.customer_id = so.customer_id
join employee mng
	on emp.manager_id = mng.employee_id
join job 
	on mng.job_id = job.job_id
where 1 = 1
and date_part('year', so.order_date) = '1990' -- задаем год
and date_part('quarter', so.order_date) = '4' -- задаем квартал
group by mng.employee_id
, mng.first_name||' '||mng.middle_initial||'. '||mng.last_name
, job.name
)
select mng_name, job_descr, order_qu
from main
where rn = 1 -- отбираем менеджеров с наибольшим количеством заказов подчиненных
;

-- 6. Количество и наименования организаций-заказчиков, закрепленных за сотрудником-продавцом (для перераспределения заказчиков между продавцами)
select emp.first_name||' '||emp.middle_initial||'. '||emp.last_name emp_name -- Имя продавца
, count(cus.customer_id) cus_qu -- Количество заказчиков
, string_agg(cus.name, '; ') cus_names -- Наименования организаций, перечисление через точку с запятой
from employee emp
join job
	on emp.job_id = job.job_id
left join customer cus
	on emp.employee_id = cus.salesperson_id
where job.name = 'SALESPERSON' -- выбираем только продавцов
group by emp.employee_id
, emp.first_name||' '||emp.middle_initial||'. '||emp.last_name
order by cus_qu asc
;

-- 7. Сотрудники, за которыми не закреплен менеджер (для сотрудника в качестве менеджера указан он сам)
select emp.first_name||' '||emp.middle_initial||'. '||emp.last_name emp_name -- Имя сотрудника
, job.name job_descr -- Должность сотрудника
from employee emp
left join job 
	on emp.job_id = job.job_id
where 1 = 1
and emp.manager_id = emp.employee_id
;

-- 8. Статистика по городам (место доставки): процент количества заказов в квартал от количества заказов в год (для отдела продаж)
select distinct cus.city -- Город доставки
, date_part('quarter', so.order_date) -- Квартал, в котором был сделан заказ
, date_part('year', so.order_date) -- Год, в котором был сделан заказ
, count(so.order_id) over (partition by cus.city, date_part('quarter', so.order_date), date_part('year', so.order_date)) quar_qu -- Количество заказов в квартале
, ((count(so.order_id) over (partition by cus.city, date_part('quarter', so.order_date), date_part('year', so.order_date)) * 100) / count(so.order_date) over (partition by cus.city, date_part('year', so.order_date)))::decimal percent_quar_year -- Процент количества заказов в квартале от количества заказов в год
from sales_order so
join customer cus
	on so.customer_id = cus.customer_id
order by 1, 3, 2
;

-- 9. Среднее число дней сбора заказа для города заказчика (от офомления до отправки) (для улучшения сроков)
select distinct cus.city -- Город
, round(avg(so.ship_date - so.order_date), 2) avg_order_collecting_days -- Среднее число дней сбора заказа
from sales_order so
join customer cus
	on so.customer_id = cus.customer_id
group by cus.city
order by 1
;

-- 10. Грейд и количество сотрудников каждой должности в нем
select sg.grade_id grade -- Грейд
, job.name job_descr -- Должность
, count(emp.employee_id) -- Количество сотрудников в категории
, avg(emp.salary::decimal)::money -- Средняя заработная плата в категории
from employee emp
join job 
	on emp.job_id = job.job_id
left join salary_grade sg
	on emp.salary between sg.lower_bound and sg.upper_bound
group by job_descr, grade
order by grade, job_descr
;

-- 11. Скидка на товар при продаже и максимальная возможная скидка на тот момент
select i.order_id -- Идентификатор заказа
, i.item_id -- Идентификатор позиции в заказе
, prod.description prod_desc -- Описание товара
, i.actual_price -- Цена, по которой был продан товар
, round(((prc.list_price - i.actual_price::decimal) * 100) / prc.list_price, 2) discount -- Скидка (от первоначальной цены товара)
, round(((prc.list_price - prc.min_price::decimal) * 100) / prc.list_price, 2) max_discount -- Максимальная возможная скидка (от первоначальной цены товара)
from item i
join sales_order so
	on i.order_id = so.order_id
join product prod
	on i.product_id = prod.product_id
join price prc
	on prod.product_id = prc.product_id
    and so.order_date between prc.start_date and coalesce(prc.end_date, current_date) -- выбираем цену из реестра, актуальную на момент продажи
order by discount desc, max_discount desc
;

-- 12. Товар был продан по цене, выходящей за границы возможных (в разрезе периода действия цены)
select prod.description -- Описание товара
, prc.start_date::date -- Дата начала действия цены
, prc.end_date::date -- Дата окончания действия цены
, prc.list_price::money -- Цена, актуальная на момент продажи
, prc.min_price -- Минимальная возможная цена, актуальная на момент продажи
, i.actual_price -- Цена, по которой был продан товар
, prc.list_price - i.actual_price::decimal mns -- Разница актуальной цены и цены продажи
, count(*) qu -- Количество проданного товара
, prc.list_price - i.actual_price::decimal * count(*) lost -- Потери
from item i
join sales_order so
	on i.order_id = so.order_id
join product prod
	on i.product_id = prod.product_id
join price prc
	on prod.product_id = prc.product_id
    and so.order_date between prc.start_date and coalesce(prc.end_date, current_date)
where i.actual_price < prc.min_price
or i.actual_price::decimal > prc.list_price
group by prod.product_id, prod.description, prc.start_date, prc.end_date
, prc.list_price, prc.min_price, i.actual_price
;
