#' # AdventOfCode2018
#'
#' [![Build Status](https://travis-ci.org/ellisvalentiner/AdventOfCode2018.jl.svg?branch=master)](https://travis-ci.org/ellisvalentiner/AdventOfCode2018)
#'
#' [![Coverage Status](https://coveralls.io/repos/ellisvalentiner/AdventOfCode2018.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/ellisvalentiner/AdventOfCode2018?branch=master)
#'
#' [![codecov.io](http://codecov.io/github/ellisvalentiner/AdventOfCode2018.jl/coverage.svg?branch=master)](http://codecov.io/github/ellisvalentiner/AdventOfCode2018?branch=master)

#+ echo=false
using AdventOfCode2018
using Markdown
import Markdown: MD, Table
import Statistics: median

table = ["Day" "Elapsed (s)" "Allocated (MiB)" "Garbage Collection (s)"]
for puzzle in filter(x-> x≠ :AdventOfCode2018, names(AdventOfCode2018))
    m = match(r"[0-9]+", String(puzzle))
    day = string(parse(Int, m.match))
    @info "Puzzle $day"
    @eval begin
        val, t, bytes, gctime, memallocs = @timed $puzzle()
        t = round(t, digits=4)
        kib = round(bytes/1024^2, digits=4)
        gctime = round(gctime, digits=4)
        row = [$day t kib gctime]
        table = vcat(table, row)
    end
end
table = vcat(table, ["**Median**" round.(median(table[2:end, 2:end], dims=1), digits=4)])
table = vcat(table, ["**Total**" round.(sum(table[2:(end-1), 2:end], dims=1), digits=4)])
performance = MD(Table(Any[map(x->Any[x], table[i, :]) for i in 1:size(table, 1)], Symbol[:l, :r, :r, :r]))

#' ## Performance

#+ echo=false
#+ results="as_is"
print(performance)
