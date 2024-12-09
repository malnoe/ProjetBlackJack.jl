module ProjetBlackJack

using Random, Vizagrams, Pluto, PlutoUI, HypertextLiteral # Write here the packages we use

export game, Game, initialize_game, new!, turn!, end_game!, interaction # all the functions we want to be able to use from the package

include("blackjack_julia/carte.jl")
inclue("blackjack_julia/deck.jl")
inclue("blackjack_julia/jeu.jl")
include("blackjack_julia/jeu_pluto_notebook.jl")
inclued("blackjack_julia/main_terminal.jl")
# Write your package code here.

end
