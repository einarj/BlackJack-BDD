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
  game = BlackJackBDD::Game.new(output)
  game.start
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end

Then /^unless the player is bust I should see "([^"]*)"$/ do |arg1|
    pending # express the regexp above with the code you wish you had
end

