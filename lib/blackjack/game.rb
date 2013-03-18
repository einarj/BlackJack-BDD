module BlackJackBDD
  class Game

    attr_accessor :player_hand, :dealer_hand

    def initialize(output, deck)
      @output = output
      @deck = deck
    end

    def hit_player
      @player_hand.receive(@deck.deal_one)
    end

    def start
      @player_hand = Hand.new(@deck.deal(2))
      @dealer_hand = Hand.new(@deck.deal(2))
      @output.puts 'Welcome to BlackJack BDD!'
    end

    def prompt_for_action

      @output.puts 'Here is your hand: ' + @player_hand.cards.join(', ')

      if @player_hand.bust 
        @output.puts "You are bust! Score: " + @player_hand.score.to_s
      else
        @output.puts "Choose action (hit or stand)"
      end
    end

    def determine_winner
      if @player_hand.bust
        @output.puts "You are BUST!"
      elsif @player_hand.score > @dealer_hand.score
        @output.puts "Congratulations, you have won!" unless @player_hand.bust
      elsif @player_hand.blackjack?
        @output.puts "You have blackjack!"
        if @dealer_hand.blackjack?
          @output.puts "Dealer also has blackjack. The score is tied."
        else
          @output.puts "Congratulations, you have won!"
        end
      else
        @output.puts "Blackjack?: #{@dealer_hand.blackjack?} - Hand: #{@dealer_hand.cards}"
        @output.puts "Dealer has blackjack!" if @dealer_hand.blackjack?
        @output.puts "You LOOSE!"
      end
    end
  end
end
