/*
START STAGE 4
*/
WITH my_table AS (
    SELECT p.maker,
           p.model,
           pc.speed,
           pc.price
    FROM Product p
    JOIN PC pc ON p.model = pc.model

    UNION ALL

    SELECT p.maker,
           p.model,
           l.speed,
           l.price
    FROM Product p
    JOIN Laptop l ON p.model = l.model
),
min_speed AS (
    SELECT MIN(speed) AS lowest_speed
    FROM my_table
)
SELECT t.maker,
       t.model,
       t.speed,
       t.price
FROM my_table t
JOIN min_speed m ON t.speed = m.lowest_speed;
/*
END STAGE 4
*/



/*
Other Solution
--
WITH computer AS
    (
    SELECT a.maker, a.model, b.speed, b.price from Product a join PC b on a.model=b.model
    UNION
    SELECT a.maker, a.model, b.speed, b.price from Product a join Laptop b on a.model=b.model
    )
select *
from computer
where speed=(select min(speed) from computer)
*/

/*
Other Solution
--
WITH MinSpeed AS (
    SELECT MIN(speed) AS lowest_speed
    FROM (
        SELECT speed FROM PC
        UNION ALL
        SELECT speed FROM Laptop
    ) AS com_speeds
)
SELECT
    p.maker,
    p.model,
    COALESCE(PC.speed, Laptop.speed) AS speed,
    COALESCE(PC.price, Laptop.price) AS price
FROM Product p
LEFT JOIN PC ON p.model = PC.model
LEFT JOIN Laptop ON p.model = Laptop.model
WHERE COALESCE(PC.speed, Laptop.speed) = (SELECT lowest_speed FROM MinSpeed);
*/

/*
Other Solution
--
WITH AllComputers AS (
    SELECT p.maker, pc.model, pc.speed, pc.price
    FROM Product p
    JOIN PC pc ON p.model = pc.model
    UNION ALL
    SELECT p.maker, l.model, l.speed, l.price
    FROM Product p
    JOIN Laptop l ON p.model = l.model
)
SELECT *
FROM AllComputers
WHERE speed = (SELECT MIN(speed) FROM AllComputers);
*/