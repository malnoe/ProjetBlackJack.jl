module BlackjackPython
using PyCall

py"""
dico_card_value = {
    "ace" : 1,
    "2" : 2,
    "3" : 3,
    "4" : 4,
    "5" : 5,
    "6" : 6,
    "7" : 7,
    "8" : 8,
    "9" : 9,
    "10" : 10,
    "jack" : 10,
    "queen" : 10,
    "king" : 10
}

class Card:
  def __init__(self, suit, rank):
    self.suit = suit
    self.rank = rank

def card_value(card):
    return dico_card_value[card.rank]

import random
    
    
class Deck:
    def __init__(self, cards):
        self.cards = cards
    
def print_deck_values(d):
    for card in d.cards :
        print(str(card_value(card))+" ")
    
    
    
    # Creation d'un jeu de 52 cartes
suits = ["clubs","spades","hearts","diamonds"]
ranks = ["ace","2","3","4","5","6","7","8","9","10","jack","queen","king"]
    
def create_deck_52():
    cards_list = []
    for suit in suits :
        for rank in ranks:
            cards_list.append(Card(suit,rank))
    return Deck(cards_list)
    

    
# Fonction de concaténation de decks
def concat_decks(decks):
    cards_list = decks[0].cards
    for i in range(1,len(decks)):
        cards_list = cards_list + decks[i].cards
    return Deck(cards_list)
    
    
    # Fonction de création d'un jeu de blackjack
def create_blackjack(number=6):
    deck_52 = create_deck_52()
    list_decks = [deck_52]
    for _ in range(1,number):
        list_decks.append(deck_52)
    return concat_decks(list_decks)
    
blackjack_deck = create_blackjack()
    
    # Mélanger les cartes d'une main
def shuffle(d):
       # Attention, modifie le deck !
    random.shuffle(d.cards)
    
    # Créer une main vide
def create_empty_hand():
    return Deck([])
    
    # Fonction de calcul de la valeur d'une main
def hand_value(d):
    value = 0
    aces = 0
    for card in d.cards:
        rank = card.rank
        if rank == "ace":
            aces +=1
            value +=11
        else:
            value += dico_card_value[rank]
        
    while(value>21 and aces > 0):
        value -=10
        aces -=1
    
    return value
    
    # Fonction take_a_card
def take_a_card(pile,hand):
    new_card = pile.cards.pop(0) #Premier element
    hand.cards.append(new_card)
    return
    
    
    # Fonction display_hand
def display_hand(hand,name):
    print("The " + name + " hand : ")
    for card in hand.cards :
        print(card.rank + " of " + card.suit + ", ")
    print("")


def jeu():
    # Instancier un deck de black jack
    blackjack_deck = create_blackjack()

    # On le mélange
    shuffle(blackjack_deck)

    # Instancier une main pour le dealer et le joueur
    player_hand = create_empty_hand()
    dealer_hand = create_empty_hand()

    # Distribution des cartes
    take_a_card(blackjack_deck,player_hand)
    take_a_card(blackjack_deck,dealer_hand)
    take_a_card(blackjack_deck,player_hand)

    # On affiche la main du dealer
    display_hand(dealer_hand,"dealer")
    hand_value_dealer = hand_value(dealer_hand)
    print("Current dealer hand value :")
    print(hand_value_dealer)

    # Boucle de jeu pour le joueur
    display_hand(player_hand,"player")
    hand_value_player = hand_value(player_hand)
    print("Current player hand value :")
    print(hand_value_player)
    refus = False
    while((hand_value_player<21) and (not refus)):
        print("Do you want to take a new card ? Press Y or N.")
        
        while True:
            input_player = input("")
            if (input_player == "y") or (input_player == "Y") :
                print("You want a new card !")
                take_a_card(blackjack_deck,player_hand)
                display_hand(player_hand,"player")
                hand_value_player = hand_value(player_hand)
                print("Current player hand value :")
                print(hand_value_player)

                if hand_value_player > 21 :
                    print("You went above 21 ! You lost.")
                    return
                
                break
            elif (input_player == "n") or (input_player == "N") :
                print("Ok, no new card...")
                refus = True
                break
    
    #Résolution pour le dealer : il tire jusqu'à atteindre un minimum de 17
    display_hand(dealer_hand,"dealer")
    hand_value_dealer = hand_value(dealer_hand)
    print("Current dealer hand value :")
    print(hand_value_dealer)
    while hand_value_dealer < 17:
        take_a_card(blackjack_deck,dealer_hand)
        display_hand(dealer_hand,"dealer")
        hand_value_dealer = hand_value(dealer_hand)
        print("Current dealer hand value :")
        print(hand_value_dealer)

    # Affichage fin de partie
    if ((hand_value_player <= 21) and ((hand_value_dealer < hand_value_player) or hand_value_dealer > 21)):
        print("You won !")
    elif ((hand_value_dealer <= 21) and (hand_value_dealer > hand_value_player)):
        print("The dealer won...")
    else:
        print("Draw.")
    
    return
        
"""
function blackjack_python()
    py"jeu()"
end 

export blackjack_python
end