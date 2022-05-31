																
"Задание: 1 (Serge I: 2002-09-30)
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол.
Вывести: model, speed и hd"																
																
SELECT model, speed, hd FROM PC WHERE price < 500																
																

"Задание: 2 (Serge I: 2002-09-21)
Найдите производителей принтеров. Вывести: maker"																
																																
SELECT DISTINCT maker from Product WHERE type = 'Printer'																
																
"Задание: 3 (Serge I: 2002-09-30)
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол."																
																
																
SELECT model, ram, screen from Laptop WHERE price > 1000																
																

"Задание: 4 (Serge I: 2002-09-21)
Найдите все записи таблицы Printer для цветных принтеров."										
																
SELECT * FROM Printer WHERE color = 'y'																
																

"Задание: 5 (Serge I: 2002-09-30)
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол."																
																
SELECT model, speed, hd FROM PC WHERE (CD = '12x' or CD = '24x') AND price < 600																
																

"Задание: 6 (Serge I: 2002-10-28)
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, 
найти скорости таких ПК-блокнотов. Вывод: производитель, скорость."																
																
Select Distinct maker, speed																
FROM Laptop																
Inner Join Product																
on Product.model = Laptop.model																
Where hd >=10																
																
																
"Задание: 7 (Serge I: 2002-11-02)
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква)."																
																
SELECT PC.model, PC.price
FROM PC
INNER JOIN Product
ON Product.model = PC.model
WHERE Product.maker = 'B'
UNION
SELECT Laptop.model, Laptop.price
FROM Laptop
INNER JOIN Product
ON Product.model = Laptop.model
WHERE Product.maker = 'B'
UNION
SELECT Printer.model, Printer.price
FROM Printer
INNER JOIN Product
ON Product.model = Printer.model
WHERE Product.maker = 'B'
																
																																
"Задание: 8 (Serge I: 2003-02-03)
Найдите производителя, выпускающего ПК, но не ПК-блокноты."																
																
SELECT maker FROM Product
Where type = 'PC'
EXCEPT 
SELECT maker FROM Product
Where type = 'Laptop'
																
																
Задание: 9 (Serge I: 2002-11-02)																
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker																

SELECT DISTINCT maker FROM Product																
INNER JOIN PC ON																
PC.model = Product.model																
WHERE PC.speed >= 450																
																
																
Задание: 10 (Serge I: 2002-09-23)																
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price																
																
SELECT model, price FROM Printer																
WHERE price in (SELECT MAX(price) FROM Printer)																
																
																
Задание: 11 (Serge I: 2002-11-02)																
Найдите среднюю скорость ПК.																

SELECT AVG(speed) From PC																
																
																
Задание: 12 (Serge I: 2002-11-02)																
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.																

SELECT AVG(speed) From Laptop																
Where Laptop.price > 1000																
																

Задание: 13 (Serge I: 2002-11-02)																
Найдите среднюю скорость ПК, выпущенных производителем A.																
																
SELECT AVG(speed) FROM PC																
INNER JOIN Product																
ON Product.model = PC.model																
WHERE Product.maker = 'A'																
																
																
"Задание: 14 (Serge I: 2002-11-05)
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий."																
																
SELECT Ships.class, Ships.name,  Classes.country FROM Ships																
INNER JOIN Classes																
ON Classes.class = Ships.class																
WHERE Classes.numGuns >=10																
																

"Задание: 15 (Serge I: 2003-02-03)
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD"																
																
SELECT hd FROM PC																
GROUP BY hd																
HAVING COUNT(hd) > 1																
																
																
"Задание: 16 (Serge I: 2003-02-03)
Найдите пары моделей PC, имеющих одинаковые скорость и RAM.
В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i),
Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM."																
																
SELECT DISTINCT pc_1.model, pc_2.model, pc_1.speed, pc_1.RAM 
FROM PC AS pc_1, PC AS pc_2
WHERE pc_1.model > pc_2.model AND pc_1.speed = pc_2.speed AND pc_1.RAM = pc_2.RAM
																
																
"Задание: 17 (Serge I: 2003-02-03)
Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed"																
																
SELECT DISTINCT Product.type, Laptop.model, Laptop.speed FROM Laptop
JOIN Product
On Product.model = Laptop.model
Where Laptop.speed < ALL (select speed from PC)																
																
																
Задание: 18 (Serge I: 2003-02-03)																
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price																
																
