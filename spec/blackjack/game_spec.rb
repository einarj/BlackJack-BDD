require 'spec_helper'

module BlackJackBDD
  describe Game do
    describe "#start" do
      it "sends a welcome message" do
        output = double('output').as_null_object
        game = Game.new(output)

        output.should_receive(:puts).with('Welcome to BlackJack BDD!')

        game.start
      end

      it "displays the hand" do
        output = double('output').as_null_object
        game = Game.new(output)

        output.should_receive(:puts).with('Here is your hand:')

        game.start
      end

      it "prompts for action unless bust"
    end
  end
end
