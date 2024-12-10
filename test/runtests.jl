using ProjetBlackJack
using Test

# @testset "ProjetBlackJack.jl" begin
#     # Write your tests here.


# end


@testset "R Script Execution" begin
    result = ProjetBlackJack.run_r_cartes_et_deck()
    
    # Vérifie que le résultat n'est pas vide ou nul
    @test !isnothing(result)

    # Vérifie si une certaine structure ou valeur est présente
    if !isnothing(result)
        println("Le script R a retourné : $result")
        # Ajoute ici des vérifications spécifiques si nécessaire
    end
end

