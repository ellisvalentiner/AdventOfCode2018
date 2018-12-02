import StatsBase: countmap

function puzzle2(datadir::String=joinpath(@__DIR__, "data"))
    instructions = readlines(normpath(joinpath(datadir, "2.txt")))
    lines = collect.(instructions)
    charcounts = countmap.(lines)
    partone = count(in.(2, values.(charcounts))) * count(in.(3, values.(charcounts)))

    n = length(instructions)
    m = zeros(Int, n, n)
    for i = 1:n, j = 1:i
        m[i,j] = sum(collect(instructions[i]) .!= collect(instructions[j]))
    end
    i, j = Tuple(findfirst(m .== 1))

    x, y = lines[[i, j]]
    parttwo = reduce(string, x[x .== y])

    return Dict("Part One" => partone, "Part Two" => parttwo)
end

export puzzle2
