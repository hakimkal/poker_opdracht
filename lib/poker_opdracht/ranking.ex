defmodule PokerOpdracht.Ranking do
  alias PokerOpdracht.Card

  def evaluate(cards) do
    cards |> Enum.map(&to_tuple/1) |> Enum.sort()  |> eval 
  end

  defp to_tuple(%Card{rank: rank, suit: suit}) do
    {Card.get_upper_value(rank), suit}
  end

  defp eval([{a, s}, {_b, s}, {_c, s}, {_d, s}, {e, s}]) when e - a == 4, do: :straight_flush

  defp eval([{e, s}, {d, s}, {c, s}, {b, s}, {a, s}]), do: :flush

  defp eval([{a, _}, {a, _}, {a, _}, {a, _}, {b, _}]),
    do: :four_of_a_kind

  defp eval([{b, _}, {a, _}, {a, _}, {a, _}, {a, _}]),
    do: :four_of_a_kind

  defp eval([{a, _}, {b, _}, {c, _}, {d, _}, {e, _}])
       when a + 1 == b and b + 1 == c and c + 1 == d and d + 1 == e,
       do: :straight

  defp eval([{2, _}, {3, _}, {4, _}, {5, _}, {14, _}]), do: :straight

  defp eval([{a, _}, {a, _}, {a, _}, {b, _}, {b, _}]), do: :full_house
  defp eval([{b, _}, {b, _}, {a, _}, {a, _}, {a, _}]), do: :full_house

  defp eval([{a, _}, {a, _}, {a, _}, {c, _}, {b, _}]), do: :three_of_a_kind
  defp eval([{c, _}, {a, _}, {a, _}, {a, _}, {b, _}]), do: :three_of_a_kind
  defp eval([{c, _}, {b, _}, {a, _}, {a, _}, {a, _}]), do: :three_of_a_kind

  defp eval([{b, _}, {b, _}, {a, _}, {a, _}, {c, _}]), do: :two_pairs
  defp eval([{b, _}, {b, _}, {c, _}, {a, _}, {a, _}]), do: :two_pairs
  defp eval([{c, _}, {b, _}, {b, _}, {a, _}, {a, _}]), do: :two_pairs

  defp eval([{a, _}, {a, _}, {d, _}, {c, _}, {b, _}]), do: :one_pair
  defp eval([{d, _}, {a, _}, {a, _}, {c, _}, {b, _}]), do: :one_pair
  defp eval([{d, _}, {c, _}, {a, _}, {a, _}, {b, _}]), do: :one_pair
  defp eval([{d, _}, {c, _}, {b, _}, {a, _}, {a, _}]), do: :one_pair

  defp eval([{e, _}, {d, _}, {c, _}, {b, _}, {a, _}]), do: :high_card

  defp eval([{2, S}, {3, S}, {4, S}, {5, S}, {14, S}]),
    do: :straight_flush
end
