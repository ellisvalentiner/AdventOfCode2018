#' # AdventOfCode2018
#'
#' [![Build Status](https://travis-ci.org/ellisvalentiner/AdventOfCode2018.jl.svg?branch=master)](https://travis-ci.org/ellisvalentiner/AdventOfCode2018.jl)
#'
#' [![Coverage Status](https://coveralls.io/repos/ellisvalentiner/AdventOfCode2018.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/ellisvalentiner/AdventOfCode2018.jl?branch=master)
#'
#' [![codecov.io](http://codecov.io/github/ellisvalentiner/AdventOfCode2018.jl/coverage.svg?branch=master)](http://codecov.io/github/ellisvalentiner/AdventOfCode2018.jl?branch=master)

#+ echo=false
using AdventOfCode2018
using BenchmarkTools
using Markdown
import Markdown: MD, Table
import Statistics: median, mean

table = ["Day" "Memory (MiB)" "Allocations" "Min. Time (ms)" "Median Time (ms)" "Mean Time (ms)" "Max. Time (ms)" "Samples"]
for puzzle in filter(x-> x≠ :AdventOfCode2018, names(AdventOfCode2018))
    m = match(r"[0-9]+", String(puzzle))
    day = string(parse(Int, m.match))
    @info "Puzzle $day"
    @eval begin
        result = @benchmark $puzzle()
        memory = round(result.memory / 1024^2, digits=2)
        allocations = result.allocs
        mintime = round(minimum(result.times) / 1_000_000, digits=3)
        mediantime = round(median(result.times) / 1_000_000, digits=3)
        meantime = round(mean(result.times) / 1_000_000, digits=3)
        maxtime = round(minimum(result.times) / 1_000_000, digits=3)
        n = length(result.times)
        row = [$day memory allocations mintime mediantime meantime maxtime n]
        table = vcat(table, row)
    end
end
table = vcat(table, ["**Median**" round.(median(table[2:end, 2:end], dims=1), digits=4)])
table = vcat(table, ["**Total**" round.(sum(table[2:(end-1), 2:end], dims=1), digits=4)])
performance = MD(Table(Any[map(x->Any[x], table[i, :]) for i in 1:size(table, 1)], Symbol[:l, :r, :r, :r, :r, :r, :r, :r]))

#' ## Performance

#+ echo=false
#+ results="as_is"
print(performance)
