Feature: Post a link to a simpy account
  In order find a site later
  As a simpy user
  I want to post a link to my simpy account via rsimpy
 
  Scenario: Add link
    Given the user "rsimpy"
    And the password "rsimpy"
    When I pass the link "http://www.example.com"
    And the title "example"
    And tell rsimpy to save
    Then the link is added to Simpy
    