defmodule Deck do
  def deal(total_players, cards_per_hand) do
    get_instance()
    |> get_hands([], cards_per_hand, total_players)
  end

  def show(hands) do
    hands
    |> Enum.map(fn h -> nice_print(h) end)
  end

  def get_instance do
    suits = ["\u2660", "\u2665", "\u2663", "\u2666"]
    (
      for r <- 1..13, s <- suits, do: %{rank: r, suit: s, name: "#{r}#{s}"}
    ) |> Enum.shuffle
  end

  def get_hand(cards, cards_per_hand) do
    Enum.take(cards, cards_per_hand)
    |> Enum.sort(fn h1, h2 -> h1.rank < h2.rank end)
  end

  # draw till last player (total_players = 0)
  def get_hands(_, hands, _, 0) do
    hands
  end

  def get_hands(cards, hands, cards_per_hand, total_players) do
    hand = Deck.get_hand(cards, cards_per_hand)
    get_hands(cards -- hand, hands ++ [hand], cards_per_hand, total_players - 1)
  end

  def nice_print(hand) do
    hand
    |> Enum.map(fn c -> c.name end)
    |> Enum.join(" ")
  end
end
