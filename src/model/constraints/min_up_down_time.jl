Base.@kwdef mutable struct MinUpTimeConstraint <: OperationConstraint
    value::Union{Missing,Vector{Float64}} = missing
    lagrangian_multiplier::Union{Missing,Vector{Float64}} = missing
    constraint_ref::Union{Missing,JuMPConstraint} = missing
end

Base.@kwdef mutable struct MinDownTimeConstraint <: OperationConstraint
    value::Union{Missing,Vector{Float64}} = missing
    lagrangian_multiplier::Union{Missing,Vector{Float64}} = missing
    constraint_ref::Union{Missing,JuMPConstraint} = missing
end

function add_model_constraint!(ct::MinDownTimeConstraint, e::EdgeWithUC, model::Model)

    if min_down_time(e) > minimum(length.(subperiods(e)))
        error(
            "The minimum down time for $(id(e)) is longer than the length of one subperiod",
        )
    else

        ct.constraint_ref = @constraint(
            model,
            [t in time_interval(e)],
            capacity(e) / capacity_size(e) - ucommit(e, t) >= sum(
                ushut(e, s) for
                s in [timestepbefore(t, h, subperiods(e)) for h = 0:min_down_time(e)-1];
                init = 0,
            )
        )
    end



    return nothing
end


function add_model_constraint!(ct::MinUpTimeConstraint, e::EdgeWithUC, model::Model)
    if min_up_time(e) > minimum(length.(subperiods(e)))
        error("The minimum up time for $(id(e)) is longer than the length of one subperiod")
    else
        ct.constraint_ref = @constraint(
            model,
            [t in time_interval(e)],
            ucommit(e, t) >= sum(
                ustart(e, s) for
                s in [timestepbefore(t, h, subperiods(e)) for h = 0:min_up_time(e)-1];
                init = 0,
            )
        )
    end

    return nothing
end