SELECT DISTINCT p.maker, pr.price from Product p
JOIN Printer pr
ON pr.model = p.model
where pr.price IN(select min(price) from Printer 
WHERE Printer.color = 'y')
AND pr.color = 'y'																
																
																
Задание: 19 (Serge I: 2003-02-13)																
Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.																
Вывести: maker, средний размер экрана.																
																
SELECT Product.maker maker, AVG(Laptop.screen) screen from Laptop																
Join Product																
ON Product.model = Laptop.model																
Group by maker																
																

Задание: 20 (Serge I: 2003-02-13)																
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.																
																
SELECT maker, COUNT(model) AS Count_Model																
FROM Product																
WHERE type='PC'																
GROUP BY maker																
HAVING COUNT(model)>=3																
																
																
"Задание: 21 (Serge I: 2003-02-13)
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена."																
																
Select p.maker, max(PC.price) from Product AS p
JOIN PC
ON PC.model = p.model
Group by p.maker
																
																
Задание: 22 (Serge I: 2003-02-13)																
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. 
Вывести: speed, средняя цена.																
																
Select speed, AVG(price) From PC																
WHERE speed > 600																
Group by speed																
																
																
Задание: 23 (Serge I: 2003-02-14)																
Найдите производителей, которые производили бы как ПК																
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.																
Вывести: Maker																
																
Select p.maker from Product p																
JOIN PC																
ON PC.model = p.model																
Where PC.speed >= 750																
INTERSECT																
Select p.maker from Product p																
JOIN Laptop																
ON Laptop.model = p.model																
Where Laptop.speed >= 750																
																
																
"Задание: 24 (Serge I: 2003-02-03)
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции."																
																
SELECT model FROM																
(SELECT model, price FROM PC																
UNION																
SELECT model, price FROM Laptop																
UNION																
SELECT model, price FROM Printer) AS tab																
WHERE price = (SELECT MAX(price) FROM																
(SELECT price FROM PC																
UNION																
SELECT price FROM Laptop																
UNION																
SELECT price FROM Printer) AS tab2																
)																

																
"Задание: 25 (Serge I: 2003-02-14)
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК,
имеющих наименьший объем RAM. Вывести: Maker"																
																
SELECT DISTINCT maker FROM Product 
WHERE model IN
(SELECT model FROM PC
WHERE RAM = (SELECT MIN(RAM) FROM PC)
AND speed = (SELECT MAX(speed) FROM PC
WHERE RAM = (SELECT MIN(RAM) FROM PC))
)
AND maker IN (SELECT maker FROM Product WHERE type = 'Printer')																
																
																
Задание: 26 (Serge I: 2003-02-14)																
Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.																
																
SELECT AVG(price) FROM																
(SELECT PC.price FROM PC																
JOIN Product																
ON PC.model = Product.model																
WHERE Product.maker = 'A'																
UNION ALL																
SELECT Laptop.price FROM Laptop																
JOIN Product																
ON Laptop.model = Product.model																
WHERE Product.maker = 'A') tab																
																
																
Задание: 27 (Serge I: 2003-02-03)																
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.																
																
SELECT p.maker, AVG(hd) FROM PC																
JOIN Product p																
ON p.model = PC.model																
Where p.maker IN																
(SELECT DISTINCT maker FROM																
(SELECT maker FROM Product																
WHERE type = 'Printer') AS t																
)																
Group by p.maker																
																
																
Задание: 28 (Serge I: 2012-05-04)																
Используя таблицу Product, определить количество производителей, выпускающих по одной модели.																
																
SELECT COUNT(qty) FROM																
(SELECT maker, COUNT(p.model) AS qty FROM Product p																
Group by maker																
HAVING																
COUNT(p.model) = 1) tab																
																
																
Задание: 29 (Serge I: 2003-02-14)																
В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], 
написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.																
																
																
SELECT inc.point, inc.date, inc, out FROM Income_o as inc																
LEFT JOIN Outcome_o as out																
ON inc.point = out.point AND inc.date = out.date																
UNION																
SELECT out.point, out.date, inc, out FROM Income_o as inc																
RIGHT JOIN Outcome_o as out																
ON inc.point = out.point AND inc.date = out.date																
ON out.point = inc.point AND inc.date = out.date																
GROUP BY out.point, out.date																
																

Задание: 30 (Serge I: 2003-02-14)																
В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.																
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).																
																
