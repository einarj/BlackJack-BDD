require 'spec_helper'

module BlackJackBDD
  describe Game do
    describe "#start" do
      it "sends a welcome message" do
        output = double('output')
        game = Game.new(output)

        output.should_receive(:puts).with('Welcome to BlackJack BDD!')

        game.start
      end
      it "displays the hand"
      it "prompts for action unless bust"
    end
  end
end
