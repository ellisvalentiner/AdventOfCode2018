
function puzzle1(datadir::String=joinpath(@__DIR__, "data"))
    instructions = readlines(normpath(joinpath(datadir, "1.txt")))
    changes = parse.(Int, instructions)
    x = cumsum(changes)
    partone = last(x)
    frequency = 0
    frequencies = Dict(frequency => 1)
    found = false
    while !found
        for i in changes
            frequency += i
            if frequency in keys(frequencies)
                found = true
                frequencies[frequency] += 1
                break
            else
                frequencies[frequency] = 1
            end
        end
    end
    parttwo = findmax(frequencies)[2]
    return Dict("Part One" => partone, "Part Two" => parttwo)
end

export puzzle1
