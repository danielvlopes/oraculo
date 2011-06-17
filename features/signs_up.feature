Feature: Users sign up

  Scenario: Providing valid information
    Given no user exists
    When I signup with:
      | Email                 | joao@example.com |
      | Name                  | Joao             |
      | Password              | huppeldepup      |
      | Password confirmation | huppeldepup      |
    Then should see success message
    And an email with subject "Confirmation instructions" should have been sent to joao@example.com

  Scenario: Providing invalid information
    When I go to the home page
    When I signup with:
      | Email | joao@example.com |
    Then I should see error messages
  
  Scenario: confirming the account
    Given I am registered as "joao@example.com/password"
    When I follow the confirmation link in the email sent to joao@example.com
    Then I should see success message
  
  Scenario: confirming the user with an incorrect confirmation link
    Given I am registered as "joao@example.com/password"
    When I visit the user confirmation page with token "huppeldepup"
    Then I should see "Confirmation token is invalid"
