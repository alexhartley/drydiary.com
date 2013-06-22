Feature:
  In order to use the app
  As a registered user
  I want to be able to sign in and out

  Background:
    When    I am on the homepage

  Scenario: Logging in
    Given   I go to the sign in page
    When    I fill in my email and password
    Then    I am signed in

  Scenario: Logging out
    Given   I have signed in
    When    I choose to sign out
    Then    I am taken back to the homepage
    And     I am no longer signed in

  Scenario: Incorrect password
    When    I get my password wrong
    Then    I am informed of my error
