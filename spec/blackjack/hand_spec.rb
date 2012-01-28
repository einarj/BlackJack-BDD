require 'spec_helper'

module BlackJackBDD
  describe Hand do
    
    describe "#score" do

      it "computes score for two cards of same sort" do
        hand = Hand.new(['S1', 'S2'])
        hand.score.should == 3
      end

    end

  end
end
