Feature: Manage tracks
  In order to add new tracks
  a logged in user
  wants to fill the form
  

  Scenario: (5b) eingeloggter User kann zu einm seiner Artist Albums mit Tracks anlegen
    Given I am logged in
    And the following artists:
      |name   |
      |madonna|
    And the following albums:
      |title        |
      |Like a Virgin|
    And I am on the new track page for madonna Like a Virgin
    When I fill in "Title" with "Material Girl"
    And I fill in "Duration" with "240"
    And I press "create"
    Then I should see "madonna"
    And I should see "Like a Virgin"
    And I should see "Material Girl"
    And I should see "240"
