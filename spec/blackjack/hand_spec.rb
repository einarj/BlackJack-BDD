require 'spec_helper'

module BlackJackBDD
  describe Hand do

    before(:each) do
      @hand = Hand.new([
        BlackJackBDD::Card.new('S', 1),
        BlackJackBDD::Card.new('S', 2)
      ])
    end


    describe "#score" do
      it "computes score for two cards of same sort" do
        @hand.score.should == 13
      end

      it "should score aces in the optimal way" do
        hand = Hand.new([
          BlackJackBDD::Card.new("S", 10),
          BlackJackBDD::Card.new("S", 1),
          BlackJackBDD::Card.new("C", 1)
        ])
        hand.score.should == 12
      end
    end

    describe "#cards" do
      it "returns its cards as an array" do
        @hand.cards.class.should == Array
      end
    end

    describe "#contains_ten_or_face" do
      it "has no ten or face cards" do
        @hand.contains_ten_or_face.should == false
      end

      it "has a jack" do
        jacks = Hand.new([
          BlackJackBDD::Card.new('S', 1), 
          BlackJackBDD::Card.new('S', 11)
        ])
        jacks.contains_ten_or_face.should == true
      end
    end

    describe "#contains_ace" do
      it "has an ace" do
        @hand.contains_ace.should == true
      end

      it "has no ace" do
        noace = Hand.new([
          BlackJackBDD::Card.new('S', 2), 
          BlackJackBDD::Card.new('S', 3)
        ])
        noace.contains_ace.should == false
      end
    end

    describe "#blackjack" do
      it "is not blackjack" do
        @hand.blackjack?.should == false
      end

     it "is blackjack" do
      blackjack = Hand.new([
        BlackJackBDD::Card.new('S', 1),
        BlackJackBDD::Card.new('S', 11)
      ])
      blackjack.blackjack?.should == true
     end 
    end

  end
end
