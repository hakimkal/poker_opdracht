defmodule PokerOpdracht do
  alias PokerOpdracht.Deck
   defdelegate start() ,to: Deck
end
