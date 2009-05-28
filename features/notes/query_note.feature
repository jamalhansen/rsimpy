Feature: Query notes from my simpy account
  In order to figure out what I said
  As a simpy user
  I want to query notes from my simpy account via rsimpy

  Scenario: Querying notes
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I query my notes
    Then I expect to query the notes with the url "http://USERNAME:PASSWORD@www.simpy.com/simpy/api/rest/GetNotes.do?src=rsimpy"
    And notes are returned
    And the response is successful

  Scenario: Querying notes with keyword
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I query my notes
    And the "q" is "goober"
    Then I expect to query the notes with the url "http://USERNAME:PASSWORD@www.simpy.com/simpy/api/rest/GetNotes.do?q=goober&src=rsimpy"
    And notes are returned
    And the response is successful

  Scenario: Querying notes with limit
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I query my notes
    And the "limit" is "1"
    Then I expect to query the notes with the url "http://USERNAME:PASSWORD@www.simpy.com/simpy/api/rest/GetNotes.do?limit=1&src=rsimpy"
    And notes are returned
    And the response is successful
