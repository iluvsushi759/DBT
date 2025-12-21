{% macro get_season(x) %}

case
    when month(to_timestamp({{x}})) in (12, 1, 2,3)
    then 'WINTER'
    when month(to_timestamp({{x}})) in (4, 5)
    then 'SPING'
    when month(to_timestamp({{x}})) in (6, 7, 8)
    then 'SUMMER'
else 'FALL'
end

{% endmacro %}

{%macro day_type(x) %}

CASE
when dayname(to_timestamp({{x}})) in ('Sat', 'Sun')
then 'WEEKEND'
else 'BusinessDay'
end 

{% endmacro%}