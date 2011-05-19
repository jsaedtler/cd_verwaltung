Feature: Manage albums
  In order to create an album
  the user
  wants to enter a name
  
  Scenario: (5a) eingeloggter User kann zu einm seiner Artist Albums mit Tracks anlegen
    Given I am logged in
    And the following artists:
      | name    |
      | madonna |
    And I am on the new album page for madonna
    When I fill in "Title" with "Like a Virgin"
    And I press "Create Album"
    Then I should see "Album was successfully created"
    And I should see "Like a Virgin"


  Scenario: (6) eingeloggter User kann ein Cover zu einem seiner Alben hochladen
    Given I am logged in
    And the following albums:
      | user    | artist  | title        |
      | quentin | madonna | Like a Virgin|
    And I am on the edit album page for "Like a Virgin"
    When I attach the file "features/support/a_cover.png" to "album_cover"
    And I press "Update Album"
    Then I should see "Like a Virgin"
    And I should see "Album was successfully updated"
    And I should see the image "A_cover"

  Scenario: (8) anonymer User kann sich eine alphabetische Liste der Alben eines registrierten Users anzeigen lassen
    Given the following users:
      | login    | password   | password_confirmation | email              |
      | quentin  | monkey     | monkey                | monkey@exmaple.com |
    And the following albums:
      |user    | artist  | title         |
      |quentin | madonna | Like a Virgin |
    When I am on the index users page
    And I follow "quentin"
    Then I should see "Albums"
    And I should see "madonna"
    
  Scenario: (9) anonymer User kann sich ein Album mit Cover und Tracks eines registrierten Users anzeigen lassen
    Given the following users:
      | login    | password   | password_confirmation | email              |
      | quentin  | monkey     | monkey                | monkey@exmaple.com |
    And the following albums:
      | user    | artist  | title         |
      | quentin | madonna | Like a Virgin |
    And the following tracks:
      | album         | title         | 
      | Like a Virgin | Material Girl | 
      | Like a Virgin | Angel         |
    When I am on the index users page
    And I follow "quentin"
    And I follow "Like a Virgin"
    Then I should see "Like a Virgin"
    And I should see "Material Girl"
    And I should see "Angel"
    And I should see the image "Missing"