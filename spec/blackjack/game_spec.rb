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

        output.should_receive(:puts).with('Here is your hand: S12, S13')

        game.start
      end

      it "prompts for action unless bust" do
        pending("Need to fix a bug in hand score calculation")
        output = double('output').as_null_object
        game = Game.new(output)
        hand = Hand.new(['S1', 'S2'])
        game.stub(:hand).and_return(hand)

        output.should_receive(:puts).with('Choose action (hit or stand)')

        game.start
        game.prompt_for_action
      end
    end
  end
end
