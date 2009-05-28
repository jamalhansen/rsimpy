Feature: Remove note from my simpy account
  In order to clean up my simpy account
  As a simpy user
  I want to remove a note from my simpy account via rsimpy

  Scenario: Removing a note
    Given a user of "USERNAME" with a password of "PASSWORD"
    When I remove a user's note
    And the "noteId" is "1234"
    Then I expect to remove the note with the url "http://USERNAME:PASSWORD@www.simpy.com/simpy/api/rest/DeleteNote.do?noteId=1234&src=rsimpy"
    Then the response is successful