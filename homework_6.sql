select * from customer where country = 'Canada';--1

select  distinct country from customer;--2

select count(id) from orders;--3

SELECT MAX(unit_price) AS MaxPrice
FROM order_item;--4

select sum(total_amount) from orders;--5

select sum(total_amount) from orders where (select extract(year from order_date)='2014');--6

select avg(unit_price) from order_item;--7


select avg(total_amount), customer_id from orders group by customer_id;--8

select * from customer where country ilike 'Brazil' or country ilike 'Spain';--9

--10 Найти все заказы между 2013ым и 2014ым годами, которые стоили меньше 100.00$
select * from orders where (select extract(year from order_date) between '2013' and '2014') and total_amount<'100.00';

-- 11 Найти всех клиентов, которые в одной из стран: Испания, Италия, Германия, Франция. Отсортируйте по странам
select * from customer where country = 'Spain' or country = 'Italy' or country = 'Germany' or country = 'France' order by country;

--12 Найти все страны клиентов, страны которых содержаться в таблице поставщиков
select  c.country from customer join supplier c on customer.country = c.country group by c.country;

--13 Найти всех клиентов, имена которых начинаются на ‘Jo’
select * from customer where first_name ilike 'Jo%';

--14 Найти всех клиентов, имена которых заканчиваются на ‘a’ и имеют длину ровно 4 символа
select * from customer where first_name ilike '___a';

--15 Найти количество клиентов по странам
select country,count(id)  from customer group by country;

--16 Найти количество клиентов по странам. Вывести в порядке убывания
select country,count(id)  from customer group by country order by count(id) desc;

--17 Найти общую сумму стоимости заказов и количество заказов по каждому клиенту (customer_id). Отсортировать по сумме
select sum(total_amount), count(*), orders.customer_id from orders
join customer c on c.id = orders.customer_id group by customer_id
order by sum(total_amount) desc;

--18 Найти общую сумму стоимости заказов и количество заказов по каждому клиенту (customer_id), у которых общее количество заказов больше 20ти
select sum(total_amount), count(*), customer_id, quantity
from orders join order_item oi on orders.id = oi.order_id
where quantity > 20 group by quantity, customer_id;
