Feature:
  In order to document giving up
  As a registered user
  I want to be able to create and edit days

  Background:
    Given I have signed in

  Scenario: Viewing a date I haven't edited yet
    Given   today's date has no text
    When    I choose to view the day
    Then    I am told I haven't written anything yet
