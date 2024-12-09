module ProjetBlackJack

using Vizagrams, Pluto, PlutoUI, HypertextLiteral

export game, Game, initialize_game, new!, turn!, end_game!, interaction

includ("blackjack_julia/main_terminal.jl")
include("blackjack_julia/jeu_pluto_notebook.jl")

end
