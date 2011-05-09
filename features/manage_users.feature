Feature: User Management
  As an anonymous user I want to register
  as new user, login and log out
  
  
  Scenario: (1) Register new user
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


  Scenario: (2a) Login
    Given I am on the root page
    When I follow "login"
    Then I should be on the login page
    
  Scenario: (2b) Login
    Given I am on the login page
    And the following users:
      | login    | password   | password_confirmation | email              |
      | quentin  | monkey     | monkey                | monkey@exmaple.com |
    When I fill in the following:
      | login    | quentin |
      | password | monkey  |
    And I press "Log In"
    Then I should see "Hi quentin"
    And I should see "Logged in successfully"


  Scenario: (3) Logout
    Given I am logged in
    When I follow "logout"
    Then I should see "You have been logged out."

  Scenario: (7) alphabetical user list
    Given the following users:
      | login    | password   | password_confirmation | email              |
      | quentin  | monkey     | monkey                | monkey@exmaple.com |
      | albert   | monkey     | monkey                | alber@exmaple.com  |
    When I am on the users page
    Then I should see sorted users
