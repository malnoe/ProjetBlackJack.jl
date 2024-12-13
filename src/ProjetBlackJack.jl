module ProjetBlackJack

using Vizagrams, Pluto, PlutoUI, HypertextLiteral, Downloads, PyCall

export help, game, Game, initialize_game, new!, turn!, end_game!, interaction, blackjack_notebook, cribble_erathostene_python, cribble_erathostene_python_time, cribble_erathostene_julia, cribble_erathostene_julia_time

include("blackjack_julia/main_terminal.jl")
include("blackjack_julia/jeu_pluto_notebook.jl")
include("Benchmark/erathostene.jl")

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

function help()
    println("Fonction utiles :")
    println("Blackjack Julia :")
    print("ProjetBlackJack.PlayGame.game(), blackjack_notebook()")
    println("Benchmarck :")
    print(" ProjetBlackJack.Benchmark.cribble_erathostene_python(n),  ProjetBlackJack.Benchmark.cribble_erathostene_python_time(n),  ProjetBlackJack.Benchmark.cribble_erathostene_julia(n),  ProjetBlackJack.Benchmark.cribble_erathostene_julia_time(n)")
    println("Dispatching :")
    print(".......")
end

end
