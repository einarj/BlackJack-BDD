module BlackJackBDD
  class Card

    attr_reader :brand, :value

    def initialize(brand, value)
      @brand = brand
      @value = value
    end

    def blackjack_value
      value > 10 ? 10 : value
    end

    def is_ace?
      @value == 1
    end

    def to_s
      "#{brand}#{value}"
    end

    def self.from_string(card_string)
      BlackJackBDD::Card.new(card_string[0], card_string[1..-1].to_i)
    end

  end
end
