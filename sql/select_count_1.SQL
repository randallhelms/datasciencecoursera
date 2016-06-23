Select count(*) 
from flights
where arr_time IS NOT NULL AND destination = 'ATL';