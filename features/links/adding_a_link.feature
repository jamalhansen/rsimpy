Feature: Post a link to a simpy account
  In order find a site later
  As a simpy user
  I want to post a link to my simpy account via rsimpy
 
  Scenario: Add link
    Given the link "http://www.google.com"
    And the user "rsimpy"
    And the password "rsimpy"
    When I add the link 
    Then the link is added to Simpy
    