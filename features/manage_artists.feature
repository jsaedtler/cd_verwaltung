Feature: Manage artists
  In order to create an artist
  a register user
  wants to go to the new artist page and enter the artits information
  
  Scenario: (4) Add new artist
    Given I am logged in
    And I am on my new artist page
    When I fill in "Name" with "madonna"
    And I press "create"
    Then I should see "madonna"
