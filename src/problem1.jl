
function problem1(datadir::String=joinpath(@__DIR__, "data"))
    instructions = readlines(joinpath(datadir, "1.txt"))
    changes = Meta.parse.(instructions)
    partone = last(cumsum(changes))
    frequencies = [0]
    i = 1
    n = length(changes)
    while notfound
        frequency = last(frequencies) + changes[i % n]
        if frequency in frequencies
            parttwo = frequency
            break
        end
        append!(frequencies, [frequency])
        i += 1
    end
    return Dict("Part One" => partone, "Part Two" => parttwo)
end
