module ProjetBlackJack

using Vizagrams, Pluto, PlutoUI, HypertextLiteral

export game, Game, initialize_game, new!, turn!, end_game!, interaction, blackjack_notebook

include("blackjack_julia/main_terminal.jl")
include("blackjack_julia/jeu_pluto_notebook.jl")

function blackjack_notebook()
    # Specify the path to the example notebook
    notebook_path = joinpath(@__DIR__,"examples", "blackjack_notebook.jl")
    if isfile(notebook_path)
        Pluto.run(notebook=notebook_path)
    else
        error("Notebook file not found: $notebook_path")
    end
end


end
