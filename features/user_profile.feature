Feature: User Profile Settings
  As a forum user
  I want be able to define settings like TimeZone and if I want to receive email notifications

  Scenario: Main page should not have a link to Profile page when not signed in
    When I go to the main page
    Then I should not see "Profile"

  Scenario: Main page should have a link to Profile page when signed in
    Given I am signed in
    When I go to the main page
    Then I should see "Profile"

  Scenario: Profile page should have fields for "timezone" and "receive email notifications"
    Given I am signed in
    When I go to the profile page
    Then I should see "Timezone"
    And I should see "Receive email notifications"

  Scenario: Should be able to save "timezone"
    Given I am signed in
    And I am on the profile page
    When I select "Brasilia" from "Timezone"
    And I fill in "Current password" with "thePassword"
    And I press "Update"
    Then I should see "You updated your account successfully"

  Scenario: Should be able to save "receive email notifications"
    Given I am signed in
    And I am on the profile page
    When I check "Receive email notifications"
    And I fill in "Current password" with "thePassword"
    And I press "Update"
    Then I should see "You updated your account successfully"

  Scenario: Timezone and receive email notifications should be persisted
    Given I am signed in
    And I am on the profile page
    When I select "Taipei" from "Timezone"
    And I uncheck "Receive email notifications"
    And I fill in "Current password" with "thePassword"
    And I press "Update"
    And I go to the profile page
    Then the "Timezone" field should contain "Taipei"
    And the "Receive email notifications" checkbox should not be checked

