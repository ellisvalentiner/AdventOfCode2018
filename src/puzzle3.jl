
function parse_input(line::String)
    id = match(r"\#\d", line).match
    offset = match(r"\d+,\d+", line).match
    left, top = parse.(Int, split(string(offset), ','))
    dimensions = match(r"\d+x\d+", line).match
    width, height = parse.(Int, split(string(dimensions), 'x'))
    area = width * height
    squares = [(left + i, top + j) for i=1:width, j=1:height]
    return reshape(squares, (length(squares)))
end

function puzzle3(datadir::String=joinpath(@__DIR__, "data"))
    instructions = readlines(normpath(joinpath(datadir, "3.txt")))
    claims = parse_input.(instructions)
    squarecounts = countmap(reduce(vcat, claims))
    partOne = sum(values(squarecounts) .> 1)
    partTwo = 0

    for i in 1:length(claims)
        if all([squarecounts[Tuple(k)] for k in claims[i]] .== 1)
            partTwo = i
            break
        end
    end

    return Dict("Part One" => partOne, "Part Two" => partTwo)
end

export puzzle3
