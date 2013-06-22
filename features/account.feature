Feature:
  In order to keep my details up to date
  As a registered user
  I want to be able to update my account settings

  Background:
    Given   I have signed in

  Scenario: Changing my password
    When    I change my password
    Then    my old password no longer works
    But     my new one does

  Scenario: Securing account settings with password
    When    I try to change my account settings
    But     I forget to enter my current password
    Then    I am told I must enter my password to save the settings

  Scenario: Changing username, pronoun, and what you're giving up
    When    I change my username, pronoun and what I'm giving up
    Then    the changes are reflected in my diary

  Scenario: Trying to change to a username that already exists
    When    I try to change my username to one that has already been taken
    Then    I am told the username has already been taken
