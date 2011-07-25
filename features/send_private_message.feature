# encoding: UTF-8

Feature: An user sends a private message to another user
    In order to contact another user privately
    As an user
    I want to send a private message

    Background:
      Given no user exists
      And an user exists with the following information:
        | id | email                | password    | password_confirmation | name     |
        |  2 | rafael@example.com   | thePassword | thePassword           | Rafael   |
        |  3 | vinicius@example.com | thePassword | thePassword           | Vinicius |

    Scenario: not signed in
        Given no user exists
        When go to the new private message page
        Then I should be on the sign in page

    Scenario: send message to a specific user
        Given I am signed in
        When visit new private message page for Rafael
        Then should see Rafael as the receiver

    Scenario: access send message page to any user
        Given I am signed in
        And I am on the new question page
        When go to the new private message page
        Then I should be on the new message page
        And I should be able to select the receiver

    Scenario: send the message
        Given I am signed in
        When go to the new private message page
        And I select "Rafael" from "message_receiver_id"
        And fill in "Content" with "Hello! This is a test message."
        And press "Create Message"
        Then an email with subject "New private message" should have been sent to rafael@example.com

