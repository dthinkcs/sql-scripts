/* FINALLY 
 we get all the values for USER_ID and ast 28 days with 0's
*/
SELECT dates.Date, COUNT(DISTINCT hour)
FROM ( 
    select a.Date 
    from (
        select curdate() - INTERVAL (a.a + (10 * b.a) + (100 * c.a) + (1000 * d.a) ) DAY as Date
        from (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as a
        cross join (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as b
        cross join (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as c
        cross join (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as d
    ) a
    where a.Date between CURDATE() - INTERVAL 28 DAY AND CURDATE()
 ) dates
LEFT JOIN (SELECT * FROM efforts_wise WHERE user_id = 1) as effortsW
ON DATE(created_at) = dates.Date 
GROUP BY dates.Date;
