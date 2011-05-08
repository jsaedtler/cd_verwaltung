Feature: anonymous creates a user
  In order to login
  anonymous
  wants to create new user
  
  Scenario: Register new user
    Given I am on the new user page
    When I fill in the following:
      | user_login                 | new_login       |
      | user_email                 | new@example.com |
      | user_password              | new_password    |
      | user_password_confirmation | new_password    |
    And I press "Sign up"
    Then it should create a new user

