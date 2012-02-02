Feature: Player wins game

  When the cards have been dealt and the player makes a stand, the score is determined.
  If the player has a higher score than the dealer, then the player wins. Otherwise, he
  loses.

  Scenario: Player wins with his initial cards
    Given a dealer hand of "S8, S9"
    When  I have a hand of "S10, S11"
    And the score is determined
    Then I should see "Congratulations, you have won!"
