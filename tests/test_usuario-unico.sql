SELECT 
		user_id 
	, count(*)
FROM users
GROUP BY 1
HAVING count(*) > 1