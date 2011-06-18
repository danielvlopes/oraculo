Feature: Answer Questions
  In order to help others
  I want be able to post an answer

  Background:
    Given the following questions:
      | title      | body         |
      | Question 1 | Some Content |
      | Question 2 | Some Content |
  
  Scenario: Not signed in
    When I go to the sign out page
    And am on the questions page
    When I follow "Question 2"
    Then I should not see "Give your answer bellow:"

  Scenario: Signed in
    Given am on the questions page
    When I follow "Question 2"
    And fill in "Give your answer bellow:" with "Hey, I know the answer!"
    And press "Save"
    Then I should see success message
    And I should see "Hey, I know the answer!"
    