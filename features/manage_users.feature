Feature: User Management
  As an anonymous user I want to register
  as new user, login and log out
  
  
  Scenario: Register new user
    Given I am on the new user page
    When I fill in the following:
      | user_login                 | new_login       |
      | user_email                 | new@example.com |
      | user_password              | new_password    |
      | user_password_confirmation | new_password    |
    And I press "Sign up"
    Then it should create a new user

  Scenario: Login
    Given I am on the new session page
    When I fill in the following:
      | login    | new_login    |
      | password | new_password |
    And I press "Log in"
    Then it should log me in


  Scenario: Logout
    Given I am logged in
    When I go to logout
    Then It should log me out
