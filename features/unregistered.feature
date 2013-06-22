Feature:
  In order to view the site
  As an unregistered user
  I want to be able to access pages without signing in

  Scenario: Visiting the homepage
    When    I visit the homepage
    Then    I am welcomed

  Scenario: Viewing another user's diary
    When    I visit a user's diary
    Then    I see their posts
    But     I cannot edit them

  Scenario: Viewing another user's post
    When    I visit a user's post
    Then    I can see the post
    But     I cannot edit it
