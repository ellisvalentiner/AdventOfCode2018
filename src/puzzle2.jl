using StatsBase

function puzzle2(datadir::String=joinpath(@__DIR__, "data"))
    instructions = readlines(normpath(joinpath(datadir, "2.txt")))
    charcounts = countmap.(collect.(instructions))
    partone = count(in.(2, values.(charcounts))) * count(in.(3, values.(charcounts)))

    n = length(instructions)
    m = zeros(Int, n, n)
    for i = 1:n, j = 1:n
        m[i,j] = sum(collect(instructions[i]) .!= collect(instructions[j]))
    end
    i, j = Tuple(findfirst(m .== 1))

    x = instructions[i]
    y = instructions[j]
    parttwo = reduce(string, collect(x)[collect(x) .== collect(y)])

    return Dict("Part One" => partone, "Part Two" => parttwo)
end

export puzzle2
