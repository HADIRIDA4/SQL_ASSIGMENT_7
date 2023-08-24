--(LEFT JOIN): List all actors who haven't appeared in a film with a rating of 'R'.
with cte_R as(
	SELECT distinct se_a.actor_id,se_a.first_name
FROM actor AS se_a
LEFT JOIN film_actor AS se_fa ON se_a.actor_id = se_fa.actor_id
LEFT JOIN film AS se_f ON se_fa.film_id = se_f.film_id
WHERE  se_f.rating = 'R'
order by actor_id)

SELECT DISTINCT se_a.actor_id, se_a.first_name,se_a.last_name
FROM actor AS se_a
LEFT JOIN cte_R ON se_a.actor_id = cte_R.actor_id
WHERE cte_R.actor_id IS NULL;