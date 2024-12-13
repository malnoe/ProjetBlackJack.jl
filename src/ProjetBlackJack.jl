module ProjetBlackJack

using Vizagrams, Pluto, PlutoUI, HypertextLiteral, Downloads

export game, Game, initialize_game, new!, turn!, end_game!, interaction, blackjack_notebook

include("blackjack_julia/main_terminal.jl")
include("blackjack_julia/jeu_pluto_notebook.jl")

function blackjack_notebook()
    # URL vers le fichier notebook sur ton dépôt GitHub
    notebook_url = "https://raw.githubusercontent.com/malnoe/ProjetBlackJack.jl/master/examples/blackjack_notebook.jl"
    
    # Emplacement temporaire pour télécharger le fichier
    temp_notebook_path = joinpath(tempdir(), "blackjack_notebook.jl")

    # Télécharger le fichier
    Downloads.download(notebook_url, temp_notebook_path)

    # Ouvrir le notebook avec Pluto
    Pluto.run(notebook=temp_notebook_path)
end
end
