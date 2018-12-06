
function react_polymer(a::String, patterns::Array{String,1})
    while any(map(x->occursin(x, a), patterns))
        for p in patterns
            a = replace(a, p => "")
        end
    end
    return a
end

function puzzle5(datadir::String=joinpath(@__DIR__, "data"))
    filename = normpath(joinpath(datadir, "5.txt"))
    input = readline(filename)
    pattern = ["$a$(uppercase(a))" for a in 'a':'z']
    append!(pattern, reverse.(pattern))

    result = react_polymer(input, pattern)
    partOne = length(result)

    polymer_lengths = Dict()
    for char in 'a':'z'
        withoutlower = replace(input, char => "")
        withoutchar = replace(withoutlower, uppercase(char) => "")
        result = react_polymer(withoutchar, pattern)
        polymer_lengths[char] = length(result)
    end
    partTwo = findmin(polymer_lengths)[1]

    return Dict("Part One" => partOne, "Part Two" => partTwo)
end

export puzzle5
