Feature:
  In order to count my 'dry' days
  As a registered user
  I want to be able to tick them off

  Background:
    Given   I have signed in

  Scenario: I tick today's date
    Given   today's date is unticked
    When    I tick it
    Then    it goes green
    And     my day count increases by one
