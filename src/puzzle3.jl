
function parse_input3(line::String)
    id, left, top, width, height = [parse(Int, x.match) for x in collect(eachmatch(r"\d+", line))]
    squares = [(left + i, top + j) for i=1:width, j=1:height]
    return reshape(squares, (length(squares)))
end

function puzzle3(datadir::String=joinpath(@__DIR__, "data"))
    filename = normpath(joinpath(datadir, "3.txt"))
    instructions = readlines(filename)
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
