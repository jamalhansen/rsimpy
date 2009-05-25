Feature: Query links from a simpy account
  In order find my bookmarks
  As a simpy user
  I want to query my simpy account via rsimpy
 
  Scenario: Basic link query
    Given a user of "rsimpy" with a password of "rsimpy"
    When I use RSimpy
    And I query the user's links
    Then the links are returned

