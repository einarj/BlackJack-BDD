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
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

Then /^unless the player is bust I should see "([^"]*)"$/ do |message|
  unless @game.hand.bust
    output.message.should include(message)
  end
end
