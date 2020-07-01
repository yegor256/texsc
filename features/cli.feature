Feature: Command Line Processing
  As a author of LaTeX document I want to check spelling

  Scenario: Help can be printed
    When I run bin/texsc with "--help"
    Then Exit code is zero
    And Stdout contains "--help"

