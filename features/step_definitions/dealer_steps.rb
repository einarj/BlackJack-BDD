Given /^a new deck of cards$/ do
end

When /^I deal two cards$/ do
  deck = BlackJackBDD::Deck.new
  @cards = deck.deal(2)
end

Then /^they should be "([^"]*)"$/ do |arg1|
  @cards.should == arg1.split(', ')
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
