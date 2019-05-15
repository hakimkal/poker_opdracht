defmodule CardTest do
  use ExUnit.Case
  alias PokerOpdracht.Card

  test "new deck returns  52 cards " do
    deck = Card.new_deck()
    assert Enum.count(deck) == 52
  end

  test "get suits returns C,D,H,S" do
    suits = [:C,:D,:H,:S]
    the_suits = Card.suits
    assert suits == the_suits
  end

  test "get card values returns correct list" do
    c_vals = [2, 3, 4, 5, 6, 7, 8, 9, "T", "J", "Q", "K", "A"]

    card_values =
      for v <- 2..14 do
        Card.get_upper_string(v)
      end

     
    assert card_values == c_vals
  end
end
