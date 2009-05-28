Feature: Remove tag from my simpy account
  In order to better organize my simpy account
  As a simpy user
  I want to remove a tag from my simpy account via rsimpy

  Scenario: Removing a tag
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I remove a user's tags
    And the "tag" is "mutable"
    Then I expect to remove the tag with the url "http://USERNAME:PASSWORD@www.simpy.com/simpy/api/rest/RemoveTag.do?tag=mutable&src=rsimpy"
    Then the response is successful