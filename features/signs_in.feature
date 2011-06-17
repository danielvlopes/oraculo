Feature: User signs in

  Scenario: without registering
    Given no user exists with email joao@example.com
     When I sign in as "user/wrong password"
     Then I should see "Invalid email or password."

  Scenario: without confirm
    Given an user exists with the following information:
      | email             | password    | password_confirmation | name  |
      | jorge@example.com | thePassword | thePassword           | Jorge |
    When I sign in as "jorge@example.com/thePassword"
    Then I should see "You have to confirm your account before continuing."
  
  Scenario: incorrect password
    Given the following confirmed user:
    | email             | password    | password_confirmation | name  |
    | jorge@example.com | thePassword | thePassword           | Jorge |
     When I sign in as "joao@example.com/wrong password"
     Then I should see "Invalid email or password."
  
  Scenario: successfull sign in
    Given the following confirmed user:
    | email             | password    | password_confirmation | name  |
    | jorge@example.com | thePassword | thePassword           | Jorge |
    When I sign in as "jorge@example.com/thePassword"
    Then I should see " Signed in successfully."
