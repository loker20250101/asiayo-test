# Requisition
* install mysql server

## import data
```bash
mysql -u root -p < import.sql
```

## Where is the classroom that has the second-best grades student?
```sql
use student;
select distinct c.class 
from class as c 
    left join score as s 
        on c.name=s.name 
            where score=(
			                select score from 
                            (
							    select s.score from score as s 
                                    order by score desc 
                                        limit 2
							) 
                            order by score asc 
                                limit 1
						);
```