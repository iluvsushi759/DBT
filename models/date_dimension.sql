with CTE as (

select 
to_timestamp(started_at) as started_at,
DATE(to_timestamp(started_at)) as DATE_STARTED_AT,
hour(to_timestamp(started_at)) as hour_started_at,
CASE
when dayname(to_timestamp(started_at)) in ('Sat', 'Sun')
then 'WEEKEND'
else 'BusinessDay'
end as DayType,
case
    when month(to_timestamp(started_at)) in (12, 1, 2,3)
    then 'WINTER'
    when month(to_timestamp(started_at)) in (4, 5)
    then 'SPING'
    when month(to_timestamp(started_at)) in (6, 7, 8)
    then 'SUMMER'
else 'FALL'
end as Season


from 
{{ source('demo', 'bike') }}
where started_at != 'started_at'
)


select * from CTE 