SELECT point, date, sum(out), sum(inc) FROM																
(SELECT point, date, SUM(inc) as inc, null as out from Income																
Group by point, date																
UNION																
SELECT point, date, null as inc, sum(out) from Outcome																
Group by point, date) tab																
Group by point, date																
																
																
Задание: 31 (Serge I: 2002-10-22)																
Для классов кораблей, калибр орудий которых не менее 16 дюймов, укажите класс и страну.																
																
SELECT class, country FROM Classes																
WHERE bore >= 16																
																
																
Задание: 32 (Serge I: 2003-02-17)																
Одной из характеристик корабля является половина куба калибра его главных орудий (mw). С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны, у которой есть корабли в базе данных.																
																
SELECT country, CAST(AVG(bore*bore*bore/2) AS numeric(6,2)) AS mw																
FROM																
(SELECT c.country, c.class, s.name, c.bore																
FROM Classes AS c																
JOIN Ships AS s	ON s.class = c.class															
UNION																
SELECT  c.country, c.class, o.ship, c.bore FROM Classes AS c																
JOIN Outcomes AS o ON o.ship = c.class) tab																
GROUP BY country																
																
																
Задание: 33 (Serge I: 2002-11-02)																
Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). Вывод: ship.																
																
SELECT ship FROM Outcomes																
WHERE battle = 'North Atlantic'																
AND result = 'sunk'																
																
																
Задание: 34 (Serge I: 2002-11-04)																
По Вашингтонскому международному договору от начала 1922 г. запрещалось строить линейные корабли водоизмещением более 35 тыс.тонн. Укажите корабли, нарушившие этот договор (учитывать только корабли c известным годом спуска на воду). Вывести названия кораблей.																
																
SELECT DISTINCT  Ships.name FROM Ships, Classes																
Where Ships.launched >= 1922																
AND Classes.displacement > 35000																
AND Classes.type = 'bb'																
AND Ships.class = Classes.class																
																
																
"Задание: 35 (qwrqwr: 2012-11-23)
В таблице Product найти модели, которые состоят только из цифр или только из латинских букв (A-Z, без учета регистра).
Вывод: номер модели, тип модели."																
																
select model, type from Product																
Where model NOT Like '%[^0-9]%' OR upper(model) NOT Like '%[^A-Z]%'																
																
																
Задание: 36 (Serge I: 2003-02-17)																
Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).																
																
SELECT ship from Outcomes as o																
JOIN Classes as c																
ON c.class = o.ship																
UNION																
SELECT s.name from Ships as s																
JOIN Classes as c ON c.class = s.name																
																

Задание: 37 (Serge I: 2003-02-17)																
Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).																
																
"SELECT class FROM
(SELECT c.class, s.name as ship FROM Classes as c
JOIN Ships as s ON c.class = s.class
UNION
SELECT c.class, o.ship as ship FROM Classes as c
JOIN Outcomes as o ON c.class = o.ship) tab
GROUP BY class
HAVING COUNT(ship) = 1"																
																
																
"Задание: 38 (Serge I: 2003-02-19)
Найдите страны, имевшие когда-либо классы обычных боевых кораблей ('bb') и имевшие когда-либо классы крейсеров ('bc')."																
																
Select country from Classes																
where type = 'bb'																
INTERSECT																
Select country from Classes																
where type = 'bc'																
																
																
"Задание: 39 (Serge I: 2003-02-14)
Найдите корабли, `сохранившиеся для будущих сражений`; т.е. выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже."																
																
Select distinct o.ship From Outcomes o																
JOIN Battles b																
ON o.battle=b.name																
WHERE o.ship IN																
(Select o1.ship From Outcomes o1																
JOIN Battles b1																
ON o1.battle=b1.name																
WHERE o1.result = 'damaged' and b.date > b1.date)																


Задание: 40 (Serge I: 2012-04-20)																
Найти производителей, которые выпускают более одной модели, при этом все выпускаемые производителем модели являются продуктами одного типа.																
Вывести: maker, type																
																
select maker, MIN(type) AS type from Product p																
Group by maker																
Having count(model) > 1 AND count(DISTINCT type) = 1																
																

Задание: 41 (Serge I: 2019-05-31)																
Для каждого производителя, у которого присутствуют модели хотя бы в одной из таблиц PC, Laptop или Printer,																
определить максимальную цену на его продукцию.																
Вывод: имя производителя, если среди цен на продукцию данного производителя присутствует NULL, то выводить для этого производителя NULL,																
иначе максимальную цену.																
																
