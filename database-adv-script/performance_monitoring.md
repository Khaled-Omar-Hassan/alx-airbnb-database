
explain analyze select start_date from booking order by start_date desc;  

SET profiling = 1;  
explain analyze select start_date from booking order by start_date desc;  
SHOW PROFILE FOR QUERY 1;  

![ScreenShot](performance.png)
