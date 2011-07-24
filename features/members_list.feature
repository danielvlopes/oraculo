Feature: Members list
  In order to find popular members
  I want to see a list of members ordered by popularity

  Scenario: Member list
    Given some answers and questions
    When I go to the members list page
    Then I should see members ordered by his popularity
