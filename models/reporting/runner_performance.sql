select
    prof.runner_id,
    prof.name,
    prof.gender,
    pb.event,
    pb.time_minutes as personal_best_time
from {{ ref('runner_profile_snap')}} prof
left join {{('runners_current_pb') }} pb
    on prof.runner_id = pb.runner_id