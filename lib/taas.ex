defmodule Taas do
  def run(total_players, cards_per_hand) do
    Deck.get_instance
    |> Deck.get_hands([], cards_per_hand, total_players)
    |> Enum.map(fn h -> Deck.nice_print(h) end)
  end
end
