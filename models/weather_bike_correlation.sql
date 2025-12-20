WITH CTE AS (

select
t.*,
w.*
from {{ ref('trip_fact') }} t
left join {{ ref('daily_weather') }} w
on t.TRIP_DATE = w.DAILYWEATHER


order by TRIP_DATE desc

)


select
*
from CTE