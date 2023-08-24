WITH cte_horror_rental AS (
    SELECT distinct(se_c.customer_id)
    FROM customer AS se_c
    LEFT JOIN rental AS se_r ON se_c.customer_id = se_r.customer_id
    INNER JOIN inventory AS se_i ON se_r.inventory_id = se_i.inventory_id
    INNER JOIN film AS se_f ON se_i.film_id = se_f.film_id
    INNER JOIN film_category AS se_fc ON se_fc.film_id = se_f.film_id
    INNER JOIN category AS se_ca ON se_ca.category_id = se_fc.category_id
    WHERE se_ca.name = 'Horror'
	order by se_c.customer_id
)

SELECT customer.customer_id
FROM customer
left  JOIN cte_horror_rental AS chr ON customer.customer_id = chr.customer_id
WHERE chr.customer_id IS NULL;
