Feature:
  In order to view my drydiary quickly
  As a user
  I want my posts to be paginated

  Background:
    Given   I have signed in
    Given   I have created more than 100 posts

  Scenario: Initial page load
    When    I visit the homepage
    Then    I see my most recent 25 days

  Scenario: Viewing older posts
    Given   I am on the homepage
    When    I click "Older posts"
    Then    I see the previous 25 days

  Scenario: Viewing newer posts
    Given   I am viewing older posts
    When    I click "Newer posts"
    Then    I see the more recent 25 days again