with new as (select model,price from PC																
union																
select model,price from Laptop																
union																
select model,price from Printer)																
select t.maker,																
case when count(price) = count(*) then max(price) end max_price																
from Product as t, new																
where t.model=new.model																
group by t.maker																
																
																
Задание: 42 (Serge I: 2002-11-05)																
Найдите названия кораблей, потопленных в сражениях, и название сражения, в котором они были потоплены.																
																
SELECT ship, battle FROM Outcomes
WHERE result = 'sunk'

																
Задание: 43 (qwrqwr: 2011-10-28)																
Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.																
																
SELECT name FROM Battles																
WHERE DATEPART(yy, date) NOT IN																
(SELECT DATEPART(yy, b.date) FROM Battles as b																
JOIN Ships as s ON DATEPART(yy, b.date) = s.launched)																
																
																
Задание: 44 (Serge I: 2002-12-04)																
Найдите названия всех кораблей в базе данных, начинающихся с буквы R.																
																
SELECT name FROM																
(SELECT name as name FROM Ships																
UNION																
SELECT ship as name FROM Outcomes) tab																
WHERE name LIKE 'R%'																
																
																
Задание: 45 (Serge I: 2002-12-04)																
Найдите названия всех кораблей в базе данных, состоящие из трех и более слов (например, King George V).																
Считать, что слова в названиях разделяются единичными пробелами, и нет концевых пробелов.																
																
SELECT name FROM
(SELECT name FROM Ships
UNION
SELECT ship FROM Outcomes) tab
WHERE name LIKE '% % %'																
																

Задание: 46 (Serge I: 2003-02-14)																
Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), вывести название, водоизмещение и число орудий																
																
SELECT o.ship, displacement, numGuns  FROM
(SELECT s.name, c.displacement, c.numGuns FROM Ships as s
JOIN Classes as c
ON s.class= c.class
UNION
SELECT class as name, displacement, numGuns FROM Classes) tab
RIGHT JOIN Outcomes as o ON o.ship = tab.name
WHERE o.battle = 'Guadalcanal'															
																

Задание: 47 (Serge I: 2019-06-07)																
Определить страны, которые потеряли в сражениях все свои корабли.																
																
WITH tab_1 AS (SELECT COUNT(name) as count_ship, country FROM
(SELECT name, country FROM Classes
JOIN Ships
ON Ships.class = Classes.class
UNION
SELECT ship, country FROM Classes
JOIN Outcomes
ON Outcomes.ship = Classes.class) t1
GROUP BY country
),

tab_2 AS (SELECT COUNT(name) as count_ship, country FROM
(SELECT name, country FROM Classes
JOIN Ships 
ON Ships.class = Classes.class
WHERE name IN (SELECT DISTINCT ship FROM Outcomes WHERE result = 'sunk')
UNION
SELECT ship, country FROM Classes 
JOIN Outcomes
ON Outcomes.ship = Classes.class
WHERE ship IN (SELECT DISTINCT ship FROM Outcomes WHERE result = 'sunk')
) t2 GROUP BY country )

SELECT tab_1.country FROM tab_1
JOIN tab_2 ON tab_1.count_ship = tab_2.count_ship and tab_1.country = tab_2.country
																
																
Задание: 48 (Serge I: 2003-02-16)																
Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении.																
																
SELECT c.class from Outcomes as out																
JOIN Classes as c																
ON c.class = out.ship																
Where out.result = 'sunk'																
UNION																
SELECT s.class from Ships as s																
JOIN Outcomes as out																
ON out.ship = s.name																
Where out.result = 'sunk'																
																
																
"Задание: 49 (Serge I: 2003-02-17)
Найдите названия кораблей с орудиями калибра 16 дюймов (учесть корабли из таблицы Outcomes)."																
																
SELECT o.ship FROM Outcomes o
JOIN Classes 
ON Classes.class= o.ship
WHERE Classes.bore = 16
UNION
SELECT s.name FROM Ships s
JOIN Classes 
ON Classes.class = s.name OR s.class = Classes.class
WHERE Classes.bore = 16																
																
																
Задание: 50 (Serge I: 2002-11-05)																
Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.																
																
SELECT DISTINCT o.battle FROM Outcomes o																
JOIN Ships s																
ON s.name = o.ship																
WHERE s.class = 'Kongo'																
																
																
