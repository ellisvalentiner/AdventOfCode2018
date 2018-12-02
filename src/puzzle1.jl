
function puzzle1(datadir::String=joinpath(@__DIR__, "data"))
    instructions = readlines(normpath(joinpath(datadir, "1.txt")))
    changes = Meta.parse.(instructions)
    x = cumsum(changes)
    partone = last(x)
    frequencies = [0]
    found = false
    parttwo = 0
    while !found
        for i in changes
            val = last(frequencies) + i
            if val in frequencies
                parttwo = val
                found = true
                break
            end
            append!(frequencies, val)
        end
    end
    return Dict("Part One" => partone, "Part Two" => parttwo)
end

export puzzle1
