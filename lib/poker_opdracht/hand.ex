defmodule PokerOpdracht.Hand do
  # defstruct(players: [],hands: [])  
  alias PokerOpdracht.Deck
  alias PokerOpdracht.Ranking

  def start() do
    hand_count = 2
    deck = Deck.start()

    player1_cards = Enum.slice(deck, 0..4)  
    player2_cards = Enum.slice(deck, 5..9)  
    
   
  end
end
