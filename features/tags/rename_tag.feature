Feature: Rename a tag in my simpy account
  In order to better organize my simpy account
  As a simpy user
  I want to rename a tag in my simpy account via rsimpy

  Scenario: Renaming a tag
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I rename a user's tags
    When the "fromTag" is "cheese"
    And the "toTag" is "cheez"
    Then I expect to rename the tag with the url "http://USERNAME:PASSWORD@www.simpy.com:80/simpy/api/rest/RenameTag.do?fromTag=cheese&src=rsimpy&toTag=cheez"
    Then the response is successful