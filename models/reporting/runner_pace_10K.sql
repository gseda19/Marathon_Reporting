with raw_results as (
    select
        runner_id,
        event,
        time_minutes,
        distance_in_km
    from {{ source('marathon_raw', 'raw_results') }}
    where event = '10K'
),

runners as (
    select
        runner_id,
        name,
        gender
    from {{ ref('stg_runners') }}
)

select
    r.runner_id,
    r.name,
    r.gender,
    res.time_minutes,
    res.distance_in_km,
    {{ marathon_staging.calculate_runner_pace('distance_in_km', 'time_minutes') }} as pace_min_per_km
from raw_results res
join runners r
    on res.runner_id = r.runner_id
