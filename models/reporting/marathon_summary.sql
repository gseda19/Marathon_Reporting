SELECT
  r.runner_id,
  r.name,
  r.age,
  r.gender,
  res.event,
  res.time_minutes
FROM {{ ref('marathon_staging', 'stg_runners') }} AS r
JOIN {{ ref('marathon_staging', 'stg_results') }} AS res
  ON r.runner_id = res.runner_id