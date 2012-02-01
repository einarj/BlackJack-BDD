Given /^a new deck of cards$/ do
  @deck = BlackJackBDD::Deck.new
end

When /^I deal two cards$/ do
  @cards = @deck.deal(2)
end

Then /^they should be "([^"]*)"$/ do |arg1|
  @cards.should == arg1.split(', ')
end

Then /^the player is bust$/ do
  hand = BlackJackBDD::Hand.new(@cards)
  hand.bust.should == true
end

When /^the deck is shuffled$/ do
  @deck = @deck.shuffle
end

Then /^the order of cards has been changed$/ do
  cards = @deck.deal(2)
  cards.should_not == ['S12', 'S13']
end



Given /^a dealt hand$/ do
end

When /^the hand is "([^"]*)"$/ do |cards|
  card_arr = cards.split(', ')
  @hand = BlackJackBDD::Hand.new(card_arr)
end

Then /^the score should be "([^"]*)"$/ do |score|
  @hand.score.should == score.to_i
end

