defmodule  PokerOpdracht.Deck do

    defdelegate start(), to: PokerOpdracht.Card 
    
end