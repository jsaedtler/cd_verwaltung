Feature: Kommentare

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
