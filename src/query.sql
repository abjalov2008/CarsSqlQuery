--1 Таблицадан машиналардын бренд, модель жана бааларын чыгарыныз
SELECT c.brand, c.model, c.price
from cars c;

--2 Таблицадан бардык машиналардын санын чыгарыныз
SELECT c.count
from cars c;

--3 Hyundai брендиндеги бардык машиналарды чыгарыныз
SELECT*
from cars
WHERE brand iLIKE 'Hyun%';

-- Бардык кызыл жана кок машиналарды чыгарыныз
select *
from cars
where color = 'Blue'
   or color = 'Red';

--5 Бардык 2000-жылдан 2010-жылга чейинки чыгарылган машиналарды чыгарыныз
SELECT *
FROM cars
WHERE year_of_issue BETWEEN 2000 AND 2010;

--6 Chevrolet брендинде канча машина бар экенин чыгарынызыз
select *
from cars
where brand ilike  'Chev%';
-- 7 Машиналардын чыгарылган жылдарынын орточо маанисин чыгарыныз
SELECT AVG(year_of_issue) AS year_of_issue
FROM cars;
--8 Audi, Toyota, Kia жана Ford брендиндеги машиналдарды чыгарыныз
SELECT *
FROM cars
WHERE brand IN ('Audi', 'Toyota', 'Kia', 'Ford');
--9  Модели Т менен башталган машиналарды чыгарыныз
SELECT *
from cars
WHERE cars.model LIKE 'T%';
--10  Модели “е” менен буткон машиналарды чыгарыныз
select *
from cars
where cars.model LIKE '%e';
--11  Бренди 5 символдон турган машиналарды чыгарыныз
select *
from cars
where LENGTH(brand) = 5;
--12 Бренди Mercedes-Benz болгон машиналардын жалпы суммасын чыгарыныз
select sum(price) AS total_price
from cars
where brand = 'Mercedes-Benz';
--13 Эн кымбат жана эн арзан машинаны чыгарыныз
SELECT 'Min' AS type, model, price
FROM cars
WHERE price = (SELECT MIN(price) FROM cars)
UNION ALL
SELECT 'Max' AS type, model, price
FROM cars
WHERE price = (SELECT MAX(price) FROM cars);
--14 TOYOTA дан башка машиналарды чыгарыныз
select *
from cars
where brand!= 'TOYOTA';
--15 Эн кымбат 10 машинаны чыгарыныз
select *
from cars
order by price desc LIMIT 10;
--16 Эн жаны машиналардыдын 5 тен 15 ке чейинкисин чыгарыныз
select *
from cars
ORDER BY year_of_issue DESC LIMIT 15
OFFSET 5;
--17 1995 - жылдан 2005- ке чейинки машиналарадан башкаларын чыгарыныз
select *
from cars
where year_of_issue NOT BETWEEN 1995 AND 2005;
--18 Бир тустогу саны эн коп болгон машиналарды чыгаргыла
SELECT color, COUNT(*) AS color_count
FROM cars
GROUP BY color
ORDER BY color_count DESC LIMIT 1;