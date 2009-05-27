Feature: Query tags from a simpy account
  In order to know more about my tags
  As a simpy user
  I want to query my simpy account via rsimpy

  Scenario: Basic tag query
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I query the user's tags
    Then I expect to query tags from the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetTags.do?src=rsimpy"
    Then the tags are returned
    And the response is successful

  Scenario: Tag query with limit
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I query the user's tags
    And the "limit" is "50"
    Then I expect to query tags from the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetTags.do?limit=50&src=rsimpy"
    Then the tags are returned
    And the response is successful