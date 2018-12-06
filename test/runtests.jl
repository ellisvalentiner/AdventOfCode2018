using AdventOfCode2018
using BenchmarkTools
using Test

@testset begin
    @test puzzle1() == Dict("Part One"=>538,"Part Two"=>77271)
    @test puzzle2() == Dict("Part One"=>6448,"Part Two"=>"evsialkqyiurohzpwucngttmf")
    @test puzzle3() == Dict("Part One"=>121163,"Part Two"=>943)
    @test puzzle4() == Dict("Part One"=>20859,"Part Two"=>76576)
    @test puzzle5() == Dict("Part One"=>9060,"Part Two"=>6310)
end
