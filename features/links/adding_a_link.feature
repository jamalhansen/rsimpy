Feature: Post a link to a simpy account
  In order find a site later
  As a simpy user
  I want to post a link to my simpy account via rsimpy
 
  Scenario: Add link
    Given a user of "USERNAME" with a password of "PASSWORD"
    When the "link" is "http://www.example.com"
    And the "title" is "example"
    Then I expect to post the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?accessType=1&link=http%3A%2F%2Fwww.example.com&src=rsimpy&title=example"
    And the response is successful
