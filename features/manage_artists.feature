Feature: Manage artists
  In order to create an artist
  a register user
  wants to go to the new artist page and enter the artits information
  
  Scenario: (4) eingeloggter User kann einen Artist mit sinnvollen Attributen anlegen
    Given I am logged in
    When I follow "add new artist"
    And I fill in "Name" with "madonna"
    And I press "create"
    Then I should see "madonna"

