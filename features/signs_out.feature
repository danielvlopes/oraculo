Feature: User signs out

  Scenario: User signs out
    Given I am signed in
    When I go to the sign out page
    Then I should be signed out