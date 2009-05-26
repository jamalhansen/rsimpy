Feature: Post a link to a simpy account
  In order find a site later
  As a simpy user
  I want to post a link to my simpy account via rsimpy

  Scenario: Add a link
    Given a user of "USERNAME" with a password of "PASSWORD"
    When the "link" is "http://www.example.com"
    And the "title" is "example"
    Then I expect to post the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?accessType=1&link=http%3A%2F%2Fwww.example.com&src=rsimpy&title=example"
    And the response is successful

  Scenario: Add a private link
    Given a user of "USERNAME" with a password of "PASSWORD"
    When the "link" is "http://www.example.com"
    And the "title" is "example"
    And the "accessType" is ":private"
    Then I expect to post the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?accessType=0&link=http%3A%2F%2Fwww.example.com&src=rsimpy&title=example"
    And the response is successful

  Scenario: Add a link with a note
    Given a user of "USERNAME" with a password of "PASSWORD"
    When the "link" is "http://www.example.com"
    And the "title" is "example"
    And the "note" is "Examples are good"
    Then I expect to post the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?accessType=1&link=http%3A%2F%2Fwww.example.com&note=Examples+are+good&src=rsimpy&title=example"
    And the response is successful

  Scenario: Add a link with tags
    Given a user of "USERNAME" with a password of "PASSWORD"
    When the "link" is "http://www.example.com"
    And the "title" is "example"
    And the "tags" is "foo, bar, cheese"
    Then I expect to post the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?accessType=1&link=http%3A%2F%2Fwww.example.com&src=rsimpy&tags=foo%2C+bar%2C+cheese&title=example"
    And the response is successful

  Scenario: Add a link with a nickname
    Given a user of "USERNAME" with a password of "PASSWORD"
    When the "link" is "http://www.example.com"
    And the "title" is "example"
    And the "nickname" is "sample"
    Then I expect to post the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/SaveLink.do?accessType=1&link=http%3A%2F%2Fwww.example.com&nickname=sample&src=rsimpy&title=example"
    And the response is successful
