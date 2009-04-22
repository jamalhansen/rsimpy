Feature: Post a link to a simpy account
  In order find a site later
  As a simpy user
  I want to post a link to my simpy account via rsimpy
 
  Scenario: Add link
    Given a user of "rsimpy" with a password of "rsimpy"
    When I use RSimpy
    And the "link" is "http://www.example.com"
    And the "title" is "example"
    And I tell RSimpy to save
    Then the link is added to Simpy
    And the link is public

  Scenario: Add private link
    Given a user of "rsimpy" with a password of "rsimpy"
    When I use RSimpy
    And the "link" is "http://www.example.com"
    And the "title" is "example"
    And I request a private link
    And I tell RSimpy to save
    Then the link is added to Simpy
    And the link is private

  Scenario: Add a link with a nickname
    Given a user of "rsimpy" with a password of "rsimpy"
    When I use RSimpy
    And the "link" is "http://www.example.com"
    And the "title" is "example"
    And the "urlNickname" is "cheeze"
    And I request a private link
    And I tell RSimpy to save
    Then the link is added to Simpy
    And the link is private
    And the uri contains "urlNickname" equals "cheeze"

  Scenario: Add a link with a note
    Given a user of "rsimpy" with a password of "rsimpy"
    When I use RSimpy
    And the "link" is "http://www.example.com"
    And the "title" is "example"
    And the "note" is "ODoyle rules"
    And I request a private link
    And I tell RSimpy to save
    Then the link is added to Simpy
    And the link is private
    And the uri contains "note" equals "ODoyle\+rules"

  Scenario: Add a link with tags
    Given a user of "rsimpy" with a password of "rsimpy"
    When I use RSimpy
    And the "link" is "http://www.example.com"
    And the "title" is "example"
    And the "tags" is "larry,curly,moe"
    And I request a private link
    And I tell RSimpy to save
    Then the link is added to Simpy
    And the link is private
    And the uri contains "tags" equals "larry%2Ccurly%2Cmoe"
    