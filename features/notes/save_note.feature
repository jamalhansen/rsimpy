Feature: Save note to my simpy account
  In order to remember something
  As a simpy user
  I want to save a note to my simpy account via rsimpy

  Scenario: Saving a note
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I save a user's note
    And the "title" is "short note"
    Then I expect to save the note with the url "http://USERNAME:PASSWORD@www.simpy.com/simpy/api/rest/SaveNote.do?title=short+note&src=rsimpy"
    And the response is successful

  Scenario: Updating a note
    Given a user of "USERNAME" with a password of "PASSWORD"
    And I have a note with the noteId of 1234
    When I update a user's note
    And the "title" is "short note"
    And the "noteId" is "1234"
    Then I expect to update the note with the url "http://USERNAME:PASSWORD@www.simpy.com/simpy/api/rest/SaveNote.do?noteId=1234&title=short+note&src=rsimpy"
    And the response is successful

  Scenario: Saving a tagged note
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I update a user's note
    And the "title" is "short note"
    And the "tags" is "foo, bar"
    Then I expect to update the note with the url "http://USERNAME:PASSWORD@www.simpy.com/simpy/api/rest/SaveNote.do?tags=foo%2C+bar&title=short+note&src=rsimpy"
    And the response is successful

  Scenario: Saving a note with a description
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I update a user's note
    And the "title" is "short note"
    And the "description" is "thrilling"
    Then I expect to update the note with the url "http://USERNAME:PASSWORD@www.simpy.com/simpy/api/rest/SaveNote.do?description=thrilling&title=short+note&src=rsimpy"
    And the response is successful