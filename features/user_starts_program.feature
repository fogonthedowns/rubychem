Feature: user starts program
  As a user
  I want to start the program
  So that I can find the molecular mass

  Scenario: start game
    Given I am not yet using the program
    When I start the program
    Then I should see "Welcome to RubyChem!"
    And I should see "Enter a Compound:"
