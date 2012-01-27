Feature: Player starts a game

  As a player
  I want to start a game
  So that I can play blackjack with the dealer

  Scenario: start game
    Given I am not yet playing
    When I start a new game
    Then I should see "Welcome to BlackJack BDD!"
    And I should see "Here is your hand: S12, S13"
    And unless the player is bust I should see "Choose action (hit or stand)"
