module BlackJackBDD
  class Deck

    def initialize
      @cards = []
      ['H', 'D', 'C', 'S'].each do |brand|
        (1..13).each do |value|
          @cards <<  brand + value.to_s
        end
      end
    end

    def deal(number_of_cards)
      @cards.pop(number_of_cards)
    end

  end
end
