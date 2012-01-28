module BlackJackBDD
  class Game

    def initialize(output, deck)
      @output = output
      @deck = deck
    end

    def start
      #@deck = Deck.new
      @player_cards = @deck.deal(2)
      @hand = Hand.new(@player_cards)
      @output.puts 'Welcome to BlackJack BDD!'
      @output.puts 'Here is your hand: ' + @player_cards.join(', ')
    end

    def hand
      @hand
    end

    def prompt_for_action
      if @hand.bust 
        @output.puts "You are bust! Score: " + @hand.score.to_s
      else
        @output.puts "Choose action (hit or stand)"
      end
    end
  end
end
