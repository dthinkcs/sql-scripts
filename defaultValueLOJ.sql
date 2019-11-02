SELECT a.a1,b.b1,  
    CASE WHEN b.b1 is NULL THEN 5 ELSE b.b2 END AS b2  
FROM a LEFT OUTER JOIN b  
ON a.a1 = b.b1
