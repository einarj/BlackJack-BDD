module BlackJackBDD
  class Game

    def initialize(output)
      @output = output
    end

    def start
      @deck = Deck.new
      @player_cards = @deck.deal(2)
      @output.puts 'Welcome to BlackJack BDD!'
      @output.puts 'Here is your hand: ' + @player_cards.join(', ')
    end
  end
end
