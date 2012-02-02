require 'spec_helper'

module BlackJackBDD
  describe Game do
    let(:output) { double('output').as_null_object }


    describe "#dealer_hand" do
      #let(:game) { Game.new(output, Deck.new) }

      it "returns the dealers hand" do
        deck = double('deck').as_null_object
        deck.stub(:deal).and_return(["S1", "S2"], ["S3", "S4"])
        game = Game.new(output, deck)
        game.start
        game.dealer_hand.cards.should == ["S3", "S4"]
      end

    end


    describe "#start" do

      let(:game) { Game.new(output, Deck.new) }
      
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to BlackJack BDD!')
        game.start
      end

      it "displays the hand" do
        output.should_receive(:puts).with('Here is your hand: S12, S13')
        game.start
      end
    end

    describe "#prompt_for_action" do

      it "prompts for action when not bust" do
        deck = double('deck').as_null_object
        deck.stub(:deal).and_return(["S1", "S2"])

        game = Game.new(output, deck)

        output.should_receive(:puts).with('Choose action (hit or stand)')

        game.start
        game.prompt_for_action
      end

      it "notifies of bust" do
        game = Game.new(output, Deck.new)

        # Assuming the default hand S12, S13 (score 25)
        output.should_receive(:puts).with("You are bust! Score: 25")
        game.start
        game.prompt_for_action
      end
    end
  end
end
