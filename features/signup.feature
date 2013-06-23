Feature:
  In order to use the app
  As a new user
  I want to be able to sign up

  Background:
    Given   I am on the homepage

  Scenario: Signing up
    When    I fill in the registration form
    Then    an account is created for me and I am logged in

  Scenario: Username is already taken
    When    I try to sign up with a username that is already taken
    Then    I am told the username has already been taken
