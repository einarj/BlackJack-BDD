class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
    @output ||= Output.new
end

Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  @game = BlackJackBDD::Game.new(output, BlackJackBDD::Deck.new)
  @game.start
  @game.prompt_for_action
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

Then /^unless the player is bust I should see "([^"]*)"$/ do |message|
  unless @game.player_hand.bust
    output.messages.should include(message)
  end
end



# Player wins the game
Given /^a dealer hand of "([^"]*)"$/ do |hand|
  @game = BlackJackBDD::Game.new(output, BlackJackBDD::Deck.new)
  @game.dealer_hand = BlackJackBDD::Hand.new(hand.split(", "))
end

When /^I have a hand of "([^"]*)"$/ do |hand|
  @game.player_hand = BlackJackBDD::Hand.new(hand.split(", "))
end

When /^the score is determined$/ do
  @game.determine_winner
end


#Player loses the game
Given /^a new deck$/ do
  @game = BlackJackBDD::Game.new(output, BlackJackBDD::Deck.new)
end

When /^the cards have been dealt$/ do
  @game.start
end

When /^I choose hit$/ do
    pending # express the regexp above with the code you wish you had
end
