/*
START STAGE 2
*/
SELECT
    p.maker,
    p.model,
    l.hd,
    l.speed,
    l.price
FROM Product p
JOIN Laptop l ON p.model = l.model
WHERE
    l.hd >= 1000
ORDER BY hd, speed DESC, price;
/*
END STAGE 2
*/

/*
Other Solution
--
SELECT p.maker, l.model, l.speed, l.price, l.hd
FROM Product p
JOIN Laptop l ON p.model = l.model
WHERE p.type = 'Laptop' AND l.hd >= 1000
ORDER BY l.hd ASC, l.speed DESC, l.price ASC;
*/

/*
Other Solution
--
SELECT
  Product.maker,
  Product.model,
  Laptop.hd,
  Laptop.speed,
  Laptop.price
FROM
  Product
INNER JOIN
  Laptop
  ON Product.model = Laptop.model
WHERE
  Laptop.hd >= 1000
ORDER BY
  Laptop.hd,
  Laptop.speed DESC,
  Laptop.price;
*/