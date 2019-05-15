defmodule PokerOpdracht.Card do
  alias PokerOpdracht.Card
  defstruct rank: nil, suit: nil
  @rank_TJQKA %{10 => "T", 11 => "J", 12 => "Q", 13 => "K", 14 => "A"}

  @spec new_deck() :: [any()]
  def start() do
    new_deck()
  end

  def new_deck() do
    for rank <- ranks, suit <- suits do
      %Card{rank: get_upper_string(rank), suit: suit}
    end
    |> Enum.shuffle()
  end

  def from_string(<<rank::size(8), suit::size(8)>>) do
    %__MODULE__{rank: get_upper_value(rank), suit: get_suit(suit)}
  end

  defp get_suit(str_v) do
    Enum.member?(suits(), String.upcase(str_v))
    String.upcase(str_v)
  end

  def ranks, do: Enum.to_list(2..14)
  def suits, do: [:C, :D, :H, :S]

  def get_upper_value(str_v) do
    if Enum.member?(Map.values(@rank_TJQKA), str_v) do
      @rank_TJQKA
      |> Enum.find(fn {_key, val} -> val == str_v end)
      |> elem(0)
    else
      String.to_integer(str_v)
    end
  end

  def get_upper_string(val) do
    if val > 9 && val <= 14 do
      @rank_TJQKA[val]
    else
      val
    end
  end
end
