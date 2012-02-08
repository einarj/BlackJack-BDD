module BlackJackBDD
  class Hand

    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end

    def bust
      score > 21
    end

    def score
      s = 0
      # Perhaps lambda is suitable here
      @cards.each do |card|
        s += card[1..-1].to_i
      end
      s
    end

    # A hand is a blackjack if it contains exactly
    # two cards, one ace and one jack.
    def blackjack?
      @cards.size == 2 and contains_ten_or_face and contains_ace
    end

    def contains_ten_or_face
      @cards.each do |card|
        return true if [10,  11, 12, 13].include? card[1..-1].to_i
      end

      false
    end

    def contains_ace
      @cards.each do |card|
        return true if card[1..-1].to_i == 1
      end

      false
    end
  end
end
