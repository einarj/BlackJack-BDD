require 'spec_helper'

module BlackJackBDD

  describe Deck do

    describe "#shuffle" do

      it "shuffles a new deck" do
        new_deck = Deck.new
        shuffled_deck = new_deck.shuffle

        shuffled_deck.size.should == new_deck.size

        shuffled_deck.should_not == new_deck
      end

    end

    describe "#size" do
      it "should be 52 cards" do
        Deck.new.size.should == 52
      end
    end
  end

end
