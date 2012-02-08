Feature: Dealer computes score

  The dealer needs to be able to correctly determine the score of each hand.

    Scenario Outline: compute score from hand
    Given a dealt hand
    When the hand is "<hand>"
    Then the score should be "<score>"

    # The value of an ace can be either 1 or 11.
    # The algorithm should choose ace value such that
    # the overall score is maximized.
    Scenarios: Two cards of same sort
      | hand   | score |
      | S1, S2 | 13 |
      | S1, S3 | 14 |
      | S1, S4 | 15 |
      | S1, S5 | 16 |
      | S1, S6 | 17 |
      | S1, S7 | 18 |
      | S1, S8 | 19 |
      | S1, S9 | 20 |
      | S1, S10 | 21 |
      | S1, S11 | 21 |
      | S1, S12 | 21 |
      | S1, S13 | 21 |

      | S2, S3 | 5 |
      | S2, S4 | 6 |
      | S2, S5 | 7 |
      | S2, S6 | 8 |
      | S2, S7 | 9 |
      | S2, S8 | 10 |
      | S2, S9 | 11 |
      | S2, S10 | 12 |
      | S2, S11 | 12 |
      | S2, S12 | 12 |
      | S2, S13 | 12 |

      | S3, S4 | 7 |
      | S3, S5 | 8 |
      | S3, S6 | 9 |
      | S3, S7 | 10 |
      | S3, S8 | 11 |
      | S3, S9 | 12 |
      | S3, S10 | 13 |
      | S3, S11 | 13 |
      | S3, S12 | 13 |
      | S3, S13 | 13 |

      | S4, S5 | 9 |
      | S4, S6 | 10 |
      | S4, S7 | 11 |
      | S4, S8 | 12 |
      | S4, S9 | 13 |
      | S4, S10 | 14 |
      | S4, S11 | 14 |
      | S4, S12 | 14 |
      | S4, S13 | 14 |
