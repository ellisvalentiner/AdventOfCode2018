using Dates
import StatsBase: countmap

dtformat = dateformat"[yyyy-mm-dd HH:MM]"

function parse_input4(line::String)
    dt = DateTime(line[1:18], dtformat)
    msg = line[20:end]
    asleep = occursin("falls asleep", msg)
    if occursin(r"\d+", msg)
        guard = parse(Int, match(r"\d+", msg).match)
    else
        guard = missing
    end
    return [dt guard asleep]
end

function puzzle4(datadir::String=joinpath(@__DIR__, "data"))
    filename = normpath(joinpath(datadir, "4.txt"))
    records = reduce(vcat, parse_input4.(eachline(filename)))
    df = records[sortperm(records[:, 1]), :]
    for i in 1:size(df, 1)
        if ismissing(df[i, 2])
            df[i, 2] = df[i-1, 2]
        end
    end
    d = Dict()
    g = Dict()
    # For each row
    for i in 1:size(df, 1)
        # If the guard is asleep
        if df[i, 3]
            guardid = df[i, 2]
            # If the guard hasn't changed
            if (guardid == df[i+1, 2])
                cur_time = Time(df[i, 1])
                next_time = Time(df[i + 1, 1])
                while cur_time < next_time
                    if !haskey(d, guardid)
                        d[guardid] = []
                        g[guardid] = 0
                    end
                    append!(d[guardid], [cur_time])
                    g[guardid] += 1
                    cur_time += Minute(1)
                end
            end
        end
    end
    n, guardid = findmax(g)
    n, at = findmax(countmap(d[guardid]))
    partOne = minute(at) * guardid

    m = Dict()
    for (k, v) in d
        m[k] = findmax(countmap(v))
    end
    (a, b) = findmax(m)
    partTwo = minute(a[2]) * b

    return Dict("Part One" => partOne, "Part Two" => partTwo)
end

export puzzle4
