with CTE as (

select 
to_timestamp(started_at) as started_at,
DATE(to_timestamp(started_at)) as DATE_STARTED_AT,
hour(to_timestamp(started_at)) as hour_started_at,

{{day_type('started_at')}} as day_type,

{{ get_season('started_at') }} AS season

from 
{{ source('demo', 'bike') }}
where started_at != 'started_at'
)


select * from CTE 