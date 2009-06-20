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

  Scenario: Querying a tag
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I query the user's links
    And the "q" is "potato"
    Then I expect to query the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?q=potato&src=rsimpy"
    Then the links are returned
    And the response is successful

  Scenario: Limiting returned links
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I query the user's links
    And the "limit" is "5"
    Then I expect to query the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?limit=5&src=rsimpy"
    Then the links are returned
    And the response is successful

  Scenario: Querying a date
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I query the user's links
    And the "date" is "12/21/2008"
    Then I expect to query the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?date=2008-12-21&src=rsimpy"
    Then the links are returned
    And the response is successful

  Scenario: Querying a date range
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I query the user's links
    And the "beforeDate" is "1/2/2009"
    And the "afterDate" is "1/11/2009"
    Then I expect to query the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/GetLinks.do?afterDate=2009-01-11&beforeDate=2009-01-02&src=rsimpy"
    Then the links are returned
    And the response is successful


