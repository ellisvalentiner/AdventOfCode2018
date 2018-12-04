
function parse_input3(line::String)
    offset = match(r"\d+,\d+", line).match
    left, top = parse.(Int, split(string(offset), ','))
    dimensions = match(r"\d+x\d+", line).match
    width, height = parse.(Int, split(string(dimensions), 'x'))
    squares = [(left + i, top + j) for i=1:width, j=1:height]
    return reshape(squares, (length(squares)))
end

function puzzle3(datadir::String=joinpath(@__DIR__, "data"))
    instructions = readlines(normpath(joinpath(datadir, "3.txt")))
    claims = parse_input3.(instructions)
    squareCounts = countmap(reduce(vcat, claims))
    partOne = count(values(squareCounts) .> 1)
    partTwo = 0

    for i in 1:length(claims)
        claim = claims[i]
        if all([squareCounts[k] for k in claim] .== 1)
            partTwo = i
            break
        end
    end

    return Dict("Part One" => partOne, "Part Two" => partTwo)
end

export puzzle3
