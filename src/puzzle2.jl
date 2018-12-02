import StatsBase: countmap

function puzzle2(datadir::String=joinpath(@__DIR__, "data"))
    instructions = readlines(normpath(joinpath(datadir, "2.txt")))
    lines = collect.(instructions)
    charcounts = countmap.(lines)
    partone = count(in.(2, values.(charcounts))) * count(in.(3, values.(charcounts)))

    function find_closest(lines)
        n = length(lines)
        for i = 1:n, j = 1:i
            delta = sum(lines[i] .!= lines[j])
            if delta == 1
                return i, j
            end
        end
    end
    i,j = find_closest(lines)

    x, y = lines[[i, j]]
    parttwo = reduce(string, x[x .== y])

    return Dict("Part One" => partone, "Part Two" => parttwo)
end

export puzzle2
