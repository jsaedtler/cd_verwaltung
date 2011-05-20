Feature: CD Verwaltung



  Scenario: (1) anonymer User kann einen User-Account anlegen
    Given I am on the new user page
    When I fill in the following:
      | user_login                 | new_login       |
      | user_email                 | new@example.com |
      | user_password              | new_password    |
      | user_password_confirmation | new_password    |
    And I press "Sign up"
    Then it should create a new user
    And I should see "Hi new_login"
    And I should see "Thanks for signing up!"

  Scenario: (2) anonymer User kann sich einloggen
    Given I am on the login page
    And the following users:
      | login    | password   | password_confirmation | email              |
      | quentin  | monkey     | monkey                | monkey@exmaple.com |
    And I am on the root page
    When I follow "login"
    And I fill in the following:
      | login    | quentin |
      | password | monkey  |
    And I press "Log In"
    Then I should see "Hi quentin"
    And I should see "Logged in successfully"

  Scenario: (3) eingeloggter User kann sich ausloggen
    Given I am logged in
    When I follow "logout"
    Then I should see "You have been logged out."

  Scenario: (4) eingeloggter User kann einen Artist mit sinnvollen Attributen anlegen
    Given I am logged in
    When I follow "New artist"
    And I fill in "Name" with "madonna"
    And I press "create"
    Then I should see "madonna"

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

  Scenario: (5b) eingeloggter User kann zu einm seiner Artist Albums mit Tracks anlegen
    Given I am logged in
    And the following albums:
      | user    | artist  | title         |
      | quentin | madonna | Like a Virgin |
    And I am on the new track page for madonna Like a Virgin
    When I fill in "Title" with "Material Girl"
    And I fill in "Duration" with "240"
    And I press "create"
    Then I should see "Track was successfully created."
    And I should see "madonna"
    And I should see "Like a Virgin"
    And I should see "Material Girl"
    And I should see "240"

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

  Scenario: (7) anonymer User kann sich eine alphabetische Liste der User anzeigen lassen
    Given the following users:
      | login    | password   | password_confirmation | email              |
      | quentin  | monkey     | monkey                | monkey@exmaple.com |
      | albert   | monkey     | monkey                | alber@exmaple.com  |
    When I am on the users page
    Then I should see sorted users

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

  Scenario: (10a) anonymer User kann einen Kommentar zu Alben schreiben
    Given the following users:
      | login    | password   | password_confirmation | email              |
      | quentin  | monkey     | monkey                | monkey@exmaple.com |
    And the following albums:
      | user    | artist  | title         |
      | quentin | madonna | Like a Virgin |
    When I am on the show album page for "Like a Virgin"
    And I fill in "comment" with "Ein Kommentar"
    And I press "Create Comment"
    Then I should see "Comment was successfully created"
    And I should see "Ein Kommentar"
    

  Scenario: (10b) registrierter User kann einen Kommentar zu Alben schreiben
    Given I am logged in
    And the following albums:
      | user    | artist  | title         |
      | quentin | madonna | Like a Virgin |
    When I am on my show album page for "Like a Virgin"
    And I fill in "comment" with "Ein Kommentar"
    And I press "Create Comment"
    Then I should see "Comment was successfully created"
    And I should see "Ein Kommentar"

  Scenario: (11) User kann nach von registrierten Usern angelegten Alben per Titel oder Artist suchen
    Given the following users:
      | login    | password   | password_confirmation | email              |
      | quentin  | monkey     | monkey                | monkey@exmaple.com |
    And the following albums:
      | user    | artist  | title         |
      | quentin | madonna | Like a Virgin |
    When I am on the index users page
    And I fill in "album_search_query" with "Virgin"
    And I press "search albums"
    Then I should see "Like a Virgin"


  Scenario: (12): User kann nach von registrierten Usern angelegten Album-Tracks per Titel oder Artist suchen
    Given the following users:
      | login    | password   | password_confirmation | email              |
      | quentin  | monkey     | monkey                | monkey@exmaple.com |
    And the following albums:
      | user    | artist  | title         |
      | quentin | madonna | Like a Virgin |
    And the following tracks:
      | albums        | title         | duration |
      | Like a Virgin | Material Girl | 250      |
    When I am on the index users page
    And I fill in "track_search_query" with "ateri"
    And I press "search tracks"
    Then I should see "Material Girl"
