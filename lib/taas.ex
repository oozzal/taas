defmodule Taas do
  def run(total_players, cards_per_hand) do
    Deck.deal(total_players, cards_per_hand)
    |> Deck.show()
  end
end
