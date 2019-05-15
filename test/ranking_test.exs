defmodule RankingTest do
  alias PokerOpdracht.Card
  # alias PokerOpdracht.Deck
  alias PokerOpdracht.Ranking
  use ExUnit.Case, async: true

  def cards_from_string(hand) do
    hand
    |> String.split(" ")
    |> Enum.map(fn f ->
      lsd = String.codepoints(f)
      %Card{rank: Enum.at(lsd, 0), suit: String.upcase(Enum.at(lsd, 1)) |> String.to_atom()}
    end)
  end

  def assert_rank(hand, rank) do
    cards = cards_from_string(hand)
    actual_rank = Ranking.evaluate(cards)
    assert actual_rank == rank, "Expected #{hand} to have rank #{rank}, got #{actual_rank}"
  end

  test "#rank" do
    assert_rank("2h 7h 8h 9h Th", :flush)
    assert_rank("Ks Qs Js 9s Ts", :straight_flush)
    assert_rank("2H 3D 5S 9C KD", :high_card)
    assert_rank("Ks Kd Kc Kh As", :four_of_a_kind)
    assert_rank("Ks Qc Js Ah Ts", :straight)
    assert_rank("3s 3d 3c 9h As", :three_of_a_kind)
    assert_rank("Ks Kd 9c 9h As", :two_pairs)
    assert_rank("Ks Qd 9c 9h As", :one_pair)
    assert_rank "Ks Kd Kc 9h 9s", :full_house
  end
end
