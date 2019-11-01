SELECT DATE(created_at) as date_entry, COUNT(DISTINCT hour)
FROM efforts_wise
WHERE user_id=1 AND DATE(created_at) BETWEEN CURDATE() - INTERVAL 28 DAY AND CURDATE()
GROUP BY date_entry 
ORDER BY date_entry;
