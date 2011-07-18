Feature: An user receives private messages from other users
    In order to receive contact privately from another user
    As an user
    I want to read a private message

    Background:
        Given an user exists with the following information:
          | id | email                | password    | password_confirmation | name     |
          |  2 | rafael@example.com   | thePassword | thePassword           | Rafael   |
          |  3 | vinicius@example.com | thePassword | thePassword           | Vinicius |
        And a message exists with the following information:
          | sender_id | receiver_id | content                            |
          |         2 |           3 | Hello! This is a test message.     |
          |         3 |           2 | Cucumber is great for your health. |

    Scenario: not signed in
        Given no user exists
        When I click the private inbox link
        Then I should be on the sign in page

    Scenario: view my private inbox
        Given I am signed in
        When I click the private inbox link
        Then I should be on the messages page
        And I should see 1 message

    Scenario: read message
        Given I am signed in
        And I am on the messages page
        When I click on the 1st message
        Then I should be on the message page
        And I should see "Hello! This is a test message."

    Scenario: delete message
        Given I am signed in
        And I am on the message page
        When I follow "Delete"
        Then I should be on the messages page
        And I should see 0 messages

