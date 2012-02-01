Feature: Dealer shuffles deck

  The dealer takes a deck of cards and shuffles it, so that the order
  of the cards is different than before.

  Scenario: Dealer shuffles new deck
    Given a new deck of cards
    When the deck is shuffled
    Then the order of cards has been changed
