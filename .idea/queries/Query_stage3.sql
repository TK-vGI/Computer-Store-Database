/*
START STAGE 3
*/
SELECT COUNT(maker) AS number_of_unique_makers
FROM (
    SELECT maker
    FROM Product
    GROUP BY maker
    HAVING COUNT(model) = 1
) AS one_model_makers;

/*
END STAGE 3
*/



/*
Other Solution
--
SELECT
    COUNT(*) AS number_of_unique_makers
FROM (
    SELECT
        maker
    FROM
        Product
    GROUP BY
        maker
    HAVING
        COUNT(model) = 1
)AS subquery;
*/

/*
Other Solution
--
with unique_makers as (
    select maker, count(model)
    from Product
    group by maker
    having count(model) = 1
)
select count(*) as number_of_unique_makers
from unique_makers;
*/

/*
Other Solution
--

*/