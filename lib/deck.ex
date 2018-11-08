defmodule Deck do
  def get_instance do
    # suits = ['Spade', 'Heart', 'Club', '\u2666']
	  suits = ["\u2660", "\u2665", "\u2663", "\u2666"]
    1..13
    |> Enum.map(
    fn r -> Enum.map(
        suits, fn s -> %{rank: r, suit: s, name: "#{r}#{s}"} end
      ) end
    )
    |> List.flatten
    |> Enum.shuffle
  end

  def get_hand(cards, cards_per_hand) do
    Enum.take(cards, cards_per_hand)
    |> Enum.sort(fn h1, h2 -> h1.rank < h2.rank end)
  end

  def get_hands(_, hands, _, 0) do
    hands
  end

  def get_hands(cards, hands, cards_per_hand, index) do
    hand = Deck.get_hand(cards, cards_per_hand)
    get_hands(cards -- hand, hands ++ [hand], cards_per_hand, index - 1)
  end

  def nice_print(hand) do
    hand
    |> Enum.map(fn c -> c.name end)
    |> Enum.join(" ")
  end
end
