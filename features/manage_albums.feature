Feature: Manage albums
  In order to create an album
  the user
  wants to enter a name
  
  Scenario: (5a) new album
    Given I am logged in
    And the following artists:
      |name   |
      |madonna|
    And I am on the new album page for madonna
    When I fill in "Title" with "Like a Virgin"
    And I press "Create Album"
    Then I should see "madonna"
    And I should see "Like a Virgin"

