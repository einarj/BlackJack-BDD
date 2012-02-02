module BlackJackBDD
  class Game

    attr_reader :dealer_hand
    attr_writer :dealer_hand

    attr_reader :player_hand
    attr_writer :player_hand

    def initialize(output, deck)
      @output = output
      @deck = deck
    end

    def start
      @player_cards = @deck.deal(2)
      @dealer_cards = @deck.deal(2)
      @player_hand = Hand.new(@player_cards)
      @dealer_hand = Hand.new(@dealer_cards)
      @output.puts 'Welcome to BlackJack BDD!'
      @output.puts 'Here is your hand: ' + @player_cards.join(', ')
    end

    def hand
      @hand
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
