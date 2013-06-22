Feature:
  In order to document giving up
  As a registered user
  I want to be able to create and edit days

  Background:
    Given I have signed in

  Scenario: Viewing a day I haven't edited yet
    Given   today's date has no text
    When    I choose to view the day
    Then    I am told I haven't written anything yet

  Scenario: Editing a day I haven't edited yet
    Given   today's date has no text
    When    I edit the entry for that day
    Then    The text I enter appears as part of the day
