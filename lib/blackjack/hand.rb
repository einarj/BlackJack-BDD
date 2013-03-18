module BlackJackBDD
  class Hand

    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end

    def receive(card)
      @cards << card
    end

    def card_count
      @cards.count
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

    def ace_values
      @cards.count { |card|
        card[1..-1].to_i == 1
      }
    end

    def score
      points = 0

      # start by scoring non-ace cards
      non_ace_values.collect { |value|
        points += value
      }

      # Maximize score for aces
      aces = ace_values
      while aces > 0 do
        if points + aces*11 > 21
          points += 1
          aces -= 1
        else
          points += aces*11
          aces = 0
        end
      end

      points
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
