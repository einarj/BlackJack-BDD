require 'spec_helper'

module BlackJackBDD
  describe Game do
    describe "#start" do
      it "sends a welcome message" do
        output = double('output').as_null_object
        game = Game.new(output, Deck.new)

        output.should_receive(:puts).with('Welcome to BlackJack BDD!')

        game.start
      end

      it "displays the hand" do
        output = double('output').as_null_object
        game = Game.new(output, Deck.new)

        output.should_receive(:puts).with('Here is your hand: S12, S13')

        game.start
      end
    end

    describe "#prompt_for_action" do

      it "prompts for action when not bust" do
        #pending("Need to fix a bug in hand score calculation")
        output = double('output').as_null_object
        deck = double('deck').as_null_object
        deck.stub(:deal).and_return(["S1", "S2"])

        game = Game.new(output, deck)

        output.should_receive(:puts).with('Choose action (hit or stand)')

        game.start
        game.prompt_for_action
      end

      it "notifies of bust" do
        output = double('output').as_null_object
        game = Game.new(output, Deck.new)

        # Assuming the default hand S12, S13 (score 25)
        output.should_receive(:puts).with("You are bust! Score: 25")
        game.start
        game.prompt_for_action
      end
    end
  end
end
