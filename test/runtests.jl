using ProjetBlackJack
using Test

@testset "ProjetBlackJack.jl" begin
    # Write your tests here.


end
@testset "R Script Test" begin
    try
        run_r_jeu()
        @test true  # Pass the test if no errors occur
    catch e
        @test false "R script failed: $e"
    end
end
