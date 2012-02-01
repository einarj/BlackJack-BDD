Feature: Dealer deals two cards to the player

  The dealer takes a standard (french) deck and deals the 
  first two cards from the top of the deck to the player.

  Each card is labled with an alphabetic letter indicating
  its sort, using the first letter int he name of the sort
  (Hearts, Diamonds, Clovers, Spades). Following that letter
  is a number ranging from 1 (for an ace) to 13 (for a king).


  Scenario: deal two cards from an unshuffled deck
    Given a new deck of cards
    When I deal two cards
    Then they should be "S12, S13"
    And the player is bust

