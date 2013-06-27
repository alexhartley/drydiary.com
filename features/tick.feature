Feature:
  In order to count my 'dry' days
  As a registered user
  I want to be able to tick them off

  Background:
    Given   I have signed in

  Scenario: Ticking a date
    Given   today's date is unticked
    When    I tick it
    Then    it goes green
    And     my day count increases by one

  Scenario: Unticking a date
    Given   today's date is ticked
    When    I untick it
    Then    it goes back to being grey
    And     my day count decreases by one

  Scenario: Ticking a date while editing
    Given   I am editing an unticked diary entry
    When    I tick it
    Then    it goes green
    And     I am still on the edit screen

  Scenario: Unticking a date while editing
    Given   I am editing a ticked diary entry
    When    I untick it
    Then    it goes back to being grey
    And     I am still on the edit screen

  @javascript
  Scenario: Ticking a date while editing with AJAX
    Given   I am editing an unticked diary entry
    When    I tick it and click update
    Then    it goes green

  @javascript
  Scenario: Unticking a date while editing with AJAX
    Given   I am editing a ticked diary entry
    When    I untick it and click update
    Then    it goes back to being grey

  @javascript
  Scenario: Ticking a date with AJAX
    Given   today's date is unticked
    When    I tick it
    Then    it goes green
    And     my day count increases by one

  @javascript
  Scenario: Unticking a date with AJAX
    Given   today's date is ticked
    When    I untick it
    Then    it goes back to being grey
    And     my day count decreases by one
