module BlackJackBDD
  class Deck

    attr_writer :cards
    attr_reader :cards

    def initialize
      @cards = []
      ['H', 'D', 'C', 'S'].each do |brand|
        (1..13).each do |value|
          @cards <<  brand + value.to_s
        end
      end
    end

    def shuffle
      shuffled_deck = Deck.new
      shuffled_deck.cards = @cards.shuffle
      shuffled_deck

    end

    def size
      @cards.size
    end

    def deal(number_of_cards)
      @cards.pop(number_of_cards)
    end

    def ==(other_deck)
      @cards == other_deck.cards
    end

  end
end
