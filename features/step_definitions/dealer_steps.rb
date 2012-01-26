Given /^a new deck of cards$/ do
end

When /^I deal two cards$/ do
  deck = BlackJackBDD::Deck.new
  @cards = deck.deal(2)
end

Then /^they should be "([^"]*)"$/ do |arg1|
  @cards.should == arg1.split(', ')
end
