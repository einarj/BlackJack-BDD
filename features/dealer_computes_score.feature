Feature: Dealer computes score

  The dealer needs to be able to correctly determine the score of each hand.

    Scenario Outline: compute score from hand
    Given a dealt hand
    When the hand is "<hand>"
    Then the score should be "<score>"

    Scenarios: Two cards of same sort
      | hand   | score |
      | S1, S2 | 3 |

