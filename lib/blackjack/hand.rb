module BlackJackBDD
  class Hand

    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end

    def bust
      score > 21
    end


    def values
      @cards.collect { |card|
        value = card[1..-1].to_i
        value = 10 if value > 10
        value
      }
    end

    def non_ace_values
      values - [1]
    end

    def aces
      @cards.count { |card|
        card[1..-1].to_i == 1
      }
    end

    def score
      s = 0
      aces = aces()
      # Perhaps lambda is suitable here

      # start by scoring non-ace cards
      non_ace_values.collect { |value|
        s += value
      }

      # Maximize score for aces
      while aces > 0 do
        if s + aces*11 > 21
          s += 1
          aces -= 1
        else
          s += aces*11
          aces = 0
        end
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
