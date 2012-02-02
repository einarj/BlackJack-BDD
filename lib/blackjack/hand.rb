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
  end
end
