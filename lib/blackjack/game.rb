module BlackJackBDD
  class Game

    def initialize(output)
      @output = output
    end

    def start
      @output.puts 'Welcome to BlackJack BDD!'
      @output.puts 'Here is your hand:'
    end
  end
end
