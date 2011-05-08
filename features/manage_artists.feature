Feature: Manage artists
  In order to create an artist
  a register user
  wants to go to the new artist page and enter the artits information
  
  Scenario: Add new artist
    Given I am logged in
    And i am on the new artist page
    When I fill in "Name" with "madonna"
    And I press "Create"
    Then I should see "Artist: madonna"

  Scenario: Show all Artists
    Given the following artists:
      |madonna   |
      |metallica |
      |Pur       |
      
