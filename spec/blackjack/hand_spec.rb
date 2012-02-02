require 'spec_helper'

module BlackJackBDD
  describe Hand do
   
    before(:each) do
      @hand = Hand.new(['S1', 'S2'])
    end


    describe "#score" do
      it "computes score for two cards of same sort" do
        @hand.score.should == 3
      end
    end

    describe "#cards" do
      it "returns its cards as an array" do
        @hand.cards.should == ['S1', 'S2']
      end
    end

  end
end
