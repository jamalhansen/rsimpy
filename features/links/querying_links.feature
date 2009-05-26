Feature: Query links from a simpy account
  In order find my bookmarks
  As a simpy user
  I want to query my simpy account via rsimpy
 
  Scenario: Basic link query
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I query the user's links
    Then I expect to query the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?src=rsimpy"
    Then the links are returned
    And the response is successful


