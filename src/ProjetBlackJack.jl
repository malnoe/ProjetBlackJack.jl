module ProjetBlackJack

using Vizagrams, Pluto, PlutoUI, HypertextLiteral

export game, Game, initialize_game, new!, turn!, end_game!, interaction, run_r_cartes_et_deck, run_r_jeu

include("blackjack_julia/main_terminal.jl")
include("blackjack_julia/jeu_pluto_notebook.jl")

using PyCall
using RCall

# Initialisation de l'environnement Python
function init_python_env()
    try
        
        pyimport("sys")  # Vérifie que Python est disponible
        println("Environnement Python initialisé avec succès.")
    catch e
        error("Échec de l'initialisation de l'environnement Python: $e")
    end
end

# Initialisation de l'environnement R
function init_r_env()
    try
        R"print('Initialisation de l'environnement R réussie')"  # Vérifie que R fonctionne
    catch e
        error("Échec de l'initialisation de l'environnement R: $e")
    end
end

# Fonction d'initialisation globale
function init()
    init_python_env()
    init_r_env()
end

function run_r_cartes_et_deck()
    script_path = joinpath(@__DIR__, "..", "deps", "blackjack_r", "Cartes_et_Deck.R")
    R"""
    source("$script_path")
    """
end

function run_r_jeu()
    script_path = joinpath(@__DIR__, "..", "deps", "blackjack_r", "le_jeu.R")
    R"""
    source("$script_path")
    """
end

init()
end
