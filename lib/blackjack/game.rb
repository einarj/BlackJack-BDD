module BlackJackBDD
  class Game

    attr_accessor :player_hand, :dealer_hand

    def initialize(output, deck)
      @output = output
      @deck = deck
    end

    def start
      @player_hand = Hand.new(@deck.deal(2))
      @dealer_hand = Hand.new(@deck.deal(2))
      @output.puts 'Welcome to BlackJack BDD!'
      @output.puts 'Here is your hand: ' + @player_hand.cards.join(', ')
    end

    def prompt_for_action
      if @player_hand.bust 
        @output.puts "You are bust! Score: " + @player_hand.score.to_s
      else
        @output.puts "Choose action (hit or stand)"
      end
    end

    def determine_winner
      if @player_hand.score > @dealer_hand.score
        @output.puts "Congratulations, you have won!" unless @player_hand.bust
      end
    end
  end
end
