
function problem1(datadir::String=joinpath(@__DIR__, "data"))
    instructions = readlines(normpath(joinpath(datadir, "1.txt")))
    changes = Meta.parse.(instructions)
    x = cumsum(changes)
    partone = last(x)
    frequencies = [0]
    while length(frequencies) == length(unique(frequencies))
        y = last(frequencies) .+ x
        append!(frequencies, y)
    end
    for i in 1:length(frequencies)
        val = frequencies[i]
        n = count(x->x == val, frequencies)
        @info "$val\t$n"
        if n == 2
            global parttwo = val
            break
        end
    end
    return Dict("Part One" => partone, "Part Two" => parttwo)
end

@info problem1()

