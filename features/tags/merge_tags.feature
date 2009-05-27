Feature: Merge tags in my simpy account
  In order to better organize my simpy account
  As a simpy user
  I want to merge two tags in my simpy account via rsimpy

  Scenario: Basic tag splitting
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I merge a user's tags
    When the "toTag" is "api"
    And the "fromTag1" is "programming"
    And the "fromTag2" is "interface"
    Then I expect to merge the tags with the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/MergeTags.do?fromTag1=programming&fromTag2=interface&src=rsimpy&toTag=api"
    Then the response is successful