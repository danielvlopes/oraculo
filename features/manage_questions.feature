Feature: Manage questions
  In order to clarify my doubt
  I want be able to post questions

  Scenario: Register new question
    Given I am on the new question page
    When I submit a new question
    Then I should see it in the messages board

  Scenario: Update one of my questions
    Given the following questions:
      | title       | body         |
      | Wrong Title | Some Content |
    And am on the questions page
    And I update the 1st question
      | What's your question? | Fixed Title |
    Then should see success message
    And I should see "Fixed Title"

  Scenario: Delete one of question
    Given the following questions:
      | title      | body         |
      | Question 1 | Some Content |
      | Question 2 | Some Content |
      | Question 3 | Some Content |
    And am on the questions page
    When I delete the 2nd question
    Then I should not see "Question 2"