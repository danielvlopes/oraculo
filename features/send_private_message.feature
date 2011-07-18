Feature: An user sends a private message to another user
    In order to contact another user privately
    As an user
    I want to send a private message

    Background:
    Given an user exists with the following information:
      | id | email                | password    | password_confirmation | name     |
      |  2 | rafael@example.com   | thePassword | thePassword           | Rafael   |
      |  3 | vinicius@example.com | thePassword | thePassword           | Vinicius |

    Scenario: not signed in
        Given no user exists
        When I click the private message link
        Then I should be on the sign in page

    Scenario: access send message page to a specific user
        Given I am signed in
        And I am on the new question page
        When I click the private message link for Rafael
        Then I should be on the new message page
        And I should see Rafael as the receiver

    Scenario: access send message page to any user
        Given I am signed in
        And I am on the new question page
        When I click the private message link
        Then I should be on the new message page
        And I should be able to select the receiver

    Scenario: send the message
        Given I am signed in
        And I am on the new message page
        When I select "Rafael" from "message_receiver_id"
        And fill in "Content" with "Hello! This is a test message."
        And press "Create Message"
        Then an email with subject "New private message" should have been sent to rafael@example.com

