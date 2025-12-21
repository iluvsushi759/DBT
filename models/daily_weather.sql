with daily_weather as (

    select date(time) as DailyWeather,
    weather,
    temp,
    pressure,
    humidity,
    clouds

    from {{ source('demo', 'weather') }}
    
),

daily_weather_agg as (
    select DailyWeather,
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidity,
    round(avg(clouds),2) as avg_clouds
    --count(weather),
    --row_number() over (partition by DailyWeather order by count(weather) desc) as row_number
    from daily_weather
    group by DailyWeather, weather
    qualify row_number() over (partition by DailyWeather order by count(weather) desc) =1

)

select *  from daily_weather_agg