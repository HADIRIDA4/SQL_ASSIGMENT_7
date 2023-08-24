-- Create a temporary table from the CTE.
CREATE TEMP TABLE temp_cte AS 
WITH CTE_total_nb_films_rented_per_cat AS (
    SELECT
        COUNT(rent.rental_id) AS total_rent,
        cat.name AS category
    FROM public.film AS f
    INNER JOIN public.inventory AS inv 
	ON f.film_id = inv.film_id
    INNER JOIN public.rental AS rent 
	ON inv.inventory_id = rent.inventory_id
    INNER JOIN public.film_category AS f_cat 
	ON f.film_id = f_cat.film_id
    INNER JOIN public.category AS cat 
	ON cat.category_id = f_cat.category_id
    GROUP BY 
		category
)
SELECT *
FROM TEMP_CTE
ORDER BY TOTAL_RENT DESC
LIMIT 5;
