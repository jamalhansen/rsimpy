Feature: Split tags in my simpy account
  In order to better organize my simpy account
  As a simpy user
  I want to split a tag in my simpy account via rsimpy

  Scenario: Basic tag splitting
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I split a user's tags
    When the "tag" is "api"
    And the "toTag1" is "programming"
    And the "toTag2" is "interface"
    Then I expect to split the tag with the url "http://USERNAME:PASSWORD@www.simpy.com/simpy/api/rest/SplitTag.do?tag=api&toTag1=programming&toTag2=interface&src=rsimpy"
    Then the response is successful