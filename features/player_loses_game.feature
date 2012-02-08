Feature: Player wins game

  When the cards have been dealt and the player makes a stand, the score is determined.
  The player loses if any of the following conditions are met:
   - Player is bust
   - Players' score is lower than the dealers' score
   - Dealer has blackjack (ace of spades + jack of either clubs or spades)
   loses.


  Scenario: Player is bust
    Given a new deck
    When the cards have been dealt
    And I choose hit
    And the score is determined
    Then I should see "You are BUST!"

  Scenario: Players score is lower than the dealers score
    Given a dealer hand of "S8, S9"
    When I have a hand of "S6, S7"
    And the score is determined
    Then I should see "You LOOSE!"

  Scenario: Dealer has blackjack
    Given a dealer hand of "S1, S10"
    When I have a hand of "C1, C5, S5"
    And the score is determined
    Then I should see "You LOOSE!"
    And I should see "Dealer has blackjack!"
