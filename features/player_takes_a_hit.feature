Feature: Player takes a hit

  Whenever a player is not bust (and before he makes a stand) he may choose to take a hit.
  Taking a hit means that the dealer will deal one new card to the player.

  Scenario:
    Given a new deck
    When  I have a hand of "S3, S10"
    When I choose hit
    Then my hand will have 3 cards
